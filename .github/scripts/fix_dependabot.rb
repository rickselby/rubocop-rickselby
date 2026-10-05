# frozen_string_literal: true

# Run from the trusted base branch. PR gemspecs are read as text, never evaluated.
require "base64"
require "json"
require "net/http"
require "uri"

# Fix where dependabot does not update gemspec dependencies
# rubocop:disable-next Metrics/ModuleLength
module DependabotFix
  DEPENDENCY = /
    ^(?<prefix>[ \t]*\w+\.add_(?:development_)?dependency\s*(?:\(\s*)?)
    (?<quote>["'])(?<name>[^"']+)\k<quote>(?<comma>\s*,\s*)(?<requirements>[^\r\n]+)
  /x
  PESSIMISTIC = /\A(?<quote>["'])~>\s*(?<version>\d+\.\d+\.\d+)\k<quote>(?<suffix>\s*\)?\s*(?:#.*)?)\z/
  RANGE = /
    \A(?<quote>["'])>=\s*(?<lower>\d+\.\d+(?:\.\d+)?)\k<quote>\s*,\s*
    (?<upper_quote>["'])<\s*(?<upper>\d+\.\d+(?:\.\d+)?)\k<upper_quote>
    (?<suffix>\s*\)?\s*(?:\#.*)?)\z
  /x
  REGULAR_FILE_MODES = %w[100644 100755].freeze

  # rubocop:disable-next Metrics/ClassLength
  class << self
    def version_parts(version)
      version.split(".").map(&:to_i).values_at(0, 1, 2).map { |part| part || 0 }
    end

    def fix_gemspec(before, after)
      previous_versions = pessimistic_versions(before)
      updates = []
      content = after.gsub(DEPENDENCY) do |line|
        fix_dependency(Regexp.last_match, line, previous_versions, updates)
      end
      [content, updates]
    end

    def add_notes(content, updates)
      heading = unreleased_heading(content)
      start = heading.end(0)
      finish = content.index(/^## /, start) || content.length
      notes = new_notes(content[start...finish], updates)
      notes.empty? ? content : insert_notes(content, start, finish, notes)
    end

    # rubocop:disable-next Metrics/AbcSize
    def run
      event = JSON.parse(File.read(ENV.fetch("GITHUB_EVENT_PATH")))
      repository = ENV.fetch("GITHUB_REPOSITORY")
      api = github_client(repository)
      pr = api.request("get", "pulls/#{event.fetch("pull_request").fetch("number")}")
      return unless eligible_pull_request?(pr, repository)

      changes, updates = gemspec_changes(api, pr)
      return announce_no_updates if updates.empty?

      add_release_notes(api, changes, updates, pr.fetch("head").fetch("sha"))
      update_pull_request(api, changes, pr)
      # rubocop:disable-next Rails/Pluck -- This script only uses Ruby core collections.
      puts "Updated #{updates.map { |update| update[:name] }.join(", ")} on PR ##{pr.fetch("number")}"
    end

    private

    def pessimistic_versions(content)
      previous_versions = {}
      content.gsub(DEPENDENCY) do |line|
        dependency = Regexp.last_match
        requirement = PESSIMISTIC.match(dependency[:requirements])
        next line unless requirement

        previous_versions[dependency[:name]] = version_parts(requirement[:version])
        line
      end
      previous_versions
    end

    # rubocop:disable-next Metrics/AbcSize
    def fix_dependency(dependency, line, previous_versions, updates)
      range = RANGE.match(dependency[:requirements])
      return line unless range

      lower = version_parts(range[:lower])
      upper = version_parts(range[:upper])
      return line unless previous_versions[dependency[:name]] == lower
      return line unless upper[0] == lower[0] && upper[2].zero? && upper[1] > lower[1] + 1

      version = "#{upper[0]}.#{upper[1] - 1}"
      updates << { name: dependency[:name], version: }
      "#{dependency[:prefix]}#{dependency[:quote]}#{dependency[:name]}#{dependency[:quote]}" \
        "#{dependency[:comma]}#{range[:quote]}~> #{version}.0#{range[:quote]}#{range[:suffix]}"
    end

    def unreleased_heading(content)
      /^## \[Unreleased\][^\r\n]*(?:\r?\n|\z)/.match(content) ||
        raise("Release notes file must contain ## [Unreleased]")
    end

    def new_notes(section, updates)
      updates.map { |update| "- Update `#{update[:name]}` to #{update[:version]}" }.uniq - section.split(/\r?\n/)
    end

    def insert_notes(content, start, finish, notes)
      newline = content.include?("\r\n") ? "\r\n" : "\n"
      existing = content[start...finish].sub(/\A(?:[ \t]*\r?\n)+/, "")
      content[0...start] + newline + notes.join(newline) + newline + newline + existing + content[finish..]
    end

    def github_client(repository)
      GitHub.new(token: ENV.fetch("GH_TOKEN"), repository:, api_url: ENV.fetch("GITHUB_API_URL", "https://api.github.com"))
    end

    def eligible_pull_request?(pull_request, repository)
      pull_request["state"] == "open" && pull_request.dig("user", "login") == "dependabot[bot]" &&
        pull_request.dig("head", "repo", "full_name") == repository
    end

    def gemspec_changes(api, pull_request)
      base, head = pull_request_revisions(api, pull_request)
      api.pr_files(pull_request.fetch("number")).each_with_object([{}, []]) do |file, (changes, updates)|
        add_gemspec_change(api, file, base, head, changes, updates)
      end
    end

    def pull_request_revisions(api, pull_request)
      head = pull_request.fetch("head").fetch("sha")
      comparison = api.request("get", "compare/#{pull_request.fetch("base").fetch("sha")}...#{head}")
      [comparison.fetch("merge_base_commit").fetch("sha"), head]
    end

    # rubocop:disable-next Metrics/ParameterLists
    def add_gemspec_change(api, file, base, head, changes, updates)
      path = file.fetch("filename")
      return unless file["status"] == "modified" && path.end_with?(".gemspec")

      content, file_updates = fix_gemspec(api.read_file(path, base), api.read_file(path, head))
      return if file_updates.empty?

      changes[path] = content
      updates.concat(file_updates)
    end

    def announce_no_updates
      puts "No matching widened gemspec requirements."
    end

    def write_workflow_output(name, value)
      output = ENV.fetch("GITHUB_OUTPUT", nil)
      return unless output

      File.open(output, "a") { |file| file.puts("#{name}=#{value}") }
    end

    def add_release_notes(api, changes, updates, head)
      notes_path = ENV.fetch("RELEASE_NOTES_FILE", "CHANGELOG.md")
      notes = api.read_file(notes_path, head)
      updated_notes = add_notes(notes, updates)
      changes[notes_path] = updated_notes unless updated_notes == notes
    end

    # rubocop:disable-next Metrics/AbcSize
    def update_pull_request(api, changes, pull_request)
      head = pull_request.fetch("head").fetch("sha")
      commit = api.request("get", "git/commits/#{head}")
      old_tree = api.request("get", "git/trees/#{commit.fetch("tree").fetch("sha")}?recursive=1")
      raise "Repository tree too large to safely preserve file modes" if old_tree["truncated"]

      entries = tree_entries(api, changes, old_tree)
      tree = api.request("post", "git/trees", base_tree: commit.fetch("tree").fetch("sha"), tree: entries)
      commit = create_commit(api, tree, head)
      api.request("patch", "git/refs/heads/#{encoded_branch(pull_request)}", sha: commit.fetch("sha"), force: false)
      write_workflow_output("gemspec_updated", "true")
    end

    def tree_entries(api, changes, old_tree)
      changes.map { |path, content| tree_entry(api, path, content, old_tree.fetch("tree")) }
    end

    def tree_entry(api, path, content, old_tree)
      entry = old_tree.find { |item| item["path"] == path }
      valid_file = entry && entry["type"] == "blob" && REGULAR_FILE_MODES.include?(entry["mode"])
      raise "Not a regular file: #{path}" unless valid_file

      blob = api.request("post", "git/blobs", content:, encoding: "utf-8")
      { path:, mode: entry.fetch("mode"), type: "blob", sha: blob.fetch("sha") }
    end

    def create_commit(api, tree, head)
      api.request("post", "git/commits", message: "Fix gemspec requirements and add release notes",
                  tree: tree.fetch("sha"), parents: [head])
    end

    def encoded_branch(pull_request)
      parts = pull_request.fetch("head").fetch("ref").split("/")
      parts.map { |part| URI.encode_www_form_component(part).tr("+", "%20") }.join("/")
    end
  end

  # Minimal GitHub REST client used by the trusted workflow.
  class GitHub
    def initialize(token:, repository:, api_url:)
      @token = token
      @repository = repository
      @api_url = api_url.delete_suffix("/")
    end

    def request(method, path, body = nil)
      uri = URI("#{@api_url}/repos/#{@repository}/#{path}")
      request = build_request(method, uri, body)
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https", open_timeout: 15,
                                 read_timeout: 60) { |http| http.request(request) }
      parse_response(response, method, path)
    end

    private

    def build_request(method, uri, body)
      request = Net::HTTP.const_get(method.capitalize).new(uri)
      request["Authorization"] = "Bearer #{@token}"
      request["Accept"] = "application/vnd.github+json"
      request["X-GitHub-Api-Version"] = "2022-11-28"
      request["User-Agent"] = "dependabot-gemspec-fix"
      if body
        request["Content-Type"] = "application/json"
        request.body = JSON.generate(body)
      end
      request
    end

    def parse_response(response, method, path)
      unless response.is_a?(Net::HTTPSuccess)
        # Do not include tokens or full response bodies in logs.
        raise "GitHub #{method.upcase} #{path.split("?").first} failed: HTTP #{response.code}"
      end

      JSON.parse(response.body)
    end

    public

    def read_file(path, ref)
      encoded_path = path.split("/").map { |part| URI.encode_www_form_component(part).gsub("+", "%20") }.join("/")
      data = request("get", "contents/#{encoded_path}?#{URI.encode_www_form(ref:)}")
      raise "Cannot read regular file: #{path}" unless data["type"] == "file" && data["encoding"] == "base64"

      Base64.decode64(data.fetch("content")).force_encoding(Encoding::UTF_8)
    end

    def pr_files(number)
      files = []
      page = 1
      loop do
        batch = request("get", "pulls/#{number}/files?per_page=100&page=#{page}")
        files.concat(batch)
        break if batch.length < 100

        page += 1
      end
      files
    end
  end
end

DependabotFix.run if $PROGRAM_NAME == __FILE__
