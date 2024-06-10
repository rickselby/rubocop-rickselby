# frozen_string_literal: true

require_relative "lib/rubocop/rickselby/version"

Gem::Specification.new do |spec|
  spec.name = "rubocop-rickselby"
  spec.version = Rubocop::RickSelby::VERSION
  spec.authors = ["Rick Selby"]
  spec.email = ["rick@selby-family.co.uk"]

  spec.summary = "Code styling for my projects"
  spec.homepage = "https://github.com/rickselby/rubocop-rickselby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rickselby/rubocop-rickselby"
  spec.metadata["changelog_uri"] = "https://github.com/rickselby/rubocop-rickselby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir["README.md", "STYLEGUIDE.md", "LICENSE.text", "config/*.yml", "lib/rubocop/rickselby/version.rb"]

  spec.add_dependency "erb_lint", "~> 0.5.0"
  spec.add_dependency "rubocop", "~> 1.64.0"
  spec.add_dependency "rubocop-capybara", "~> 2.20.0"
  spec.add_dependency "rubocop-factory_bot", ">= 2.25", "< 2.27"
  spec.add_dependency "rubocop-performance", "~> 1.21.0"
  spec.add_dependency "rubocop-rails", "~> 2.25.0"
  spec.add_dependency "rubocop-rails-accessibility", "~> 1.0.0"
  spec.add_dependency "rubocop-rake", "~> 0.6.0"
  spec.add_dependency "rubocop-rspec", "~> 2.31.0"
  spec.add_dependency "rubocop-sequel", "~> 0.3.4"

  spec.metadata["rubygems_mfa_required"] = "true"
end
