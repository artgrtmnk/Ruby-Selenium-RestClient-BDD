require 'rubygems'
require 'selenium-webdriver'
require 'rest-client'
require 'cucumber'
require 'page-object/page_factory'
require 'webdrivers'
require 'solid_assert'
require 'allure-cucumber'
require 'json'

# Token parsing
tokenJson = JSON.parse(File.read('./token.json'))
ENV['GOREST_TOKEN']="Bearer #{tokenJson['token']}"

# Selenium WebDriver
begin
  $driver = Selenium::WebDriver.for :chrome
  $driver.manage.timeouts.implicit_wait = 10
  $driver.manage.window.maximize
  $wait = Selenium::WebDriver::Wait.new(:timeout => 10)
rescue Exception => e
  puts e.message
  Process.exit(0)
end

# Allure Reporter
AllureCucumber.configure do |config|
  config.results_directory = "allure-results"
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
end

# API Debugger - Uncomment/Comment the below line to turn on/off
# RestClient.log = 'stdout' 

# Globals
SolidAssert.enable_assertions
World(PageObject::PageFactory)