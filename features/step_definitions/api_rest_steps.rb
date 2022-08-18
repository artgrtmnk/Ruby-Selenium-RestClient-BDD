require 'json'
require_relative '../helpers/api_client.rb'
require_relative '../helpers/user_data.rb'
require_relative '../helpers/assertions.rb'
require_relative '../helpers/api_helpers.rb'

api_client = ApiClient.new

user_data = UserData.new
api_helpers = ApiHelpers.new

Given('I set up {string} api endpoint with url {string}') do |method, url|
    api_client.method=api_client.set_request_method(method)
    api_client.url=url
end

When('I add id to the url') do
    api_client.url+=user_data.user['id']
end

When('I set a request body') do |feature_body|
    feature_body.empty? ? 
        api_client.body=user_data.generate_user_data : 
        api_client.body = api_helpers.set_body_formatted(feature_body)
end
  
When('I send HTTP request') do
    @response = api_client.send_request
end
  
Then('Response code is {int}') do |int|
    Assertions.assert_response_code(int, @response)
    api_client.body=nil # Making body nil, because next request could have an empty body and it could cause errors
end

Then('Response contains') do |feature_assertion|
    Assertions.assert_contains(feature_assertion, @response.body)
end

Then('I save user id') do
    response_body = JSON.parse(@response.body)
    user_data.user['id']=response_body['id'].to_s
end

