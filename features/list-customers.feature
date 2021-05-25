Feature: As a CSR, I should be able to see a list of customers so that I can find customers

  This being able to find customers within the CRM

  Background:
    Given a CSR named "Lynissa"
    And Lynissa has permissions to view customers
    And Lynissa is on the screen to view customers
    And the CRM already has a few users

      | name     | notes          | tags        | email1 category | email1 address       | email2 category | email2 address         | phone        | address1 | address2        | city      | country             |
      | Maria    | 1st Customer.  | ic, webooks | personal        | maria@example.org    | work            | maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | James    | 2nd Customer.  | webooks     | work            | james@example.org    |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Andy     | 3rd Customer.  | wecims      | work            | andy@example.org     |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | NKeche   | 4th Customer.  | ic          | work            | nkeche@example.org   |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Francis  | 4th Customer.  | wecrm       | work            | francis@example.org  |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Oleta    | 6th Customer.  | potential   | work            | oleta@example.org    |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Simon    | 7th Customer.  | webooks     | work            | simon@example.org    | personal        | simon.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Atonia   | 8th Customer.  | webooks     | work            | atonia@example.org   |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Emmanuel | 9th Customer.  | webooks     | work            | emmanuel@example.org |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Maya     | 10th Customer. | webooks     | work            | maya@example.org     |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Salah    | 11th Customer. | webooks     | work            | salah@example.org    |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Keron    | 12th Customer. | webooks     | work            | keron@example.org    |                 |                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
    And the default number of customers per page is 10
    And and options for the no of items per page are 10,20,100

  
  Scenario: See a list of all customers
    When Lynissa first visits the list
    Then Lynissa should see a list of 10 customers
      | name     | email address(es)                         | phone        | address1 | address2        | city      | country             |
      | Andy     | andy@example.org                          | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Atonia   | atonia@example.org                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Emmanuel | emmanuel@example.org                      | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Francis  | francis@example.org                       | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | James    | james@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Keron    | keron@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Maria    | maria@example.org, maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Maya     | maya@example.org                          | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | NKeche   | nkeche@example.org.                       | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Oleta    | oleta@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |

  Scenario: See second page
    Given Lynissa is already on the first page of results
    When Lynissa selects page 2
    Then Lynissa should see a list of 2 customers
      | name  | email address(es)                         | phone        | address1 | address2        | city      | country             |
      | Salah | salah@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Simon | simon@example.org, simon.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |

  Scenario: Sort customer by name in descending order
    Given Lynissa is already on the first page of results
    When Lynissa changes the sort order of the "name" column
    Then Lynissa should see a list of 10 customers
      | name     | email address(es)                         | phone        | address1 | address2        | city      | country             |
      | Simon    | simon@example.org, simon.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Salah    | salah@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Oleta    | oleta@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | NKeche   | nkeche@example.org                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Maya     | maya@example.org                          | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Maria    | maria@example.org, maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Keron    | keron@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | James    | james@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Francis  | francis@example.org.                      | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Emmanuel | emmanuel@example.org                      | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |

  Scenario: Search for user by name
    When Lynissa searches for "simon"
    Then Lynissa should see a list of 1 customer
      | name  | email address(es)                         | phone        | address1 | address2        | city      | country             |
      | Simon | simon@example.org, simon.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |

  Scenario: Search for user by email
    When Lynissa searches for "maria.work@example.org"
    Then Lynissa should see a list of 1 customer
      | name  | email address(es)                         | phone        | address1 | address2        | city      | country             |
      | Maria | maria@example.org, maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |

  Scenario: Change the number of items per page
    Given Lynissa is already on the first page of results
    When Lynissa changes the no. of items per page to 20
    Then Lynissa should see a list of 12 customers
      | name     | email address(es)                         | phone        | address1 | address2        | city      | country             |
      | Andy     | andy@example.org                          | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Atonia   | atonia@example.org                        | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Emmanuel | emmanuel@example.org                      | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Francis  | francis@example.org                       | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | James    | james@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Keron    | keron@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Maria    | maria@example.org, maria.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Maya     | maya@example.org                          | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | NKeche   | nkeche@example.org.                       | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Oleta    | oleta@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Salah    | salah@example.org                         | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |
      | Simon    | simon@example.org, simon.work@example.org | 868-123-4560 | Apt 1.   | 5 Flamingo Blvd | Some City | Trinidad and Tobago |


