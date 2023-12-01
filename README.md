# My rubocop setup

Config in `./config`

## Usage

Add `rubocop-rickselby` to your Gemfile:

  ```ruby
  gem "rubocop-rickselby", require: false
  ```

Inherit the configuration in your `.rubocop.yml`:

  ```yaml
  # .rubocop.yml
  inherit_gem:
    rubocop-rickselby:
    - config/default.yml # generic Ruby rules and cops
    - config/rails.yml # Rails-specific rules and cops
    - config/rspec.yml # RSpec-specific rules and cops
  ```
