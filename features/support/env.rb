require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'
require 'page-object/page_factory'
require 'webdrivers'

begin
  $driver = Selenium::WebDriver.for(:"chrome")
  $driver.manage().window().maximize()
rescue Exception => e
  puts e.message
  Process.exit(0)
end

World(PageObject::PageFactory)