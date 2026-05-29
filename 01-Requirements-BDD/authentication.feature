# language: en
Feature: 🔐 User Authentication, Registration & Recovery
  As a new, returning, or locked-out customer of OWASP Juice Shop
  I want to register, log in, or recover my account credentials
  So that I can securely access my profile and manage my purchases

  Background: System Setup
    Given I am on the application login page

  # --- REGISTRATION SCENARIOS ---

  Scenario: 📝 Successful user registration
    When I click on the "Not yet a customer?" link
    And I enter a unique email address
    And I enter a valid password conforming to security rules
    And I repeat the identical password in the "Repeat Password" field
    And I select a security question and provide an answer
    And I click the "Register" button
    Then the system should display a success message "Registration completed successfully"
    And I should be automatically redirected back to the Login page

  Scenario: ❌ Registration submission with empty fields
    When I click on the "Not yet a customer?" link
    And I leave all mandatory fields blank
    Then the "Register" button should remain disabled
    And individual validation error messages should be displayed below each mandatory field

  Scenario: ⚠️ Password confirmation mismatch during registration
    When I click on the "Not yet a customer?" link
    And I enter a valid password in the "Password" field
    And I enter a different password in the "Repeat Password" field
    Then the system should display the error message "Passwords do not match"
    And the "Register" button should be disabled

  # --- LOGIN SCENARIOS ---

  Scenario: 🎯 Successful login
    When I enter a valid and registered email
    And I enter the correct corresponding password
    And I click the "Log in" button
    Then I should be redirected to the homepage
    And I should see my profile as authenticated

  Scenario: ❌ Login submission with empty fields
    When I leave the "Email" and "Password" fields blank
    And I attempt to submit the form
    Then mandatory field error messages should be displayed
    And the "Log in" button should remain disabled

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

  # --- PASSWORD RECOVERY SCENARIOS (FORGOT PASSWORD) ---

  Scenario: 🔑 Successful password change via security question
    When I click on the "Forgot Password" link
    And I enter my registered email address
    And I provide the correct answer to my security question
    And I enter a new valid password and confirm it
    And I click the "Change" button
    Then the system should display a confirmation message "Your password was successfully updated"
    And I should be able to log in using the new password

  Scenario: 🔒 Account recovery blocked by wrong security answer
    When I click on the "Forgot Password" link
    And I enter my registered email address
    And I provide an incorrect answer to my security question
    And I enter a new valid password and confirm it
    And I click the "Change" button
    Then the system should display an error message indicating invalid parameters
    And the password update must be rejected

  Scenario: 🛑 Recovery submission with empty required fields
    When I click on the "Forgot Password" link
    And I leave the email, security answer, or password fields blank
    Then the "Change" button must remain disabled
    And the system should prevent the recovery request submission
