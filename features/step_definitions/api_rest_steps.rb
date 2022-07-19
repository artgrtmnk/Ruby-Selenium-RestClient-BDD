require 'rubygems'
require 'cucumber'
require 'faker'
require 'json'
require_relative '../helpers/api_client.rb'

rest_client = ApiClient.new
bearer_token = 'Bearer ' + '594add4a6e80e6bfeb2b345424060aad3bba0d538628eeff491d774957ee834a'
call_response = nil

Given('I set up {string} api endpoint with url {string}') do |method, url|
    rest_client.method=method
    rest_client.basic_url=url
end
  
When('I set request headers') do
    rest_client.headers={Authorization: bearer_token}
end

When('I set a request body') do
    genders = ['male', 'female']
    #request_body = `{"name":"#{Faker::Name.name}", "gender":"#{genders.sample}", "email":"#{Faker::Internet.email}","status":"active"}`
    request_body = {
        "name":"#{Faker::Name.name}", 
        "gender":"#{genders.sample}", 
        "email":"#{Faker::Internet.email}",
        "status":"active"
    }
    # p request_body
    # rest_client.body=JSON.parse(request_body)
    rest_client.body=JSON.parse(request_body.to_s)
    p rest_client.body
  end
  
When('I send HTTP request') do
    call_response = rest_client.send_request
end
  
Then('Response code is {int}') do |int|
    rest_client.assert_response_code(int, call_response)
end

# When('I set request body with') do |doc_string|
#     pending # Write code here that turns the phrase above into concrete actions
# end
