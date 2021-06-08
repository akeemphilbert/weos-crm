Feature: As an admin I should be able to see all the request types so that I can choose one to edit
  
  Background:
    Given an Admin named "Oleta"
    And Oleta has permissions to view Request Types
    And the CRM already has Request Types
<<<<<<< Updated upstream
    | title         | description       |
    | New Feature   |                   |
    | Bug           |                   |
    | Kudos         |                   |

  Scenario: See a list of all Request Types
    When Oleta first visits the request types list page
    Then Oleta should see a list of 3 Request Types
    | title         | description       |
    | Bug           |                   |
    | Kudos         |                   |
    | New Feature   |                   |
=======
      | title       | description |
      | New Feature |             |
      | Kudos       |             |
      | Bug         |             |
      | Type A      |             |
      | Type B      |             |
      | Type C      |             |
      | Type D      |             |
      | Type E      |             |
      | Type F      |             |
      | Type G      |             |
      | Type H      |             |
      | Type I      |             |
      | Type J      |             |
      | Type K      |             |
      | Type L      |             |
    And Oleta is on the screen to view Request Types

  Scenario: See a list of all Request Types
    When Oleta first visits the request types list page
    Then Oleta should see a list of 15 Request Types
      | title       | description |
      | Bug         |             |
      | Kudos       |             |
      | New Feature |             |
      | Type A      |             |
      | Type B      |             |
      | Type C      |             |
      | Type D      |             |
      | Type E      |             |
      | Type F      |             |
      | Type G      |             |
      | Type H      |             |
      | Type I      |             |
      | Type J      |             |
      | Type K      |             |
      | Type L      |             |
>>>>>>> Stashed changes

  Scenario: Sort list of request by title in descending order
    Given Oleta is viewing the list of request types
    When Oleta changes the sort order of the "title" column
<<<<<<< Updated upstream
    Then Oleta should see a list of 3 Request Types
    | title         | description       |
    | New Feature   |                   |
    | Kudos         |                   |
    | Bug           |                   |
=======
    Then Oleta should see a list of 15 Request Types
      | title       | description |
      | Type L      |             |
      | Type K      |             |
      | Type J      |             |
      | Type I      |             |
      | Type H      |             |
      | Type G      |             |
      | Type F      |             |
      | Type E      |             |
      | Type D      |             |
      | Type C      |             |
      | Type B      |             |
      | Type A      |             |
      | New Feature |             |
      | Kudos       |             |
      | Bug         |             |
>>>>>>> Stashed changes
