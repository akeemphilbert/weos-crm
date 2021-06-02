Feature: As an admin, I should be able to add a Request Type so that a CSR can use it to create Requests.

    Background:

        Given an Admin named "Oleta"
        And Oleta has permissions to create request types
        And Oleta is on the screen to create a request type
        And the CRM already has Request Types
            | title | description |
            | Bug   |             |

    Scenario: Create Request Type "New Feature"
        Given Oleta enters "New Feature" in the title field
        When Oleta saves the Request Type
        Then a Request Type is created
        And Oleta should be notified that the Request Type was created
        And Oleta should be shown the Request Type list with "New Feature" in it

    Scenario: Create Request Type that already exists
        Given Oleta enters "Bug" in the title field
        When Oleta saves the Request Type
        Then an error should be returned