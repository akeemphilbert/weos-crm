Feature: As an Admin, I should be able to manage tasks to a Request Type so that tasks are automatically added to requests that are created with this type

  Background:
    Given an Admin named "Oleta"
    And Oleta has permissions to manage request types
    And the CRM already has Request Types
      | title       | description |
      | Bug         |             |
      | New Feature |             |
    And the due date is specified in days
    And the "Bug" Request Type has tasks
      | title       | due date |
      | Update File | 2        |
    And the "New Feature" Request Type has tasks
      | title  | due date |
      | Step 1 | 2        |
      | Step 2 | 2        |

  Scenario: Add tasks to Request Type
    Given Oleta is editing the "Bug" Request Type
    And Oleta adds a new task
    And Oleta enters "Step 1" as the task title
    And Oleta enters 2 as the task due date
    When Oleta saves the Request Type
    Then the "Bug" Request Type should have tasks
      | title       | due date |
      | Update File | 2        |
      | Step 1      | 2        |

  Scenario: Remove task from Request Type
    Given Oleta is editing the "New Feature" Request Type
    And the Request Type has a task "Step 1" as task
    And the Request Type has a task "Step 2" as task
    When Akeem deletes "Step 2"
    And Akeem saves the Request Type
    Then Request Type "New Feature" should be updated
    And The Request Type should have a task "Step 1"
    And The Request Type should not have a task "Step 2"

  Scenario: Remove task from Request Type
    Given the "Bug" Request Type has tasks
      | title       | due date |
      | Update File | 2        |
      | Step 1      | 2        |
    And Oleta is editing the "Bug" Request Type
    And Oleta deletes the task "Update File"
    When Oleta saves the Request Type
    Then the "Bug" Request Type should have tasks
      | title  | due date |
      | Step 1 | 2        |