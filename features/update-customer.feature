Feature: As a CSR, I should be able to update a customer profile based on additional information
  
  Background:
    Given a CSR named "Lynissa"
    And Lynissa has permissions to update customers
    And Lynissa is on the screen to update a customer
    And the CRM already has a few users
      
      | id | name       |   notes         |   tags       | email1 category  | email1 address    | email2 category | email 2 address        | 
      | 1  | Maria      | First Customer. | ic, webooks  | personal         | maria@example.org | work            | maria.work@example.org | 
      | 2  | James      | Second Customer.| webooks      | work             | james@example.org |                 |                        |
      
  
  Scenario: Update a customer name
    Given Lynissa chooses to edit customer with id 1
    And Lynissa enters a customer name "Barry"
    When Lynissa hits the submit button
    Then the customer with id 1 should now be named "Barry"
    And Lynissa should be notified that the customer was updated
    
    
  Scenario: Remove tag
    Given Lynissa chooses to edit customer with id 1
    And Lynissa removes the tag "ic"
    When Lynissa hits the submit button
    Then the customer with id 1 should now have tag "webooks"
    But the customer should not have tag "ic"
  
  Scenario: Change tag
    Given Lynissa chooses to edit customer with id 1
    And Lynissa enters a customer with the details
    | name       |   notes         |   tags                     | email1 category  | email1 address          | email2 category | email 2 address        | 
    | Maria      |                 |  wetutor,wecims            | work             | maria.work@example.org  |                 |                        |
    When Lynissa hits the submit button
    Then the customer with id 1 should now have tag "wetutor"
    And the customer with id 1 should now have tag "wecims"
    But the customer should not have tag "ic"
    But the customer should not have tag "webooks"
    
  Scenario: Customer with email address already exists
    Given Lynissa chooses to edit customer with id 1
    And Lynissa enters a customer with the details
    | name       |   notes         |   tags                     | email1 category  | email1 address          | email2 category | email 2 address        | 
    | Maria      |                 |  ic, webooks               | work             | james@example.org       |                 |                        |
    When Lynissa hits the submit button
    Then Lynissa should get an error because another user with that email address already exists
