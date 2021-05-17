Feature: As an Admin, I should be able to manage fields on a Request type so that I can match my workflow
  
  Background:
    Given an Admin named "Oleta"
    And Oleta has permissions to manage request types
    And the CRM already has Request Types
      | title | description |
      | Bug   |             |
    And the "Bug" Request Type has fields
      | title        | type     |
      | Job Title    | Text     |
    And Oleta is editing the "Bug" Request Type
    And the available field types are
      | Text       |
      | Multi-Line |
      | Checkbox   |
    
  Scenario: Add a basic text field to a Request Type
    Given Oleta selects button to add a new field
    And Oleta enters "Title" as the field title
    And Oleta selects "Text" as the field type
    When Oleta saves the Request Type
    Then the "Bug" Request Type should have fields
      | title          | type           |
      | Job Title      | Text           |
      | Title          | Text           |
    
  Scenario: Add a multiline field to a Request Type
    Given Oleta selects button to add a new field
    And Oleta enters "Description" as the field title
    And Oleta selects "Multi-Line" as the field type
    When Oleta saves the Request Type
    Then the "Bug" Request Type should have fields
      | title          | type           |
      | Job Title      | Text           |
      | Description    | Multi-Line     |
    
  Scenario: Add a checkbox field to a Request Type
    Given Oleta selects button to add a new field
    And Oleta enters "Confirmed" as the field title
    And Oleta selects "Checkbox" as the field type
    When Oleta saves the Request Type
    Then the "Bug" Request Type should have fields
      | title          | type           |
      | Job Title      | Text           |
      | Confirmed      | Checkbox       |
    
  Scenario: Remove field from Request Type
    Given the "Bug" Request Type has fields
      | title          | type           |
      | Title          | Text           |
      | Description    | Multi-Line     |
      | Confirmed      | Checkbox       |
    And Oleta deletes the field "Description"
    When Oleta saves the Request Type
    Then the "Bug" Request Type should have fields
      | title          | type           |
      | Title          | Text           |
      | Confirmed      | Checkbox       |
    
  
  