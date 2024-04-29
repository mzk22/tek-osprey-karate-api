Feature: Generate Operator Token

  Scenario: Valid token
    Given url "https://dev.insurance-api.tekschool-students.com"
    Given path "/api/token"
    And request
      """
      {
        "username": "operator_readonly",
        "password": "Tek4u2024"
      }
      """
    When method post
    Then status 200
    And print response