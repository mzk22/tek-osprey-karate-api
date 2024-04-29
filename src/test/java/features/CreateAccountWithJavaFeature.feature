@Regression
Feature: Create Account with Java Data Generator

  @CreateAccount_2
  Scenario: Create An Account with Random Email address
    Given url "https://dev.insurance-api.tekschool-students.com"
    And path "/api/accounts/add-primary-account"
    * def dataGenerator = Java.type('data.DataGenerator')
    * def randomEmail = dataGenerator.getEmail()
    And request
      """
      {
        "email": "#(randomEmail)",
        "firstName": "John",
        "lastName": "Doe",
        "title": "Mr.",
        "gender": "MALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "Software developer",
        "dateOfBirth": "2000-01-01"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == randomEmail