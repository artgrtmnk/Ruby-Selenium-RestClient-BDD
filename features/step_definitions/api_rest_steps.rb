require 'json'
require_relative '../helpers/api_client.rb'
require_relative '../helpers/user_data.rb'
require_relative '../helpers/assertions.rb'

api_client = ApiClient.new
user_data = UserData.new
assertions = Assertions.new

Given('I set up {string} api endpoint with url {string}') do |method, url|
    api_client.method=method
    api_client.basic_url=url
end

When('I add id to the url') do
    api_client.basic_url+=user_data.id
end

When('I set a request body') do |doc_string|
    doc_string.empty? ? api_client.body=user_data.generate_user_data : api_client.body = JSON.parse(eval(doc_string).to_json)
end
  
When('I send HTTP request') do
    @response = api_client.send_request
end
  
Then('Response code is {int}') do |int|
    assertions.assert_response_code(int, @response)
end

Then('Response contains') do |doc_string|
    assertions.assert_response_body_contains(doc_string, @response)
  end

  Then('I save user id') do
    response_body = JSON.parse(@response.body)
    user_data.id=response_body['id'].to_s
  end

