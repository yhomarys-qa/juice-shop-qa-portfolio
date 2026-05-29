# 💨 Smoke Test Suite - Critical Path Validation

## 📌 Overview
The Smoke Test Suite is a curated selection of critical path scenarios designed to verify the basic health and stability of the OWASP Juice Shop application. It runs immediately after code deployments or environment resets to ensure that core user journeys are completely functional before deeper testing begins.

---

## 🧭 Execution Strategy
- **Frequency:** Executed upon every environment deployment or state reset.
- **Scope:** High-level "happy path" workflows covering end-to-end user transactions.
- **Target Execution Time:** Less than 5 minutes (when executed manually).
- **Environment:** Clean application state with default seed data.

---

## 📋 Mapped Scenarios & Expected Behaviors

This suite pulls the most critical behaviors defined in the `01-Requirements-BDD/` directory into a single, rapid execution cycle:

### 🔐 1. Access Integrity
* **Scenario 01 – User Registration:** Validates that a brand-new customer can fill out credentials, select a security question, and successfully register an account.
* **Scenario 02 – User Login:** Ensures that a registered user can successfully authenticate and access their private profile view.

### 🔍 2. Product Discovery
* **Scenario 03 – Product Search:** Verifies that the global header search function expands, accepts input (e.g., "APPLE"), and successfully filters the main catalog grid.

### 🛒 3. Transactional Flow
* **Scenario 04 – Add to Basket:** Confirms that clicking the "Add to Basket" button triggers the confirmation message and increments the global cart counter.
* **Scenario 05 – End-to-End Purchase:** Validates the entire checkout pipeline in a single thread (Address Selection $\rightarrow$ Delivery Speed $\rightarrow$ Payment $\rightarrow$ Final Order Confirmation).

---

## 🛑 Critical Blockers (Stop-Test Criteria)
If any scenario within this suite **FAILS**, the application is considered unstable. Testing must be halted immediately, a critical bug must be raised in `06-Bug-Reports/`, and the build should be rejected.
