Feature: Insurance App Security test
  Scenario: Happy Path Token Generation
    Given url "https://dev.insurance-api.tekschool-students.com"
    And path "/api/token"
    And request {"username":"supervisor","password":"tek_supervisor"}
    When method post
    Then status 200