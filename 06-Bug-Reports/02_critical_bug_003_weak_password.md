# 🐛 Bug Report: Weak Password Accepted During User Registration

## 📋 Bug Overview
- **Bug ID:** BUG-003
- **Module:** Registration
- **Severity:** High / Critical (Severe OWASP security non-compliance)
- **Priority:** High
- **Status:** Open

---

## 🔍 Preconditions
- User must be an unauthenticated guest positioned on the core Registration page.

---

## 🧪 Steps to Reproduce
1. Open the Registration form page.
2. Enter a weak password containing exclusively lowercase text characters (e.g., `passwordtest`).
3. Populate all remaining mandatory fields with valid, syntactically correct information.
4. Click on the **[Sign up]** / **[Register]** submission button.

---

## 🎯 Expected Result
The system input validation layer must actively intercept the submission, block account creation, and render specific feedback indicators highlighting missing requirements:
- Minimum length constraint (8 characters)
- Missing upper-case alphabetic characters
- Missing numeric characters
- Missing specialized symbols/characters

The registration pipeline must remain locked until these policy elements are fulfilled.

## ⚠️ Actual Result
The boundary validation layer completely ignores complexity specifications. The account is successfully provisioned in the backend database, and the user registration process finishes without any structural errors.

---

## 💻 Test Environment
| Item | Details |
| :--- | :--- |
| **Operating System** | Windows 10 |
| **Browser** | Google Chrome v145.0.7632.76 (64-bit) |
| **Application Version** | OWASP Juice Shop (Demo Sandbox) |

---

## 📎 Attachments
- `video_registration_security_bypass.mp4`: Screen recording demonstrating registration execution with insecure credential configurations.
