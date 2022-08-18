# Ruby-Selenium-RestClient-BDD

### About
**Overview:** _Ruby UI and API with BDD testing framework sample._

**Systems under test:**
- UI: Oracle login application.
- API: Gorest.co.in Rest and GraphQL application.

**Technology stack:**
- Basic: Ruby, RSpec
- BDD: Cucumber
- UI: Selenium, Page-Object(gem)
- API: Rest-Client

### Installation
1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
2. Install [Bundler](https://bundler.io)
3. Download the project
4. Get your token for [GoRest](https://gorest.co.in/my-account/access-tokens) (You need to register/login first)
5. Paste your token into `features/support/env.rb` into the `GOREST_TOKEN` var, line 9.
6. In the project's terminal enter `bundle install`
7. Additional step: You need to install [Allure](https://github.com/allure-framework/allure2), if you want to use it.

### Running tests
1. You can start whole test suite with `bundle exec cucumber`
2. As well, you can start it separately with `bundle exec cucumber features/***.feature`. You need to specify feature file name instead of `***`.
