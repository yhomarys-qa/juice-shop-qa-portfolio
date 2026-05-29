# language: en
Feature: 🛒 Shopping Cart Management
  As an authenticated customer of OWASP Juice Shop
  I want to add, modify, and remove products within my shopping cart
  So that I can manage my items accurately before proceeding to checkout

  Background: User Login and Catalog Access
    Given I am logged into my account
    And I am browsing the product catalog

  Scenario: ➕ Add product to shopping cart successfully
    When I click the "Add to Basket" button on a product card
    Then a confirmation toast message "Placed item into basket" should appear
    And the cart item counter in the header should increase by 1

  Scenario Outline: 🔄 Update item quantities and pricing recalculation
    Given I have added a product to my shopping cart
    And I navigate to the shopping cart page
    When I change the product quantity to <new_quantity>
    Then the item subtotal and the total basket price must update to <expected_price_state>

    Examples:
      | new_quantity | expected_price_state |
      | 2            | "Multiplied value"   |
      | 5            | "Multiplied value"   |

  Scenario: 🛑 Prevent quantity expansion beyond available stock boundaries
    Given a product has a maximum stock limit of 5 items
    And I have added this product to my shopping cart
    And I navigate to the shopping cart page
    When I attempt to increase the product quantity to 6
    Then the system must block the increase operation
    And an error or boundary warning message should be displayed

  Scenario: 🗑️ Remove product completely from shopping cart
    Given I have a product inside my shopping cart
    And I navigate to the shopping cart page
    When I click the "Delete" icon button next to the product
    Then the product should be instantly removed from the basket grid
    And the total basket price and header counter must decrease accordingly
