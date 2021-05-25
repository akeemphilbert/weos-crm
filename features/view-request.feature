@WEOS-1040
Feature: As a CSR, I should be able to view a Request so that I can keep track of progress

  Background:
    Given a CSR named "Lynissa"
    And Lynissa has permissions to view requests
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

  Scenario: View request
    When Lynissa is viewing a Request with id 1
    Then Lynissa should see a task "Update File"
    And Lynissa should see the Request "title" with value "No Price"

  Scenario: Update request task
    Given Lynissa is viewing a Request with id 1
    And Lynissa marks the task "Update File" completed
    When Lynissa saves the Request
    Then the last updated date should be the current date

