# frozen_string_literal: true

require_relative "lib/rubocop/rickselby/version"

Gem::Specification.new do |spec|
  spec.name = "rubocop-rickselby"
  spec.version = Rubocop::Rickselby::VERSION
  spec.authors = ["Rick Selby"]
  spec.email = ["rick@selby-family.co.uk"]

  spec.summary = "Code styling for my projects"
  spec.homepage = "https://github.com/rickselby/rubocop-rickselby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rickselby/rubocop-rickselby"
  spec.metadata["changelog_uri"] = "https://github.com/rickselby/rubocop-rickselby/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir["README.md", "STYLEGUIDE.md", "LICENSE.text", "config/*.yml", "lib/**/*.rb"]

  spec.add_dependency "rubocop", "~> 1.58.0"
  spec.add_dependency "rubocop-performance", ">= 1.19", "< 1.21"
  spec.add_dependency "rubocop-rake", "~> 0.6.0"

  spec.metadata["rubygems_mfa_required"] = "true"
end
