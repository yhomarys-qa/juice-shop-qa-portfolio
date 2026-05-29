# language: en
Feature: 🔐 User Authentication (Login)
  As a registered customer of OWASP Juice Shop
  I want to enter my credentials on the login page
  So that I can access my account, view my profile, and complete purchases

  Background: System Setup
    Given I am on the application login page

  Scenario: 🎯 Successful login
    When I enter a valid and registered email
    And I enter the correct corresponding password
    And I click the "Log in" button
    Then I should be redirected to the homepage
    And I should see my profile as authenticated

  Scenario: ❌ Submission with empty fields
    When I leave the "Email" and "Password" fields blank
    And I attempt to submit the form
    Then mandatory field error messages should be displayed
    And the "Log in" button should remain disabled

  Scenario: ⚠️ Invalid email format validation
    When I enter a text outside the standard "user@domain.com" format in the "Email" field
    Then the system should display a blocking error message
    And the "Log in" button should be disabled

  Scenario: 🚫 Login attempt with incorrect credentials
    When I enter an unregistered email or an incorrect password
    And I click the "Log in" button
    Then the system should display the generic error message "Invalid email or password"
    And account access should be prevented

  Scenario: 👁️ Password masking and visibility toggle
    When I type characters into the "Password" field
    Then the text should be masked by default by asterisks or bullets
    When I click the visibility toggle button (eye icon)
    Then the password text should be revealed in plain text

  Scenario: ⌨️ Form submission via keyboard
    When I fill in the "Email" and "Password" fields with valid data
    And I press the "Enter" key on my keyboard
    Then the form should be submitted exactly as if the "Log in" button was clicked

  Scenario: 🔄 Navigation to alternative flows
    When I view the bottom of the login page
    Then I should be able to click on the "Forgot Password" and "Not yet a customer?" links to be redirected to their respective pages
