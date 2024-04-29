Feature: Generate Valid Token

  Scenario: Valid token
    Given url "https://dev.insurance-api.tekschool-students.com"
    Given path "/api/token"
    And request
      """
      {
        "username": "supervisor",
        "password": "tek_supervisor"
      }
      """
    When method post
    Then status 200
    And print response