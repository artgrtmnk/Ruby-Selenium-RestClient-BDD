require_relative '../helpers/gql_client.rb'
require_relative '../helpers/user_data.rb'
require_relative '../helpers/assertions.rb'
require_relative '../helpers/api_helpers.rb'

gql_client = GraphqlClient.new

user_data = UserData.new
api_helpers = ApiHelpers.new

Given('GQL I set up GraphQL endpoint with url {string}') do |feature_url|
    gql_client.method = :post
    gql_client.url = feature_url
end
  
When('GQL I set a request body') do |feature_body|
    gql_client.body = api_helpers.set_body_formatted(user_data.check_for_default_data feature_body)
end
  
When('GQL I send a GQL request') do
    @response = gql_client.send_request
end
  
Then('GQL Response code is {int}') do |int|
    Assertions.assert_response_code(int, @response)
end

Then('GQL Response contains') do |feature_assertion|
    Assertions.assert_contains(feature_assertion, @response.body) 
end

Then('GQL Response does not contains') do |feature_assertion|
    Assertions.assert_not_contains(feature_assertion, @response.body) 
  end
  
Then('GQL I save user data') do
    user_data.set_user_from_response(@response)
end