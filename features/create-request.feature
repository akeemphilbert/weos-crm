@WEOS-969
Feature: As a CSR, I should be able to create a Request for a Customer so that the team can address it

  Background:
    Given a CSR named "Lynissa"
    And Lynissa has permissions to create requests
    And the CRM already has a few users

      | name  | notes         | tags        | email1 category | email1 address    | email2 category | email2 address         | phone        | address1 | address2        | city      | country             |
      | Maria | 1st Customer. | ic, webooks | personal        | maria@example.org | work            | maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | James | 2nd Customer. | webooks     | work            | james@example.org |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |

    And the CRM already has Request Types
      | title       | description |
      | New Feature |             |
      | Bug         |             |
      | Kudos       |             |
    And the "Bug" Request Type has fields
      | title     | type     |
      | Platform  | Text     |
      | Confirmed | Checkbox |
    And the "Bug" Request Type has tasks
      | title       | due date |
      | Update File | 2        |
    And Lynissa is on the screen to create a request

  Scenario: Create Request for an existing Customer
    Given Lynissa searches for "Maria"
    And Lynissa selects "Maria" as the customer
    And Lynissa selects "New Feature" as the request type
    And Lynissa enters "Some New Feature" as the request title
    And Lynissa enters "Do something new" as the request description
    When Lynissa saves the Request
    Then A Request with the title "Some New Feature" should be created
    And Lynissa should be redirected to the view page for the created request
    And the Request should have a type "New Feature"
    And the Request should have a customer "Maria"
    And the Request should have a description "Do something new"


  Scenario: Create Request for a new Customer
    Given Lynissa selected the option to create a customer
    And Lynissa enters "Harriet Tubman" as the name
    And Lynissa enters "harriet.tubman@example.org" as the email address
    When Lynissa saves the customer
    Then the customer "Harriet Tubman" should be filled in as the customer in the create Request form

  Scenario: Create a Request with multiple followers
    Given Lynissa searches for "Maria"
    And Lynissa selects "Maria" as the customer
    And Lynissa searches for "James"
    And Lynissa selects "James" as the follower
    And Lynissa select option to add another follower
    And Lynissa selected the option to create a customer
    And Lynissa enters "Harriet Tubman" as the name
    And Lynissa enters "harriet.tubman@example.org" as the email address
    And Lynissa saves the customer
    And Lynissa selects "New Feature" as the request type
    And Lynissa enters "Some New Feature" as the request title
    And Lynissa enters "Do something new" as the request description
    When Lynissa saves the Request
    Then A Request with the title "Some New Feature" should be created
    And the Request should have a type "New Feature"
    And the Request should have a customer "Maria"
    And the Request should have a follower "James"
    And the Request should have a follower "Harriet Tubman"
    And the Request should have a description "Do something new"

  Scenario: Choose custom Request Type to see additional fields
    Given Lynissa searches for "Maria"
    And Lynissa selects "Maria" as the customer
    And only the standard Request fields are visible
    When Lynissa selects "Bug" as the request type
    Then the text field "Platform" should appear
    And the checkbox "Confirmed" should appear

  Scenario: Create Request with custom Request Type
    Given Lynissa searches for "Maria"
    And Lynissa selects "Maria" as the customer
    And only the standard Request fields are visible
    And Lynissa enters "Some Bug" as the request title
    And Lynissa enters "I need help" as the request description
    And Lynissa selects "Bug" as the request type
    And Lynissa enters "Android" for the "platform" field
    And Lynissa checks the "Confirmed" checkbox
    When Lynissa saves the Request
    Then A Request with the title "Some Bug" should be created
    And the Request should have a type "Bug"
    And the Request should have a customer "Maria"
    And the Request should have a description "I need help"
    And the Request should have an extra field "platform" with value "Android"
    And the Request should have tasks
      | title       | completed |
      | Update File | false     |
    And the task "Update File" should be due "6:00 PM" 2 days from creation date