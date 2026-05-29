# 🐛 Bug Report: "Remember Me" Option Fails to Persist User Session

## 📋 Bug Overview
- **Bug ID:** BUG-002
- **Module:** Login / Authentication
- **Severity:** Medium (Degrades core user experience and standard behavior)
- **Priority:** Medium
- **Status:** Open

---

## 🔍 Preconditions
- User account must be registered
- User must be on the Login page
  
---

## 🧪 Steps to Reproduce
1. Open the application Login interface.
2. Inputs valid, active user account credentials.
3. Check the **"Remember me"** checkbox selection flag.
4. Click on the **[Log in]** button to initialize the session.
5. Close the active web browser application window completely.
6. Re-open the web browser.
7. Attempt to access the application URL path again.

---

## 🎯 Expected Result
The cookie/token session architecture should recognize the persistence flag, keeping the authentication scope valid and preventing the user from needing to re-enter credentials upon returning.

## ⚠️ Actual Result
The active session payload is dropped entirely when the window terminates. The user returns unauthenticated and is forced to repeat the complete login authentication cycle.

---

## 💻 Test Environment
| Item | Details |
| :--- | :--- |
| **Operating System** | Windows 10 |
| **Browser** | Google Chrome v145.0.7632.76 (64-bit) |
| **Application Version** | OWASP Juice Shop (Demo Sandbox) |

---

## 📎 Attachments
- Screenshot showing that the user is redirected to the Login page after browser restart despite enabling the "Remember me" option

<img width="1918" height="1157" alt="BUG-002 Screen recording demonstrates session is not preserved after browser restart when Remember me option is enabled" src="https://github.com/user-attachments/assets/38ace783-14d8-4b8e-b77d-a6043df8e1a1" />
