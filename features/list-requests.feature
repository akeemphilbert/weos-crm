@WEOS-967
Feature: As a CSR, I should be able to see a list of requests so that address them

  Background:
    Given a CSR named "Lynissa"
    And Lynissa has permissions to view requests
    And the CRM already has a few users

      | name    | notes         | tags        | email1 category | email1 address      | email2 category | email2 address         | phone        | address1 | address2        | city      | country             |
      | Maria   | 1st Customer. | ic, webooks | personal        | maria@example.org   | work            | maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | James   | 2nd Customer. | webooks     | work            | james@example.org   |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Andy    | 3rd Customer. | wecims      | work            | andy@example.org    |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | NKeche  | 4th Customer. | ic          | work            | nkeche@example.org  |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Francis | 4th Customer. | wecrm       | work            | francis@example.org |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Oleta   | 6th Customer. | potential   | work            | oleta@example.org   |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
    And the CRM already has Request Types
      | title       | description |
      | New Feature |             |
      | Bug         |             |
      | Kudos       |             |
      | Support     |             |
    And the CRM already has requests
      | id | title                        | description                      | request type | customer | platform | status | assignee | follower1 | follower2 | priority | last updated            | created                 |
      | 1  | No Price                     | The product doesn't have a price | Bug          | Maria    | web      | to do  | lynissa  | James     | Akeem     | Low      | 2021-05-12T07:20:50.52Z | 2021-05-12T07:20:50.52Z |
      | 2  | Add Courier                  | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  | NKeche    | Oleta     | High     | 2021-05-22T07:20:50.52Z | 2021-05-21T07:20:50.52Z |
      | 3  | How does this work           | How does this work               | New Feature  | Andy     | web      | done   | lynissa  | Francis   | Oleta     | Medium   | 2021-05-22T07:20:50.52Z | 2021-05-23T07:20:50.52Z |
      | 4  | Do you have this product     | Do you have this product         | New Feature  | NKeche   | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-04-12T07:20:50.52Z |
      | 5  | I wish I could do this       | I wish I could do this           | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-03-12T07:20:50.52Z |
      | 6  | Find duplicate contacts      | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-03-12T07:20:50.52Z |
      | 7  | Edit contacts                | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-03-12T07:20:50.52Z |
      | 8  | Sync with google contacts    | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-02-12T07:20:50.52Z |
      | 9  | Export all custom fields     | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-02-12T07:20:50.52Z |
      | 10 | Bulk actions                 | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-02-12T07:20:50.52Z |
      | 11 | Company List                 | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-01-12T07:20:50.52Z |
      | 12 | Integrate Facebook Messenger | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-01-12T07:20:50.52Z | 2021-01-12T07:20:50.52Z |
    And Lynissa is on the screen to view requests
    And the default number of items per page is 10
    And and options for the no of items per page are 10,20,100

  @focus
  Scenario: Default list of requests
    When Lynissa visits page for the first time
    Then the "start date" filter should be 30 days from the current day
    And the "end date" filter should be the current date

  Scenario: See a list of all requests that sorted by created desc by default
    Given Lynissa selects "2021-01-01" from the "start date" filter
    When Lynissa selects "2021-06-06" from the "end date" filter
    Then Lynissa should see a list of 10 requests
      | id | title                     | description                      | request type | customer | platform | status | assignee | follower1 | follower2 | priority | last updated            | created                 |
      | 3  | How does this work        | How does this work               | New Feature  | Andy     | web      | done   | lynissa  | Francis   | Oleta     | Medium   | 2021-05-22T07:20:50.52Z | 2021-05-23T07:20:50.52Z |
      | 2  | Add Courier               | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  | NKeche    | Oleta     | High     | 2021-05-22T07:20:50.52Z | 2021-05-21T07:20:50.52Z |
      | 1  | No Price                  | The product doesn't have a price | Bug          | Maria    | web      | to do  | lynissa  | James     | Akeem     | Low      | 2021-05-12T07:20:50.52Z | 2021-05-12T07:20:50.52Z |
      | 4  | Do you have this product  | Do you have this product         | New Feature  | NKeche   | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-04-12T07:20:50.52Z |
      | 5  | I wish I could do this    | I wish I could do this           | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-03-12T07:20:50.52Z |
      | 6  | Find duplicate contacts   | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-03-12T07:20:50.52Z |
      | 7  | Edit contacts             | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-03-12T07:20:50.52Z |
      | 8  | Sync with google contacts | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-02-12T07:20:50.52Z |
      | 9  | Export all custom fields  | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-02-12T07:20:50.52Z |
      | 10 | Bulk actions              | Add Jetbox as a courier          | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-02-12T07:20:50.52Z |

  Scenario: See second page
    Given Lynissa selects "2021-01-01" from the "start date" filter
    And Lynissa selects "2021-06-06" from the "end date" filter
    When Lynissa selects page 2
    Then Lynissa should see a list of 2 items
      | id | title                        | description             | request type | customer | platform | status | assignee | follower1 | follower2 | priority | last updated            | created                 |
      | 11 | Company List                 | Add Jetbox as a courier | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-01-12T07:20:50.52Z |
      | 12 | Integrate Facebook Messenger | Add Jetbox as a courier | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-01-12T07:20:50.52Z | 2021-01-12T07:20:50.52Z |

  Scenario: Sort requests by last updated in descending order
    Given Lynissa selects "2021-01-01" from the "start date" filter
    And Lynissa selects "2021-06-06" from the "end date" filter
    When Lynissa changes the sort order of the "last updated" column
    Then Lynissa should see a list of 10 items
      | id | title                     | description              | request type | customer | platform | status | assignee | follower1 | follower2 | priority | last updated            | created                 |
      | 2  | Add Courier               | Add Jetbox as a courier  | New Feature  | James    | web      | done   | lynissa  | NKeche    | Oleta     | High     | 2021-05-22T07:20:50.52Z | 2021-05-21T07:20:50.52Z |
      | 3  | How does this work        | How does this work       | New Feature  | Andy     | web      | done   | lynissa  | Francis   | Oleta     | Medium   | 2021-05-22T07:20:50.52Z | 2021-05-23T07:20:50.52Z |
      | 4  | Do you have this product  | Do you have this product | New Feature  | NKeche   | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-04-12T07:20:50.52Z |
      | 5  | I wish I could do this    | I wish I could do this   | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-03-12T07:20:50.52Z |
      | 6  | Find duplicate contacts   | Add Jetbox as a courier  | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-03-12T07:20:50.52Z |
      | 7  | Edit contacts             | Add Jetbox as a courier  | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-03-12T07:20:50.52Z |
      | 8  | Sync with google contacts | Add Jetbox as a courier  | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-02-12T07:20:50.52Z |
      | 9  | Export all custom fields  | Add Jetbox as a courier  | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-02-12T07:20:50.52Z |
      | 10 | Bulk actions              | Add Jetbox as a courier  | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-02-12T07:20:50.52Z |
      | 11 | Company List              | Add Jetbox as a courier  | New Feature  | James    | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-01-12T07:20:50.52Z |

  Scenario: Search for request by customer
    When Lynissa searches for "NKeche"
    Then Lynissa should see a list of 2 items
      | id | title                    | description              | request type | customer | platform | status | assignee | follower1 | follower2 | priority | last updated            | created                 |
      | 2  | Add Courier              | Add Jetbox as a courier  | New Feature  | James    | web      | done   | lynissa  | NKeche    | Oleta     | High     | 2021-05-22T07:20:50.52Z | 2021-05-21T07:20:50.52Z |
      | 4  | Do you have this product | Do you have this product | New Feature  | NKeche   | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-04-12T07:20:50.52Z |

  Scenario: Search for user by email
    When Lynissa searches for "nkeche@example.org"
    Then Lynissa should see a list of 2 items
      | id | title                    | description              | request type | customer | platform | status | assignee | follower1 | follower2 | priority | last updated            | created                 |
      | 2  | Add Courier              | Add Jetbox as a courier  | New Feature  | James    | web      | done   | lynissa  | NKeche    | Oleta     | High     | 2021-05-22T07:20:50.52Z | 2021-05-21T07:20:50.52Z |
      | 4  | Do you have this product | Do you have this product | New Feature  | NKeche   | web      | done   | lynissa  |           |           | High     | 2021-05-22T07:20:50.52Z | 2021-04-12T07:20:50.52Z |

  Scenario: Filter by status
    When Lynissa selects "to do" from the "status" filter
    Then Lynissa should see a list of 1 item
      | id | title    | description                      | request type | customer | platform | status | assignee | follower1 | follower2 | priority | last updated            | created                 |
      | 1  | No Price | The product doesn't have a price | Bug          | Maria    | web      | to do  | lynissa  | James     | Akeem     | Low      | 2021-05-12T07:20:50.52Z | 2021-05-12T07:20:50.52Z |

  Scenario: Filter by request type
    When Lynissa selects "Bug" from the "request type" filter
    Then Lynissa should see a list of 1 item
      | id | title    | description                      | request type | customer | platform | status | assignee | follower1 | follower2 | priority | last updated            | created                 |
      | 1  | No Price | The product doesn't have a price | Bug          | Maria    | web      | to do  | lynissa  | James     | Akeem     | Low      | 2021-05-12T07:20:50.52Z | 2021-05-12T07:20:50.52Z |

  @ui
  Scenario: Show Kanban
    Given Lynissa selects "2021-01-01" from the "start date" filter
    And Lynissa selects "2021-06-06" from the "end date" filter
    When Lynissa selects the show kanban button
    Then the kanban view should be shown
    And the kanban should have a column for each status
    And the status column should contain all the requests with that status
    And each request card should show the list of tasks
  @ui
  Scenario: Update status in Kanband view
    Given Lynissa selects "2021-01-01" from the "start date" filter
    And Lynissa selects "2021-06-06" from the "end date" filter
    And Lynissa selects the show kanban button
    When Lynissa moves the item with id 1 to the "done" column
    Then the request with id 1 should have status "done"