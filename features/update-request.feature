@WEOS-1038
Feature: As a CSR, I should be able to update a Request so that I can keep track of progress

  Background:
    Given a CSR named "Lynissa"
    And Lynissa has permissions to update requests
    And the CRM already has a few users
      | name     | notes          | tags        | email1 category | email1 address       | email2 category | email2 address         | phone        | address1 | address2        | city      | country             |
      | Maria    | 1st Customer.  | ic, webooks | personal        | maria@example.org    | work            | maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | James    | 2nd Customer.  | webooks     | work            | james@example.org    |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
    And the CRM already has requests
      | id | title        | description                       | request type          | customer |  platform | status | assignee | customer | priority | last updated              | created                   |
      | 1  | No Price     | The product doesn't have a price  | Bug                   | Maria    | web       | to do  | lynissa  | Maria    | low      | 2021-05-12T07:20:50.52Z  | 2021-05-12T07:20:50.52Z  |
      | 2  | Add Courier  | Add Jetbox as a courier           | New Feature           | James    | web       | done   | lynissa  | Jame     | High     | 2021-05-02T07:20:50.52Z  | 2021-05-12T07:20:50.52Z  |

    And the CRM already has Request Types
      | title         | description       |
      | New Feature   |                   |
      | Bug           |                   |
      | Kudos         |                   |
    And the "Bug" Request Type has fields
      | title        | type     |
      | Platform     | Text     |
      | Confirmed    | Checkbox |
    And the "Bug" Request Type has tasks
      | title         | due date  |
      | Update File   | 2         |

  Scenario: Updating a request with custom fields
    When Lynissa is updating a Request with id 1
    Then the text field "Platform" should appear
    And the checkbox "Confirmed" should appear
    And the Request should have a task "Update File"

  Scenario: Update basic request details
    Given Lynissa is updating a Request with id 1
    And Lynissa changes the "description" to be "Lorem Ipsum"
    When Lynissa saves the Request
    Then the request should have a "description" with value "Lorem Ipsum"
    And the last updated date should be the current date


  Scenario: Update request task
    Given Lynissa is updating a Request with id 1
    And Lynissa marks the task "Update File" completed
    When Lynissa saves the Request
    Then the last updated date should be the current date

  Scenario: Select different request type
    Given Lynissa is updating a Request with id 2
    When Lynissa selects "Bug" as the request type
    Then the text field "Platform" should appear
    And the checkbox "Confirmed" should appear

  Scenario: Update request type
    Given Lynissa is updating a Request with id 1
    And Lynissa selects "New Request" as the request type
    When Lynissa saves the Request
    Then the Request should have a "type" with value "New Request"
    And the last updated date should be the current date
    Then the task "Update File" should be deleted
    But the Request should have an extra field "platform" with value "web"


