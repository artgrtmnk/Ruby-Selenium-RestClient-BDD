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

## Locally on your machine
### Installation
1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/).
2. Install [rbenv](https://github.com/rbenv/rbenv#installation).
3. Install [Bundler](https://bundler.io).
4. Download the project.
5. Get your token for [GoRest](https://gorest.co.in/my-account/access-tokens) (You need to register/login first).
6. Paste your token into `features/support/env.rb` into the `GOREST_TOKEN` var, line 10.
7. In the project's terminal enter `bundle install`.
8. Additional step: You need to install [Allure](https://github.com/allure-framework/allure2), if you want to use it.

### Running tests
1. You can start whole test suite with `bundle exec cucumber`.
2. As well, you can start it separately with `bundle exec cucumber features/***.feature`. You need to specify feature file name instead of `***`.
3. Also, you can start prefered features, using `bundle exec cucumber --tag @***`. Instead of *** you need to specify a tag. List of available tags: **api, rest, gql, ui**. _For example, `bundle exec cucumber --tag @api` would start both: RestFull and GraphQL features_.

### After test
- Framework creates allure reports, that located in `allure-results` folder.
- You can open the HTML report after test using `allure serve allure-results` command via terminal in the project's root folder.
- **Note: Allure folder would be cleared within the next test run.**

## Jenkins CI
### Installation
1. Install [Jenkins](https://www.jenkins.io).
2. Install default plugins in Jenkins.
3. As well there is a list of plugins that you need to install additionally via Jenkins > Manage Jenkins > Manage Plugins: Allure Jenkins Plugin,Git Plugin, GitHub plugin, HTML Publisher plugin.
4. Create a new Job with `Pipeline` type.
5. Job configuration:
- Enable `GitHub Project` checkbox and paste my project's git url
- Enable `This project is parameterised` checkbox and add a String parameter named `token`, it is important!
- Scroll down to the Pipeline section and choose `Pipeline script from SCM`, then choose Git as an option.
- Paste my project's url to the repo's url field: `https://github.com/artgrtmnk/Ruby-Selenium-RestClient-BDD/` and specify the branch name a bit lower as: `*/main`.
- Apply and Save the pipeline.

### Running tests
1. Click on `Build with Parameters` in the left nav menu.
2. Paste your GoRest token into the token var field.
3. Click `Build` button

### After test
- Allure report would be generated automatically. The only thing you need to do is to click on `Allure Report` button in the left nav menu.
- **Note: Allure folder would be cleared within the next test run.**

### Post scriptum
**_Antipattern was used in this sample framework: Test scenarios from API feature files are running sequentially, just because that's a sample. Never do it in a real project. Each test scenario should be independent and all of the pre-conditions should be done within the Given steps!_**
