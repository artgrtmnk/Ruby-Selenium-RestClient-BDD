# Ruby-Selenium-RestClient-BDD
UI: Selenium and Page-Object 
API: Rest-Client
BDD: Cucumber

### Installation
1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
2. Install [Bundler](https://bundler.io)
3. Download the project
4. Get your token for [GoRest](https://gorest.co.in/my-account/access-tokens) (You need to register/login first)
5. Past your token into `features/support/env.rb` into the `GOREST_TOKEN` var (line 9).
6. In the project's terminal enter `bundle install`

### Running tests
You can start whole test suite with `bundle exec cucumber`

As well, you can start it separately with `bundle exec cucumber features/***.feature`
Note: you need to paste feature name instead of `***`


