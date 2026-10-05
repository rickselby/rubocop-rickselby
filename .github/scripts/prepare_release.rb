# frozen_string_literal: true

# Updates release metadata from the version and optional notes supplied by Actions.
module PrepareRelease
  class << self
    def run
      version = ENV.fetch("RELEASE_VERSION")
      validate_version(version)
      previous_version = update_version(version)
      update_changelog(version)
      update_lockfile(previous_version, version)
    end

    private

    def validate_version(version)
      return if /\A\d+\.\d+\.\d+\z/.match?(version)

      abort "Version must be X.Y.Z"
    end

    def update_version(version)
      source = File.read(version_path)
      match = /VERSION = "(?<version>[^"]+)"/.match(source)
      abort "Could not find VERSION constant" unless match

      File.write(version_path, source.sub(match[0], "VERSION = \"#{version}\""))
      match[:version]
    end

    def update_changelog(version)
      changelog = File.read(changelog_path)
      abort "CHANGELOG.md already contains #{version}" if release_heading?(changelog, version)

      heading = unreleased_heading(changelog)
      changelog = insert_release(changelog, heading, version)
      File.write(changelog_path, update_reference_links(changelog, version))
    end

    def release_heading?(changelog, version)
      changelog.match?(/^## \[#{Regexp.escape(version)}\](?:\s|$)/)
    end

    def unreleased_heading(changelog)
      /^## \[Unreleased\][^\r\n]*(?:\r?\n|\z)/.match(changelog) ||
        abort("CHANGELOG.md has no Unreleased section")
    end

    def insert_release(changelog, heading, version)
      section_end = changelog.index(/^## /, heading.end(0)) || changelog.length
      entries = release_entries(changelog[heading.end(0)...section_end])
      newline = changelog.include?("\r\n") ? "\r\n" : "\n"
      date = Time.now.utc.strftime("%F")
      release_heading = "## [Unreleased]#{newline}#{newline}" \
                        "## [#{version}] - #{date}#{newline}#{newline}"
      release = "#{release_heading}#{entries}#{newline}#{newline}"
      changelog[0...heading.begin(0)] + release + changelog[section_end..]
    end

    def release_entries(section)
      entries = section.sub(/\A(?:[ \t]*\r?\n)+/, "").strip
      entries = [entries, ENV.fetch("RELEASE_NOTES", "").strip].reject(&:empty?).join("\n\n")
      return entries unless entries.empty?

      abort "CHANGELOG.md has no Unreleased entries"
    end

    def update_reference_links(changelog, version)
      reference = %r{^\[unreleased\]: (.+/compare/v)(.+)\.\.\.HEAD$}.match(changelog)
      abort "CHANGELOG.md has no Unreleased comparison link" unless reference

      newline = changelog.include?("\r\n") ? "\r\n" : "\n"
      replacement = "[unreleased]: #{reference[1]}#{version}...HEAD#{newline}" \
                    "[#{version}]: #{reference[1]}#{reference[2]}...v#{version}"
      changelog.sub(reference[0], replacement)
    end

    def update_lockfile(previous_version, version)
      lockfile = File.read(lockfile_path)
      pattern = /rubocop-rickselby \(#{Regexp.escape(previous_version)}\)/
      abort "Gemfile.lock has an unexpected rubocop-rickselby entry" unless lockfile.scan(pattern).length == 2

      File.write(lockfile_path, lockfile.gsub(pattern, "rubocop-rickselby (#{version})"))
    end

    def version_path
      "lib/rubocop/rickselby/version.rb"
    end

    def changelog_path
      "CHANGELOG.md"
    end

    def lockfile_path
      "Gemfile.lock"
    end
  end
end

PrepareRelease.run
