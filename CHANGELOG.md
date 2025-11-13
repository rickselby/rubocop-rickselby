## [Unreleased]

- Update `rubocop-rspec_rails` to 2.32
- Update `rubocop-rspec` to 3.8

## [0.64.1] - 2025-11-08

- Roll back change to enforcing `it` block parameters

## [0.64.0] - 2025-11-08

- Use the exact target when clicking using Capybara
- Check for `require_dependency` in Rails apps
- Check where a failed save would not throw an error
- Don't open modules and define specs inside them

## [0.63.0] - 2025-11-07

- Use 3.1's shorthand hash syntax where possible (`Style/HashSyntax`)
- Use `it` block parameter where possible (`Style/ItBlockParameter`)
- Drop support for Ruby 3.0 and 3.1

## [0.62.0] - 2025-09-26

- Update `rubocop-performance` to 1.26.x
- Update `rubocop` to 1.81.x
- Change trailing commas to use diff_comma format

## [0.61.0] - 2025-09-03

- Update `rubocop-rails` to 2.33.x
- Update `rubocop` to 1.80.x
- Update `rubocop-rspec` to 3.7.x

## [0.60.0] - 2025-07-26

- Update `rubocop` to 1.79.x

## [0.59.0] - 2025-07-10

- Update `rubocop` to 1.78.x

## [0.58.0] - 2025-06-21

- Update `rubocop` to 1.77.x

## [0.57.0] - 2025-05-23

- Update `rubocop-rails` to 2.32.x

## [0.56.0] - 2025-04-26

- Update `rubocop-performance` to 1.25.x
- Update `rubocop-rails` to 2.31.x
- Update `rubocop-rspec` to 3.6.x

## [0.55.0] - 2025-03-28

- Update `rubocop` to 1.75.x

## [0.54.0] - 2025-03-13

- Update `rubocop` to 1.74.0
- Update `rubocop-capybara` to 2.22.0
- Update `rubocop-rspec_rails` to 2.31.0

## [0.53.0] - 2025-03-07

- Update `rubocop-factory_bot` to 2.27.0
- Update `rubocop-sequel` to 0.4.0

## [0.52.0] - 2025-02-26

- Use `plugins` instead of `require` where possible
- Update `rubocop` to 1.73.0

## [0.51.0] - 2025-02-19

- Update `rubocop` to 1.72.0
- Update `rubocop-performance` to 3.5.0
- Update `rubocop-rails` to 2.30.0
- Update `rubocop-rake` to 0.7.0
- Update `rubocop-rspec` to 3.5.0

## [0.50.0] - 2025-01-25

- Update `erb_lint` to 0.9.0
- Update `rubocop` to 1.71.0
- Update `rubocop-rails` to 2.29.0
- Update `rubocop-rspec` to 3.4.0

## [0.49.0] - 2025-01-10

- Update `erb_lint` to 0.8.0
- Update `rubocop` to 1.70.0

## [0.48.0] - 2024-12-31

- Update `rubocop-rails` to 2.28.0

## [0.47.0] - 2024-12-14

- Update `rubocop-rspec` to 3.3.0

## [0.46.0] - 2024-11-27

- Update `rubocop` to 1.69.0

## [0.45.0] - 2024-11-16

- Update `rubocop-performance` to 1.23.0

## [0.44.0] - 2024-11-01

- Update `rubocop-rails` to 2.27.0
- Update `rubocop-rspec` to 3.2.0
- Update `rubocop` to 1.68.0

## [0.43.0] - 2024-10-17

- Update `rubocop` to 1.67.0
- Update `erb_lint` to 0.7.0

## [0.42.0] - 2024-10-05

- Exclude `Metrics/AbcSize` from rails migrations

## [0.41.0] - 2024-10-03

- Update `rubocop-rspec` to 3.1.0

## [0.40.0] - 2024-09-30

- Exclude `Metrics/MethodLength` from rails migration methods

## [0.39.0] - 2024-09-18

- Update `rubocop-performance` to 1.22.0
 
## [0.38.0] - 2024-09-07

- Add `rexml` as a dependency for `erb_lint`

## [0.37.0] - 2024-09-02

- Update `rubocop` to 1.66.0

## [0.36.0] - 2024-08-28

- Update `rubocop-rails` to 2.26.0

## [0.35.0] - 2024-08-12

- Update `erb_lint` to 0.6.0

## [0.34.0] - 2024-07-13

- Update `rubocop` to 1.65.0

## [0.33.0] - 2024-06-14

- Update `rubocop-rspec` to 3.0.1
- Add `rubocop-rspec_rails` explicitly (was previously required through `rubocop-rspec`)

## [0.32.0] - 2024-06-10

- Update `rubocop-factory_bot` to 2.26.0 
- Update `rubocop-capybara` to 2.21.0

## [0.31.0] - 2024-06-08

- Update `rubocop-rspec` to 2.31.0

## [0.30.0] - 2024-05-18

- Update `rubocop` to 1.64.0

## [0.29.0] - 2024-05-18

- Update `rubocop-rails` to 2.25.0

## [0.28.0] - 2024-04-13

- Update `rubocop` to 1.63.1
- Update `rubocop-rails` to 2.24.1

## [0.27.0] - 2024-04-06

- Update `rubocop-rspec` to 2.29.1

## [0.26.0] - 2024-04-02

- Update `rubocop-performance` to 1.21.0
- Update `rubocop-rspec` to 2.28.0

## [0.25.0] - 2024-03-06

- Update `rubocop` to 1.62.0

## [0.24.0] - 2024-03-05

- Update `rubocop-rails` to 2.24.0

## [0.23.0] - 2024-03-02

- Update `rubocop` to 1.61.0
- Update `rubocop-rspec` to 2.27.0

## [0.22.0] - 2024-02-27

- Rename `factory-bot.yml` to `factory_bot.yml`
- Set `FactoryBot/ConsistentParenthesesStyle` to omit parenthesis

## [0.21.0] - 2024-02-26

- Update `RSpec/MultipleMemoizedHelpers`; set `Max` to `10`.

## [0.20.1] - 2024-02-22

- Fix parameter name for `RSpec/NestedGroups`

## [0.20.0] - 2024-02-22

- Increase maximum nesting for `RSpec/NestedGroups` to 5
- Reorder some definitions alphabetically

## [0.19.0] - 2024-02-14

- Disable `Layout/HashAlignment` in erb files

## [0.18.0] - 2024-02-10

- Disable alignment of `let` block braces
  - any change to a single line may have to change other lines, which isn't nice
- Disable `RSpec/MultipleExpectations` and `RSpec/ExampleLength` for `spec/system` folder

## [0.17.0] - 2024-02-10

- Update `rubocop-rails-accessibility` to 1.0.1

## [0.16.0] - 2024-01-20

- Update `rubocop` to 1.60.1

## [0.15.0] - 2024-01-11

- Don't enforce documentation on rails mailers

## [0.14.0] - 2024-01-10

- Add configuration for `erb-lint`

## [0.13.0] - 2024-01-09

- Configure cops for RSpec
- Configure cops for Rails
- Add `sequel` extension
- Add `factory_bot` extension

## [0.12.0] - 2024-01-08

- Don't try to remove parentheses for method calls

## [0.11.1] - 2024-01-06

- No changes; trying to bump version so rubygems sees the update

## [0.11.0] - 2024-01-06

- Don't check for unnecessary line breaks

## [0.10.0] - 2024-01-06

- Require all gems so we can pin them to specific versions and keep the configuration up to date

## [0.9.0] - 2024-01-05

- Enable and configure many cops
  - (too many to list here, sorry) 

## [0.8.0] - 2023-12-18

- Bump `rubocop` to 1.59
- Bump `rubocop-performance` to 1.20

## [0.7.0] - 2023-12-06

- Disable certain cops for rails config directory

## [0.6.0] - 2023-12-05

- Disable certain performance cops when using Rails

## [0.5.0] - 2023-12-03

- Support all supported rubies (currently 3.0+)

## [0.4.0] - 2023-12-03

- Separate `rspec` and `capybara`

## [0.3.0] - 2023-12-03

- Don't require class documentation for rails migrations

## [0.2.0] - 2023-12-03

- Display style guide for all cops
- Allow short parameter names
- Don't require class documentation for rails controller and models 

## [0.1.0] - 2023-12-01

- Initial release

[unreleased]: https://github.com/rickselby/rubocop-rickselby/compare/v0.61.0...HEAD
[0.61.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.60.0...v0.61.0
[0.60.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.59.0...v0.60.0
[0.59.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.58.0...v0.59.0
[0.58.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.57.0...v0.58.0
[0.57.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.56.0...v0.57.0
[0.56.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.55.0...v0.56.0
[0.55.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.54.0...v0.55.0
[0.54.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.53.0...v0.54.0
[0.53.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.52.0...v0.53.0
[0.52.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.51.0...v0.52.0
[0.51.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.50.0...v0.51.0
[0.50.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.49.0...v0.50.0
[0.49.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.48.0...v0.49.0
[0.48.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.47.0...v0.48.0
[0.47.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.46.0...v0.47.0
[0.46.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.45.0...v0.46.0
[0.45.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.44.0...v0.45.0
[0.44.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.43.0...v0.44.0
[0.43.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.42.0...v0.43.0
[0.42.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.41.0...v0.42.0
[0.41.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.40.0...v0.41.0
[0.40.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.39.0...v0.40.0
[0.39.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.38.0...v0.39.0
[0.38.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.37.0...v0.38.0
[0.37.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.36.0...v0.37.0
[0.36.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.35.0...v0.36.0
[0.35.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.34.0...v0.35.0
[0.34.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.33.0...v0.34.0
[0.33.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.32.0...v0.33.0
[0.32.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.31.0...v0.32.0
[0.31.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.30.0...v0.31.0
[0.30.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.29.0...v0.30.0
[0.29.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.28.0...v0.29.0
[0.28.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.27.0...v0.28.0
[0.27.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.26.0...v0.27.0
[0.26.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.25.0...v0.26.0
[0.25.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.24.0...v0.25.0
[0.24.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.23.0...v0.24.0
[0.23.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.22.0...v0.23.0
[0.22.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.21.0...v0.22.0
[0.21.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.20.1...v0.21.0
[0.20.1]: https://github.com/rickselby/rubocop-rickselby/compare/v0.20.0...v0.20.1
[0.20.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.19.0...v0.20.0
[0.19.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.18.0...v0.19.0
[0.18.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.17.0...v0.18.0
[0.17.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.16.0...v0.17.0
[0.16.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.15.0...v0.16.0
[0.15.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.14.0...v0.15.0
[0.14.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.13.0...v0.14.0
[0.13.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.12.0...v0.13.0
[0.12.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.11.1...v0.12.0
[0.11.1]: https://github.com/rickselby/rubocop-rickselby/compare/v0.11.0...v0.11.1
[0.11.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.10.0...v0.11.0
[0.10.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.9.0...v0.10.0
[0.9.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.8.0...v0.9.0
[0.8.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/rickselby/rubocop-rickselby/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/rickselby/rubocop-rickselby/releases/tag/v0.1.0
