@ui @WEOS-1043
Feature: As a CSR I should be able to view Requests on a Kanban so that I can ensure Requests are resolved
  Background:
    Given a CSR named "Lynissa"
    And Lynissa has permissions to view requests
    And Lynissa is on the screen to view requests
    And the CRM already has a few users

      | name     | notes          | tags        | email1 category | email1 address       | email2 category | email2 address         | phone        | address1 | address2        | city      | country             |
      | Maria    | 1st Customer.  | ic, webooks | personal        | maria@example.org    | work            | maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | James    | 2nd Customer.  | webooks     | work            | james@example.org    |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Andy     | 3rd Customer.  | wecims      | work            | andy@example.org     |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | NKeche   | 4th Customer.  | ic          | work            | nkeche@example.org   |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Francis  | 4th Customer.  | wecrm       | work            | francis@example.org  |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Oleta    | 6th Customer.  | potential   | work            | oleta@example.org    |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
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
    And the CRM already has requests
      | id | title                        | description                       | request type          | customer |  platform | status | assignee | follower1 | follower2 | priority | last updated             | created                   |
      | 1  | No Price                     | The product doesn't have a price  | Bug                   | Maria    | web       | to do  | lynissa  | James     | Akeem     | low      | 2021-05-12T07:20:50.52Z  | 2021-05-12T07:20:50.52Z  |
      | 2  | Add Courier                  | Add Jetbox as a courier           | New Feature           | James    | web       | done   | lynissa  | NKeche    | Oleta     | High     | 2021-05-22T07:20:50.52Z  | 2021-05-21T07:20:50.52Z  |
      | 3  | How does this work           | How does this work                | New Feature           | Andy     | web       | done   | lynissa  | Francis   | Oleta     | Medium   | 2021-05-22T07:20:50.52Z  | 2021-05-23T07:20:50.52Z  |
      | 4  | Do you have this product     | Do you have this product          | New Feature           | NKeche   | web       | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z  | 2021-04-12T07:20:50.52Z  |
      | 5  | I wish I could do this       | I wish I could do this            | New Feature           | James    | web       | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z  | 2021-03-12T07:20:50.52Z  |
      | 6  | Find duplicate contacts      | Add Jetbox as a courier           | New Feature           | James    | web       | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z  | 2021-03-12T07:20:50.52Z  |
      | 7  | Edit contacts                | Add Jetbox as a courier           | New Feature           | James    | web       | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z  | 2021-03-12T07:20:50.52Z  |
      | 8  | Sync with google contacts    | Add Jetbox as a courier           | New Feature           | James    | web       | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z  | 2021-02-12T07:20:50.52Z  |
      | 9  | Export all custom fields     | Add Jetbox as a courier           | New Feature           | James    | web       | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z  | 2021-02-12T07:20:50.52Z  |
      | 10 | Bulk actions                 | Add Jetbox as a courier           | New Feature           | James    | web       | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z  | 2021-02-12T07:20:50.52Z  |
      | 11 | Company List                 | Add Jetbox as a courier           | New Feature           | James    | web       | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z  | 2021-01-12T07:20:50.52Z  |
      | 12 | Integrate Facebook Messenger | Add Jetbox as a courier           | New Feature           | James    | web       | done   | lynissa  |           |           | High     | 2021-01-12T07:20:50.52Z  | 2021-01-12T07:20:50.52Z  |
    And Lynissa selects "2021-01-01" from the "start date" filter
    And Lynissa selects "2021-06-06" from the "end date" filter
    And Lynissa selects the show kanban button

  Scenario: Show Kanban
    When the kanban view is shown
    Then the kanban should have a column for each status
    And the status column should contain all the requests with that status
    And each request card should show the list of tasks

  Scenario: Update status in Kanband view
    When Lynissa moves the item with id 1 to the "done" column
    Then the request with id 1 should have status "done"

  Scenario: Update request task
    Given Lynissa is viewing a Request with id 1
    And Lynissa marks the task "Update File" completed
    When Lynissa saves the Request
    Then the last updated date should be the current date