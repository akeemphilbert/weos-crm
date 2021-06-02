Feature: I should be able to create a customer

  This is adding a Customer to the CRM. Ideally this is an easy process for the CSR

  Background:
    Given a CSR named "Lynissa"
    And Lynissa has permissions to create customers
    And the CRM already has a few users

      | name  | notes            | tags        | email1 category | email1 address    | email2 category | email2 address         |
      | Maria | First Customer.  | ic, webooks | personal        | maria@example.org | work            | maria.work@example.org |
      | James | Second Customer. | webooks     | work            | james@example.org |                 |                        |
    And Lynissa is on the screen to create a customer

  Scenario: Create a customer with name only
    When Lynissa enters a customer name "Barry"
    And Lynissa hits the submit button
    Then a new customer should be created with the name "Barry"
    And Lynissa should be notified that the customer was created
    And Lynissa should be shown the customer list with "Barry" in it


  Scenario: Create a customer with more details
    When Lynissa enters a customer with the details
      | name | notes        | tags        | email1 category | email1 address   | email2 category | email2 address        |
      | Zach | New Customer | ic, webooks | personal        | zach@example.org | work            | zach.work@example.org |
    And Lynissa hits the submit button
    Then a new customer should be created with the name "Zach"
    And Lynissa should be notified that the customer was created
    And Lynissa should be shown the customer list with "Zach" in it

  Scenario: Create customer with email address that already exists
    When Lynissa enters a customer with the details
      | name | notes | tags | email1 category | email1 address         | email2 category | email2 address |
      | Mary |       |      | work            | maria.work@example.org |                 |                |
    And Lynissa hits the submit button
    Then Lynissa should get an error because the user already exists