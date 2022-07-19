Feature: Gorest Rest API

  Scenario: Get user list
    Given I set up 'GET' api endpoint with url 'https://gorest.co.in/public/v2/users'
    When I set request headers
    And I send HTTP request
    Then Response code is 200

  Scenario: Create new user
    Given I set up 'POST' api endpoint with url 'https://gorest.co.in/public/v2/users'
    When I set request headers
    And I set a request body
    And I send HTTP request
    Then Response code is 201
