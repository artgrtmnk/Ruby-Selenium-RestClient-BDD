require 'rubygems'
require 'cucumber'
require 'json'
require_relative '../helpers/api_client.rb'
require_relative '../helpers/user_data.rb'

api_client = ApiClient.new
user_data = UserData.new
bearer_token = 'Bearer ' + '594add4a6e80e6bfeb2b345424060aad3bba0d538628eeff491d774957ee834a'
response = nil

Given('I set up {string} api endpoint with url {string}') do |method, url|
    api_client.method=method
    api_client.basic_url=url
end
  
When('I set request headers') do
    api_client.headers={Authorization: bearer_token}
end

When('I add id to the url') do
    api_client.basic_url+=user_data.id
end

When('I set a request body') do |doc_string|
    doc_string.empty? ? api_client.body=user_data.generate_user_data : api_client.body = JSON.parse(eval(doc_string).to_json)
end
  
When('I send HTTP request') do
    response = api_client.send_request
    p JSON.parse(response.body)
end
  
Then('Response code is {int}') do |int|
    api_client.assert_response_code(int, response)
end

Then('Response contains') do |doc_string|
    api_client.assert_response_body_contains(doc_string, response)
  end

  Then('I save user id') do
    response_body = JSON.parse(response.body)
    user_data.id=response_body['id'].to_s
  end

