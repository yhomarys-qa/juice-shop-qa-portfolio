# language: en
Feature: 🔍 Product Search
  As a visitor or registered customer of OWASP Juice Shop
  I want to use the search bar to filter products by specific terms
  So that I can quickly find the exact products I am looking for

  Background: Open Search Field
    Given I am on the main page of the application
    When I click on the search icon in the header
    Then the search input field should expand and be ready for typing

  Scenario Outline: 🔤 Search execution with different character types
    When I type <search_term> into the search field
    And I press enter or execute the search
    Then the system should filter the catalog grid
    And the results must preserve product integrity showing image, title, description, and price

    Examples:
      | search_term  | description                      |
      | "APPLE"      | "Uppercase letters"              |
      | "bAnAnA"     | "Mixed case letters"             |
      | "Juice 123"  | "Alphanumeric and spaces"        |
      | "Wine!"      | "Special characters"             |

  Scenario Outline: 🔄 Case-insensitive search alignment
    When I search for <term_a>
    And I note the results
    And I clear the search and search for <term_b>
    Then the list of returned products for both searches must be identical

    Examples:
      | term_a   | term_b   |
      | "JUICE"  | "juice"  |
      | "Orange" | "ORANGE" |

  Scenario: ❌ Reset search parameters
    When I type a search term into the input field
    And I click on the clear icon "X" inside the search bar
    Then the input field should be completely cleared
    And the product catalog should instantly restore to its full default state
