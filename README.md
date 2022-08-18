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
- Reporting: Allure

### Installation
1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
2. Install [Bundler](https://bundler.io)
3. Download the project
4. Get your token for [GoRest](https://gorest.co.in/my-account/access-tokens) (You need to register/login first)
5. Paste your token into `features/support/env.rb` into the `GOREST_TOKEN` var, line 10.
6. In the project's terminal enter `bundle install`
7. Additional step: You need to install [Allure](https://github.com/allure-framework/allure2), if you want to use it.

### Running tests
1. You can start whole test suite with `bundle exec cucumber`
2. As well, you can start it separately with `bundle exec cucumber features/***.feature`. You need to specify feature file name instead of `***`.
3. Also, you can start prefered features, using `bundle exec cucumber --tag @***`. Instead of *** you need to specify a tag. List of available tags: **api, rest, gql, ui**. _For example, `bundle exec cucumber --tag @api` would start both: RestFull and GraphQL features_.

### After test
- Framework creates allure reports, that located in `allure-results` folder.
- You can open the HTML report after test using `allure serve allure-results` command via terminal in the project's root folder.
- **Note: Allure folder would be cleared within the next test run.**

### Post scriptum
**_Antipattern was used in this sample framework: Test scenarios from API feature files are running sequentially, just because that's a sample. Never do it in a real project. Each test scenario should be independent and all of the pre-conditions should be done within the Given steps!_**
