Feature: As an admin I should be able to see all the request types so that I can choose one to edit

  Background:
    Given an Admin named "Oleta"
    And Oleta has permissions to view Request Types
    And Oleta is on the screen to view Request Types
    And the CRM already has Request Types
      | title        | description |
      | New Feature  |             |
      | Bug          |             |
      | Type 1       |             |
      | Type 2       |             |
      | Type 3       |             |
      | Type 4       |             |
      | Type 5       |             |
      | Type 6       |             |
      | Type 7       |             |
      | Type 8       |             |
      | Type 9       |             |
      | Type 10      |             |
      | Type 11      |             |
      | Type 12      |             |

  Scenario: See a list of all Request Types
    When Oleta first visits the request types list page
    Then Oleta should see a list of 14 Request Types
      | title        | description |
      | Bug          |             |
      | Kudos        |             |
      | New Feature  |             |
      | Type 1       |             |
      | Type 2       |             |
      | Type 3       |             |
      | Type 4       |             |
      | Type 5       |             |
      | Type 6       |             |
      | Type 7       |             |
      | Type 8       |             |
      | Type 9       |             |
      | Type 10      |             |
      | Type 11      |             |
      | Type 12      |             |

  Scenario: Sort list of request by title in descending order
    Given Oleta is viewing the list of request types
    When Oleta changes the sort order of the "title" column
    Then Oleta should see a list of 14 Request Types
      | title       | description |
      | Type 12     |             |
      | Type 11     |             |
      | Type 10     |             |
      | Type 9      |             |
      | Type 8      |             |
      | Type 7      |             |
      | Type 6      |             |
      | Type 5      |             |
      | Type 4      |             |
      | Type 3      |             |
      | Type 2      |             |
      | Type 1      |             |
      | New Feature |             |
      | Kudos       |             |
      | Bug         |             |