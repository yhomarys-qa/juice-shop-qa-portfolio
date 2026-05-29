# language: en
Feature: 💳 Checkout Process
  As an authenticated customer with items in my shopping cart
  I want to complete the checkout steps by selecting an address, delivery speed, and payment method
  So that I can successfully purchase my products and generate an order confirmation

  Background: Initiate Checkout Flow
    Given I am logged into my account
    And I have valid products inside my shopping cart
    And I am on the shopping cart page
    When I click the "Checkout" button

  Scenario: 📍 Step 1 - Add and select a delivery address successfully
    When I select an existing delivery address radio button
    And I click the "Continue" button
    Then I should be advanced to the Delivery Speed selection step

  Scenario Outline: 🚚 Step 2 - Select delivery speed and verify pricing impact
    Given I am on the Delivery Speed selection step
    When I select the <delivery_option> speed option
    And I click the "Continue" button
    Then the shipping price should be calculated as <shipping_cost>
    And I should be advanced to the Payment Method step

    Examples:
      | delivery_option | shipping_cost |
      | "One-Day Delivery"| "Highest fee" |
      | "Standard Delivery"| "Lowest fee"  |

  Scenario: 💳 Step 3 - Select payment method and apply promotional coupon
    Given I am on the Payment Method step
    When I select a valid credit card option
    And I expand the "Review / Coupon" section
    And I input a valid promotional coupon code
    And I click the "Apply" button
    Then the total order price should be discounted dynamically

  Scenario: 🚀 Step 4 - Finalize order review and complete purchase
    Given I am on the final Order Review page
    When I review my items, shipping address, and payment terms
    And I click the "Place your order and pay" button
    Then I should be redirected to the Order Completion page
    And the system must display a success message "Thank you for your purchase!"
    And my shopping cart should be automatically emptied
