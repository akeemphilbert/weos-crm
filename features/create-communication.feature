@WEOS-969
Feature: As a CSR, I should be able to manually add a communication

  Background:
    Given a CSR named "Lynissa"
    And Lynissa has permissions to create communications
    And Lynissa is on the screen to create a communication
    And the CRM already has a few users

      | name     | notes          | tags        | email1 category | email1 address       | email2 category | email2 address         | phone        | address1 | address2        | city      | country             |
      | Maria    | 1st Customer.  | ic, webooks | personal        | maria@example.org    | work            | maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | James    | 2nd Customer.  | webooks     | work            | james@example.org    |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |

    And the CRM already has Communication Types
      | title               | description       |
      | Meeting             |                   |
      | Call                |                   |
      | Email               |                   |
      | Comment             |                   |
      | Facebook            |                   |
      | SMS                 |                   |


  Scenario: Create Communication for an existing Customer from Inbox section
    Given Lynissa searches for "Maria"
    And Lynissa selects "Maria" as the customer
    And Lynissa selects "Meeting" as the communication type
    And Lynissa enters "Lorem Ipsum" as the communication description
    When Lynissa saves the Communication
    Then A Communication with the description "Lorem Ipsum" should be created
    And the date and time should be the current date and time by default


  Scenario: Create Communication for a new Customer
    Given Lynissa selected the option to create a customer
    And Lynissa enters "Harriet Tubman" as the name
    And Lynissa enters "harriet.tubman@example.org" as the email address
    When Lynissa saves the customer
    Then the customer "Harriet Tubman" should be filled in as the customer in the create Communication form

  Scenario: Create Communication from Request page
    Given the CRM already has requests
      | id | title        | description                       | request type          | customer |  platform | status | assignee | customer | priority | last updated              | created                   |
      | 1  | No Price     | The product doesn't have a price  | Bug                   | Maria    | web       | to do  | lynissa  | Maria    | low      | 2021-05-12T07:20:50.52Z  | 2021-05-12T07:20:50.52Z  |
      | 2  | Add Courier  | Add Jetbox as a courier           | New Feature           | James    | web       | done   | lynissa  | Jame     | High     | 2021-05-02T07:20:50.52Z  | 2021-05-12T07:20:50.52Z  |
    And Lynissa is viewing a Request with id 1
    And Lynissa presses the button to create a new communication
    And Lynissa selects "Maria" as the customer
    And Lynissa selects "Meeting" as the communication type
    And Lynissa enters "Lorem Ipsum" as the communication description
    When Lynissa saves the Communication
    Then A Communication with the description "Lorem Ipsum" should be created
    And the date and time should be the current date and time by default
    And it the communication should be listed on the Request screen

