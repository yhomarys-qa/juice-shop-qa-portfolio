# 🧪 Test Plan – OWASP Juice Shop (BDD Approach)

## 📌 Introduction

This Test Plan defines the strategy, scope, approach, and deliverables for testing the OWASP Juice Shop application using a **Behavior-Driven Development (BDD)** framework. 

The objective is to ensure functional correctness, validate user behavior through Gherkin scenarios, and evaluate security weaknesses in core workflows.

---

## 🎯 Objectives

- Validate core application functionalities using behavior-driven scenarios.
- Ensure that business requirements align perfectly with user expectations (**Given/When/Then** structure).
- Identify functional, edge-case, and non-functional defects.
- Perform negative and security-focused testing on input boundaries.

---

## 📦 Scope

### ✅ In Scope

The testing scope aligns directly with the business behaviors specified in the `01-Requirements-BDD/` directory:

- **01-Authentication:** User Registration, Login, and Account Recovery workflows.
- **02-Search Functionality:** Case-insensitive product filtering and character validation.
- **03-Product Catalog:** Main catalog grid, item details, pagination, and comment boundaries.
- **04-Shopping Cart:** Item addition, quantity adjustments, and stock limit constraints.
- **05-Checkout Process:** Address selection, delivery speeds, payment methods, coupons, and final confirmation.

---

### ❌ Out of Scope

- Performance and Load Testing.
- Test Automation Scripting (Scenarios are designed in Gherkin for manual execution but structured to be automation-ready).
- Direct Database or Backend Source Code Analysis.

---

## 🧪 Testing Types

- **Behavior-Driven Testing (BDT):** Executing structured scenarios written in Gherkin syntax.
- **Functional & Regression Testing:** Verifying existing features remain intact after application state resets.
- **Boundary Value Analysis (BVA) & Equivalence Partitioning (EP):** Applied directly to validation fields within Gherkin data tables (e.g., comment lengths and stock limits).
- **Security & Negative Testing:** Input manipulation targeting common web vulnerabilities (e.g., injection and logical bypasses).

---

## 🧭 Test Approach

Testing will follow an agile approach based on specification by example:

- **Scenario-Based Execution:** Testing will be executed manually using the `.feature` files as the absolute source of truth.
- **Exploratory Testing:** Session-based exploration beyond the written scenarios to discover hidden logical flaws.
- **Defect Mapping:** Every reported bug will be directly mapped back to its corresponding BDD feature and scenario number.

---

## 🛠️ Test Environment & Tools

- **Application:** OWASP Juice Shop (Local instance / Public Sandbox).
- **Browsers:** Google Chrome and Microsoft Edge (Chromium-based engines) to ensure compatibility.
- **OS:** Windows 11 / macOS.
- **Documentation:** GitHub Markdown & Gherkin Editor syntax.

---

## 📋 Test Deliverables

- **01-Requirements-BDD/** (Gherkin `.feature` specifications)
- **02-Test-Plan/** (This strategic document)
- **04-Smoke-Test-Suite/** (Curated selection of critical path scenarios)
- **05-Regression-Test-Suite/** (Full suite of BDD scenarios for complete validation)
- **06-Test-Execution-Reports/** (Pass/Fail metrics and execution evidence)
- **07-Bug-Reports/** (Detailed issue logging mapped to features)

---

## 🚪 Entry & Exit Criteria

### Entry Criteria
- The BDD feature files (`.feature`) for the targeted modules are finalized and numbered.
- The OWASP Juice Shop environment is active, stable, and data has been reset to default values.

### Exit Criteria
- 100% of the defined Gherkin scenarios have been executed.
- All high and critical bugs discovered during execution are documented in the `07-Bug-Reports/` directory.
- Regression and Smoke suites have been run and documented.

---

## ⚠️ Risks & Success Criteria

### Risks
- **Intentional Vulnerabilities:** The app has built-in security flaws by design which might cause unexpected system states during standard testing.
- **State Persistence:** Session timeouts or cookies might affect sequential e-commerce workflow testing (Cart to Checkout).

### Success Criteria
- High test coverage over all defined BDD criteria.
- Complete traceability from Requirement $\rightarrow$ Scenario $\rightarrow$ Execution Report $\rightarrow$ Bug Report.
