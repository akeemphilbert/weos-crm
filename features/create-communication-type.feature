@WEOS-1073
Feature: As an admin, I should be able to add a Communication Type so that a CSR can use it to create Requests.

  Background:

    Given an Admin named "Oleta"
    And Oleta has permissions to create communication types
    And Oleta is on the screen to create a communication type
    And the CRM already has communication types
      | title  | description |
      | Call   |             |

  Scenario: Create communication type "In-Person Meeting"
    Given Oleta enters "In-Person Meeting" in the title field
    When Oleta saves the communication type
    Then a communication type is created
    And Oleta should be notified that the communication type was created
    And Oleta should be shown the communication type list with "In-Person Meeting" in it

  Scenario: Create communication type that already exists
    Given Oleta enters "Call" in the title field
    When Oleta saves the communication type
    Then an error should be returned