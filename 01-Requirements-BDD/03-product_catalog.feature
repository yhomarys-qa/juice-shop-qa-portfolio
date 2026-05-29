# language: en
Feature: 🛒 Product Catalog & Reviews
  As a visitor or registered customer of OWASP Juice Shop
  I want to browse the product catalog, view detailed descriptions, and read reviews
  So that I can find items of interest and read feedback before purchasing

  Background: Navigate to Catalog
    Given I am on the main page of the application

  Scenario: 👁️ Browse product catalog as an unauthenticated user
    Then I should see the main product grid
    And each product card must display its image, name, description, and price
    And the options to submit reviews, like comments, or add items to the cart must be restricted

  Scenario: 🔐 View advanced product details as an authenticated user
    Given I am logged into my account
    When I click on a product card
    Then a detailed modal dialog should open
    And I should see the product reviews and comments section
    And the modal must include a functional "Close" button to return to the catalog

  Scenario Outline: 📝 Comment length validation rules
    Given I am logged into my account
    And I have opened a product's detailed modal
    When I type <comment_text> into the review field
    Then the system should handle the submission state as <expected_result>

    Examples:
      | comment_text                                                                                        | expected_result |
      | "Excellent product!"                                                                                | "Allowed"       |
      | "Product123! With spaces"                                                                           | "Allowed"       |
      | "A"                                                                                                 | "Allowed"       |
      | "This comment contains exactly 160 characters..."                                                   | "Allowed"       |
      | "This comment contains 161 characters because it exceeds the maximum boundary limit by one single character..." | "Rejected"      |
      | ""                                                                                                  | "Disabled"      |
      | "   "                                                                                               | "Disabled"      |

  Scenario Outline: 📊 Catalog pagination controls
    When I view the pagination bar at the bottom of the catalog
    Then I should see the current result count and available navigation controls
    When I change the items per page filter to <items_count>
    Then the product grid and result count should adjust dynamically

    Examples:
      | items_count |
      | 12          |
      | 24          |
      | 36          |

  Scenario: 🛑 Pagination boundary limits
    When I navigate to the last page of the product catalog
    Then the "Next Page" and final navigation buttons should be automatically disabled
    When I navigate back to the first page
    Then the "Previous Page" navigation button should be disabled
