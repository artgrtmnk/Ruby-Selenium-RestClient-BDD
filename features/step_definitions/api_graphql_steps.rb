require 'json'
require_relative '../helpers/api_gql_client.rb'
require_relative '../helpers/user_data.rb'
require_relative '../helpers/assertions.rb'

gql_client = GraphqlClient.new
assertions = Assertions.new
user_data = UserData.new

Given('GQL I set up GraphQL endpoint with url {string}') do |feature_url|
    gql_client.url=feature_url
end
  
When('GQL I set a request body') do |feature_body|
    gql_client.set_body_formatted(user_data.check_for_default_data feature_body)
end
  
When('GQL I send a GQL request') do
    @response = gql_client.send_request
    p JSON.parse(@response.body)
end
  
Then('GQL Response code is {int}') do |int|
    assertions.assert_response_code(int, @response)
end

Then('GQL Response contains') do |feature_assertion|
    assertions.assert_response_body_contains(feature_assertion, @response) 
end

Then('GQL Response does not contains') do |feature_assertion|
    assertions.assert_response_body_not_contains(feature_assertion, @response) 
  end
  
Then('GQL I save user data') do
    user_data.set_user_from_response(@response)
end