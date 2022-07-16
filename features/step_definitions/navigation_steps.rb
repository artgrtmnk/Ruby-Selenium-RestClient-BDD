require './features/page_objects/login_page.rb'
require 'selenium-webdriver'
require 'cucumber'

login_page = LoginPage.new($driver)

Given("User has opened Oracle Profile page") do
  login_page.goto
end
