Feature: As an admin I should be able to see all the request types so that I can choose one to edit

  Background:
    Given an Admin named "Oleta"
    And Oleta has permissions to view Request Types
    And Oleta is on the screen to view Request Types
    And the CRM already has Request Types
      | title       | description |
      | New Feature |             |
      | Bug         |             |
      | Kudos       |             |

  Scenario: See a list of all Request Types
    When Oleta first visits the request types list page
    Then Oleta should see a list of 3 Request Types
      | title       | description |
      | Bug         |             |
      | Kudos       |             |
      | New Feature |             |

  Scenario: Sort list of request by title in descending order
    Given Oleta is viewing the list of request types
    When Oleta changes the sort order of the "title" column
    Then Oleta should see a list of 3 Request Types
      | title       | description |
      | New Feature |             |
      | Kudos       |             |
      | Bug         |             |