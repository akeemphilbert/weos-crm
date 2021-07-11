@WEOS-1073
Feature: As an admin I should be able to see all the communications types so that I can choose one to edit

  Background:
    Given an Admin named "Oleta"
    And Oleta has permissions to view communication types
    And the CRM already has communication types
      | title       | description |
      | Type A      |             |
      | Type B      |             |
      | Type C      |             |
      | Type D      |             |
    And Oleta is on the screen to view communication types

  Scenario: See a list of all communication types
    When Oleta first visits the request types list page
    Then Oleta should see a list of 4 Request Types
      | title       | description |
      | Type A      |             |
      | Type B      |             |
      | Type C      |             |
      | Type D      |             |

  Scenario: Sort list of request by title in descending order
    Given Oleta is viewing the list of request types
    When Oleta changes the sort order of the "title" column
    Then Oleta should see a list of 4 Request Types
      | title  | description |
      | Type D |             |
      | Type C |             |
      | Type B |             |
      | Type A |             |
