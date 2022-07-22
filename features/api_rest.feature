Feature: Gorest Rest API

  Scenario: Get user list
    Given I set up 'GET' api endpoint with url 'https://gorest.co.in/public/v2/users/'
    When I set request headers
    And I send HTTP request
    Then Response code is 200

  Scenario: Create new user
    Given I set up 'POST' api endpoint with url 'https://gorest.co.in/public/v2/users/'
    When I set request headers
    And I set a request body
      """
      """
    And I send HTTP request
    Then Response code is 201
    And Response contains
      """
      id
      """
    And I save user id

  Scenario: Get created user data
    Given I set up 'GET' api endpoint with url 'https://gorest.co.in/public/v2/users/'
    When I set request headers
    And I add id to the url
    And I send HTTP request
    Then Response code is 200
    And Response contains
      """
      id
      """

  Scenario: Change created user details
    Given I set up 'PATCH' api endpoint with url 'https://gorest.co.in/public/v2/users/'
    When I set request headers
    And I add id to the url
    And I set a request body
      """
      {
        name: "Donald Duck"
      }
      """
    And I send HTTP request
    Then Response code is 200
    And Response contains
      """
      "name":"Donald Duck"
      """

  Scenario: Delete created user
    Given I set up 'DELETE' api endpoint with url 'https://gorest.co.in/public/v2/users/'
    When I set request headers
    And I add id to the url
    And I send HTTP request
    Then Response code is 204
