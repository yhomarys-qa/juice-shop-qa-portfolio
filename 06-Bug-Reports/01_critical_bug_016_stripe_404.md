# 🐛 Bug Report: Stripe Credit Card Option Redirects to 404 Page during Donations

## 📋 Bug Overview
- **Bug ID:** BUG-016
- **Module:** My Payment Options / Other Payment Options (Donations)
- **Severity:** High / Critical (Blocks financial transaction framework)
- **Priority:** High
- **Status:** Open

---

## 🔍 Preconditions
- User is authenticated within the application.
- User has navigated directly to the "My Payment Options" screen and located the "Other Payment Options" section.

---

## 🧪 Steps to Reproduce
1. Access the "My Payment Options" page.
2. Navigate down to the "Other Payment Options" section.
3. Locate the designated **"Donations"** area.
4. Click firmly on the **[Stripe Credit Card]** button to initiate a user donation.

---

## 🎯 Expected Result
The system should securely redirect the user to the official external Stripe gateway hosted payment page, or dynamically render the corresponding embedded credit card processing form so the user can complete their donation.

## ⚠️ Actual Result
The application breaks its internal routing logic, immediately redirecting the authenticated user to a generic `404 Not Found` error page upon clicking the button, completely blocking the donation flow.

---

## 💻 Test Environment
| Item | Details |
| :--- | :--- |
| **Operating System** | Windows 10 |
| **Browser** | Google Chrome v145.0.7632.76 (64-bit) |
| **Application Version** | OWASP Juice Shop (Demo Sandbox) |

---

## 📎 Attachments
- `screenshot_stripe_404_error.png`: Demonstrates the `404 Not Found` layout immediately following the click interaction on the donation button.

<img width="1918" height="1198" alt="BUG-016 Screenshot demonstrates 404 Not Found page after clicking the  Stripe Credit Card  button" src="https://github.com/user-attachments/assets/0a61b8de-7be1-46fc-8857-d94e8fe74395" />
