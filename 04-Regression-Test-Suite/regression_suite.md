# 🧪 Regression Test Suite - Full E-Commerce Validation

## 📌 Overview
This suite encompasses 100% of the behavior-driven specifications defined for the OWASP Juice Shop application. The regression cycle is designed to prevent functional regressions, validate edge cases, and ensure that all business logic remains intact after environment resets or application updates.

---

## 🎯 Execution Strategy & Tagging
To optimize execution, scenarios are categorized using Gherkin `@Tags`. This allows target execution based on test cycles or specific modules:

- `@Regression`: Applied to all functional scenarios across the repository.
- `@Smoke`: Critical path scenarios (also referenced in `03-Smoke-Test-Suite/`).
- `@Negative`: Input validations, boundary failures, and error-handling paths.
- `@DataDriven`: Scenarios using `Scenario Outline` data tables.

---

## 🗺️ Suite Mapping & Traceability

The regression cycle requires the complete verification of the following mapped components from the `01-Requirements-BDD/` directory:

### 📑 1. Access & Security (`@Authentication`)
- **File:** `01-authentication.feature`
- **Scope:** 
  - Successful and failed user registration paths.
  - Password mismatch boundary validations.
  - Login authentication with valid/invalid credentials.
  - Input field masking and visibility toggles.
  - Account recovery via security questions (Forgot Password workflow).

### 📑 2. Product Discovery (`@Search` & `@Catalog`)
- **Files:** `02-search.feature` & `03-product_catalog.feature`
- **Scope:**
  - Case-insensitive search alignment (e.g., "JUICE" vs "juice").
  - Search execution with alphanumeric and special characters.
  - Unauthenticated browsing boundaries vs authenticated detailed views.
  - Character length constraints on reviews (Equivalence Partitioning).
  - Pagination grid controls (12, 24, 36 items) and boundary navigation limits.

### 📑 3. Transactional Flow (`@Cart` & `@Checkout`)
- **Files:** `04-cart.feature` & `05-checkout.feature`
- **Scope:**
  - Item addition synchronization and header counter metrics.
  - Quantity modifications with live pricing recalculations.
  - Maximum stock limit boundary blocks.
  - Multi-step checkout pipeline validation (Address $\rightarrow$ Delivery Speed $\rightarrow$ Payment/Coupons $\rightarrow$ Order Completion).

---

## ⚙️ Environment Configurations
- **Database State:** Must be completely truncated and restored to default seed values before initiating the full regression run.
- **Cross-Browser Scope:** Execution must be split across Google Chrome and Microsoft Edge to validate engine compatibility.
