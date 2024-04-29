@Delete_Account @Regression
Feature: Delete Accounts

  #Send request to /api/accounts/delete-account
  #With supervisor user
  #Response status should be 200
  Background: Setup test with creating account
    Given url "https://dev.insurance-api.tekschool-students.com"
    * def createAccountResult = callonce read('CreateAccountWithJava.feature')
    * def createdAccountId = createAccountResult.response.id

@Delete_Account_1
  Scenario: Delete Account with Supervisor user.
    * def tokenResult = callonce read('GenerateValidToken.feature')
    * def token = "Bearer " + tokenResult.response.token
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = createdAccountId
    And header Authorization = token
    When method delete
    Then status 200


  #Send request to /api/accounts/delete-account
  #With operator_readonly user
  #Response status should be 403
  @Delete_Account_2
  Scenario: Delete Account with Operator user.
    * def tokenResult = callonce read('GenerateOperatorToken.feature')
    * def token = "Bearer " + tokenResult.response.token
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = createdAccountId
    And header Authorization = token
    When method delete
    Then status 403