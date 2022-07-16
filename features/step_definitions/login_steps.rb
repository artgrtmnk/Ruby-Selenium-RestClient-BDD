require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'
require_relative '../page_objects/login_page.rb'

login_page = LoginPage.new($driver)
  
When("User inputs {string} as email") do |email|
  login_page.enter_email(email)
end
  
When("User inputs {string} as password") do |password|
  login_page.enter_password(password)
end

When("User presses Sign In button") do
  login_page.click_login
end
  
Then("User sees invalid credentials message") do
    login_page.check_error_message("Invalid username and/or password.")
end
