@Regression
Feature: Get Accounts Information


  Background: setup tests
    Given url "https://dev.insurance-api.tekschool-students.com"
  #  Activity
  #  Send request to /api/accounts/get-all-accounts
  #  Without Authentication
  #  Expected status code 401
  @Accounts_1
  Scenario: Validate request without Authorization
    And path "/api/accounts/get-all-accounts"
    When method get
    Then status 401

  # Activity
  #    Send request to /api/accounts/get-all-accounts
  #    With Authentication
  #    Expected status code 200
  @Accounts_2
  Scenario: Get all account with Authorization
    * def result = callonce read('GenerateValidToken.feature')
    * def validToken = "Bearer " + result.response.token
    Given path "/api/accounts/get-all-accounts"
    And header Authorization = validToken
    When method get
    Then status 200
    And print response

  @Accounts_3
  Scenario: Get single account with params
    * def result = callonce read('GenerateValidToken.feature')
    * def validToken = "Bearer " + result.response.token
    Given path "/api/accounts/get-account"
    * def accountId = 6023
    And header Authorization = validToken
    And param primaryPersonId = accountId
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == accountId

  @Account_4
  Scenario: Get Account with non-existing id
    #        Generate token with calling another feature.
    * def result = callonce read('GenerateValidToken.feature')
    And print result
    * def validToken = result.response.token
    Given path "/api/accounts/get-account"
    And header Authorization = "Bearer " + validToken
    And param primaryPersonId = 61277777
    When method get
    Then status 404
    And print response
    And assert response.httpStatus == "NOT_FOUND"