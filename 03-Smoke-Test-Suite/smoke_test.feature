# language: en
@Smoke
Feature: 💨 Smoke Test Suite - Core E-Commerce Flow
  As a QA Engineer
  I want to execute the critical path scenarios of the OWASP Juice Shop
  So that I can quickly verify if the application deployment is stable and major features work

  # ==========================================
  # 01 - AUTHENTICATION MODULE
  # ==========================================

  Scenario: 📝 Smoke 01 - Critical User Registration
    Given I am on the application login page
    When I click on the "Not yet a customer?" link
    And I enter a unique email address
    And I enter a valid password conforming to security rules
    And I repeat the identical password in the "Repeat Password" field
    And I select a security question and provide an answer
    And I click the "Register" button
    Then the system should display a success message "Registration completed successfully"

  Scenario: 🎯 Smoke 02 - Critical User Login
    Given I am on the application login page
    When I enter a valid and registered email
    And I enter the correct corresponding password
    And I click the "Log in" button
    Then I should be redirected to the homepage
    And I should see my profile as authenticated

  # ==========================================
  # 02 & 03 - SEARCH & CATALOG MODULES
  # ==========================================

  Scenario: 🔍 Smoke 03 - Core Product Search Execution
    Given I am on the main page of the application
    When I click on the search icon in the header
    And I type "APPLE" into the search field
    And I press enter or execute the search
    Then the system should filter the catalog grid

  # ==========================================
  # 04 - SHOPPING CART MODULE
  # ==========================================

  Scenario: ➕ Smoke 04 - Core Add Item to Basket
    Given I am logged into my account
    And I am browsing the product catalog
    When I click the "Add to Basket" button on a product card
    Then the cart item counter in the header should increase by 1

  # ==========================================
  # 05 - CHECKOUT MODULE
  # ==========================================

  Scenario: 💳 Smoke 05 - End-to-End Purchase Finalization
    Given I am logged into my account
    And I have valid products inside my shopping cart
    And I am on the shopping cart page
    When I click the "Checkout" button
    And I select an existing delivery address radio button
    And I click the "Continue" button
    And I select the "Standard Delivery" speed option
    And I click the "Continue" button
    And I select a valid credit card option
    And I click the "Continue" button
    And I click the "Place your order and pay" button
    Then I should be redirected to the Order Completion page
    And the system must display a success message "Thank you for your purchase!"
