# My rubocop setup

Config in `./config`

## Installation

Add `rubocop-rickselby` to your Gemfile:

```ruby
group :development, :test do
  gem "rubocop-rickselby", "~> 0.14", require: false
end
```

Inherit the desired configuration in your `.rubocop.yml`:

```yaml
# .rubocop.yml
inherit_gem:
  rubocop-rickselby:
    - config/default.yml # generic Ruby rules and cops
    - config/capybara.yml # capybara-specific rules and cops
    - config/factory_bot.yml # factory_bot-specific rules and cops
    - config/rails.yml # Rails-specific rules and cops
    - config/rspec.yml # RSpec-specific rules and cops
    - config/rspec_rails.yml # RSpec-specific rules and cops for rails
    - config/sequel.yml # sequel-specific rules and cops
```

You can override cops in your own local `.rubocop.yml` file as required.

### `erb-lint`

Config is also available for [https://github.com/Shopify/erb-lint](erb-lint).

Add a local `.erb-lint.yml` file to your project:

```yaml
---
exclude:
  - 'node_modules/**/*'
  - 'vendor/**/*'
inherit_gem:
  rubocop-rickselby:
    - config/erb-lint.yml
```

The default file path is `**/*.html{+*,}.erb` - this can be changed with a `glob` setting in `.erb-lint.yml`, e.g.

```yaml
---
glob: "**/*.erb"
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/rickselby/rubocop-rickselby.

## License
The gem is available as open source under the terms of the MIT License.
