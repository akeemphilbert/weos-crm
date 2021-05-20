Feature: As an Admin, I should be able to delete a Request Type so that it is no longer available

  Background:
    Given an Admin named "Oleta"
    And Oleta has permissions to delete request types
    And the CRM already has Request Types
      | title         | description       |
      | New Feature   |                   |
      | Bug           |                   |
      | Kudos         |                   |
    And the "Bug" Request Type has fields
      | title        | type     |
      | Platform     | Text     |
    And the CRM already has a few users

      | name     | notes          | tags        | email1 category | email1 address       | email2 category | email2 address         | phone        | address1 | address2        | city      | country             |
      | Maria    | 1st Customer.  | ic, webooks | personal        | maria@example.org    | work            | maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | James    | 2nd Customer.  | webooks     | work            | james@example.org    |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
    And the CRM already has a requests
      | id | title        | description                       | request type          | customer |  platform |
      | 1  | No Price     | The product doesn't have a price  | Bug                   | Maria    | web       |
      | 2  | Add Courier  | Add Jetbox as a courier           | New Feature           | James    | web       |
    And Oleta is editing the "Bug" Request Type

  Scenario: Delete request type
    When Oleta selects the delete button
    Then A confirmation prompt should be shown

  Scenario: Delete request type that already has a request associated with it
    Given Oleta selects the delete button
    When Oleta select the affirmative button on the prompt
    Then the "Bug" Request type should be deleted
    But the request with id 1 should have field "platform" with the value "web"