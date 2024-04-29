@Regression
Feature: CSR Portal Plan Section
#We have generate valid token first
#  then Call plan code api request

  @Plan_1
  Scenario: Get all plans and validate expiration
    Given url "https://dev.insurance-api.tekschool-students.com"
    And path "/api/token"
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
    * def validToken = response.token
    Given path "/api/plans/get-all-plan-code"
    And header Authorization = "Bearer " + validToken
    When method get
    Then status 200
    And print response
    Then assert response[0].planExpired == false
    Then assert response[1].planExpired == false
    Then assert response[2].planExpired == false
    Then assert response[3].planExpired == false