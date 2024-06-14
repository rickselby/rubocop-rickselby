## [Unreleased]

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

- Fix parameter name for RSpec/NestedGroups

## [0.20.0] - 2024-02-22

- Increase maximum nesting for RSpec example groups to 5
- Reorder some definitions alphabetically

## [0.19.0] - 2024-02-14

- Disable `Layout/HashAlignment` in erb files

## [0.18.0] - 2024-02-10

- Disable alignment of let block braces
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
