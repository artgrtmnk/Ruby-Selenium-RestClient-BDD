require 'rubygems'
require 'selenium-webdriver'
require 'rest-client'
require 'cucumber'
require 'page-object/page_factory'
require 'webdrivers'
require 'solid_assert'

ENV['GOREST_TOKEN']="Bearer PASTE_YOUR_TOKEN_OVER_HERE"

begin
  $driver = Selenium::WebDriver.for :chrome
  $driver.manage.timeouts.implicit_wait = 10
  $driver.manage.window.maximize
  $wait = Selenium::WebDriver::Wait.new(:timeout => 10)
rescue Exception => e
  puts e.message
  Process.exit(0)
end

# RestClient.log = 'stdout' # API Debugger

SolidAssert.enable_assertions
World(PageObject::PageFactory)