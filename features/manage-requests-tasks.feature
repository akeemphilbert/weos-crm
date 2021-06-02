@WEOS-1039
Feature: As a CSR, I should be able to manage tasks on a request so that I can make sure things that pop up are covered

  Background:
    Given a CSR named "Lynissa"
    And Lynissa has permissions to update requests
    And the CRM already has a few users
      | name  | notes         | tags        | email1 category | email1 address    | email2 category | email2 address         | phone        | address1 | address2        | city      | country             |
      | Maria | 1st Customer. | ic, webooks | personal        | maria@example.org | work            | maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | James | 2nd Customer. | webooks     | work            | james@example.org |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
    And the CRM already has requests
      | id | title       | description                      | request type | customer | platform | status | assignee | customer | priority | last updated             | created                  | task   |
      | 1  | No Price    | The product doesn't have a price | Bug          | Maria    | web      | to do  | lynissa  | Maria    | low      | 2021-05-122T07:20:50.52Z | 2021-05-122T07:20:50.52Z | Task 1 |
      | 2  | Add Courier | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  | Jame     | High     | 2021-05-022T07:20:50.52Z | 2021-05-122T07:20:50.52Z |        |
    And Lynissa is updating a Request with id 1

  Scenario: Add new task
    Given Lynissa presses the button to add a task
    And Lynissa enters "New Task" as the task title
    When Lynissa presses the save button
    Then a new task is added to the request with the title "New Task"
    And the task should be marked incomplete

  Scenario: Update task
    Given Lynissa clicks on the task title "Task 1"
    And a modal window to edit the task shows up
    And Lynissa enters "New Name" as the task title
    When Lynissa presses the save button
    Then the task is updated with the title "New Name"

  Scenario: Delete Task
    When Lynissa clicks the delete button next to task "Task 1"
    Then the task "Task 1" should be deleted