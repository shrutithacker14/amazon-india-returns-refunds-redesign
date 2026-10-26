# Amazon India (Amazon.in) Returns and Refunds Redesign
## Business Analyst Portfolio Case Study

**Author:** Shruti Thacker ([@shrutithacker14](https://github.com/shrutithacker14))  
**Project type:** Self-directed business analysis case study  
**Domain:** E-commerce operations, customer experience, returns and refunds  
**Status:** Proposed solution; not implemented or validated in a live business

## Overview
This case study explores how an e-commerce business could make its returns and refunds process easier to understand, more consistent, and less dependent on manual support. The work focuses on policy clarity, eligibility rules, exchange options, refund routing, exception handling, and testable requirements.

This project is an **independent, external Business Analyst portfolio case study** modeled around **Amazon India (Amazon.in)** reverse-logistics and refund operations. It is not affiliated with, commissioned by, or endorsed by Amazon. The included 5,000-row dataset is synthetic and is intended for practice only. No real company audit, customer research, production deployment, or stakeholder approval is being claimed.

## Business problem
A typical returns process can create avoidable friction when customers cannot easily understand:
- whether an item is eligible for return or exchange;
- how discounts affect a partial refund;
- what happens after pickup and quality checks;
- how Pay on Delivery (PoD / COD) refunds are paid; and
- when a refund should be delayed for a risk review.

These are problem hypotheses for this portfolio exercise, not findings from a real operational audit.

## Objectives
1. Map the current-state journey and propose a future-state journey.
2. Define return eligibility and exception-handling business rules.
3. Identify stakeholder needs and document a RACI proposal.
4. Prioritize user stories using MoSCoW.
5. Link requirements to UAT scenarios through a traceability matrix.
6. Define measurable KPIs and use synthetic data to demonstrate analysis.

## Proposed solution
- A self-service return and exchange flow.
- Clear eligibility rules with documented exceptions.
- Transparent partial-refund calculations for conditional promotions.
- Risk-based routing for refunds requiring additional checks.
- A guided pickup quality-check process.
- Clear customer status updates and an escalation path.

All timings, thresholds, service levels, payout options, and policy rules in the documents are **proposed assumptions**. They would need review by Operations, Finance, Legal/Compliance, Customer Support, Engineering, and Risk before implementation.

## Repository structure (GitHub BA Standard)
All tabular artefacts are provided in **flat, UTF-8 `.csv` format** (for native GitHub browser table previews and line-by-line version control) alongside **Markdown (`.md`)** documentation and downloadable **Excel/Word (`.xlsx`/`.docx`)** files:

- `01_brd_and_project_scope/`
  - [BRD & Project Scope (.md)](./01_brd_and_project_scope/brd_and_project_scope.md)
  - [BRD in Word (.docx)](./01_brd_and_project_scope/brd_amazon_india_returns_refunds_redesign_v3.0.docx)
- `02_stakeholder_analysis_and_raci/`
  - [Stakeholder Analysis & RACI Summary (.md)](./02_stakeholder_analysis_and_raci/stakeholder_analysis.md)
  - [Stakeholder Register (.csv)](./02_stakeholder_analysis_and_raci/stakeholder_register.csv) & [RACI Governance Matrix (.csv)](./02_stakeholder_analysis_and_raci/raci_governance_matrix.csv)
  - [Combined Workbook (.xlsx)](./02_stakeholder_analysis_and_raci/stakeholder_analysis_and_raci.xlsx)
- `03_customer_journey_maps_as_is_to_be/`
  - [Customer Journey Documentation (.md)](./03_customer_journey_maps_as_is_to_be/customer_journey_documentation.md)
  - [Customer Journey Map: As-Is vs. To-Be (.png)](./03_customer_journey_maps_as_is_to_be/customer_journey_as_is_vs_to_be.png)
- `04_return_eligibility_decision_logic/`
  - [Return Eligibility Business Rules (.md)](./04_return_eligibility_decision_logic/return_eligibility_business_rules.md)
  - [Master Decision Table (.csv)](./04_return_eligibility_decision_logic/return_eligibility_business_rules.csv)
  - [Return Eligibility Decision Tree (.png)](./04_return_eligibility_decision_logic/return_eligibility_decision_tree.png)
- `05_user_stories_and_moscow_backlog/`
  - [Agile Backlog & MoSCoW Summary (.md)](./05_user_stories_and_moscow_backlog/user_stories_and_moscow.md)
  - [User Stories & Gherkin AC (.csv)](./05_user_stories_and_moscow_backlog/user_stories_and_moscow_backlog.csv)
  - [Backlog Workbook (.xlsx)](./05_user_stories_and_moscow_backlog/user_stories_and_moscow_backlog.xlsx)
- `06_uat_scenarios_and_traceability_rtm/`
  - [UAT & RTM Summary (.md)](./06_uat_scenarios_and_traceability_rtm/uat_and_rtm_summary.md)
  - [Planned UAT Test Scenarios (.csv)](./06_uat_scenarios_and_traceability_rtm/uat_test_scenarios.csv) & [Requirements Traceability Matrix (.csv)](./06_uat_scenarios_and_traceability_rtm/requirements_traceability_matrix.csv)
  - [UAT & RTM Workbook (.xlsx)](./06_uat_scenarios_and_traceability_rtm/uat_scenarios_and_rtm.xlsx)
- `07_risk_register_and_exception_handling/`
  - [Risk & Exception Playbook (.md)](./07_risk_register_and_exception_handling/risk_and_exception_playbook.md)
  - [Risk Register (.csv)](./07_risk_register_and_exception_handling/risk_register_and_exception_handling.csv)
  - [Risk Register Workbook (.xlsx)](./07_risk_register_and_exception_handling/risk_register_and_exception_handling.xlsx)
- `08_kpi_definitions_and_returns_dataset/`
  - `data/raw/` — [Synthetic 5,000-row E-commerce Returns Dataset (.csv)](./08_kpi_definitions_and_returns_dataset/data/raw/amazon_india_returns_dataset_5000.csv)
  - `data/processed/` — [KPI Definitions & Impact (.csv)](./08_kpi_definitions_and_returns_dataset/data/processed/kpi_definitions_and_impact.csv), [State-Wise Returns Summary (.csv)](./08_kpi_definitions_and_returns_dataset/data/processed/state_wise_returns_inr.csv), and [Category-Wise Returns Summary (.csv)](./08_kpi_definitions_and_returns_dataset/data/processed/category_wise_returns_inr.csv)
  - `dashboards/` — [KPI Definitions & Dashboard Workbook (.xlsx)](./08_kpi_definitions_and_returns_dataset/dashboards/kpi_definitions_and_dashboard.xlsx)
  - [Data Dictionary (.md)](./08_kpi_definitions_and_returns_dataset/DATA_DICTIONARY.md) & [KPI Dictionary (.md)](./08_kpi_definitions_and_returns_dataset/KPI_DICTIONARY.md)
- `scripts/`
  - [SQL KPI Verification Queries (.sql)](./scripts/reproduce_kpi_metrics.sql) & [Python Summary Generator (.py)](./scripts/generate_processed_summaries.py)

## Exploratory analysis of the synthetic dataset
The dataset contains 5,000 synthetic return records: 2,521 labelled **Pre-Redesign (As-Is)** and 2,479 labelled **Post-Redesign (To-Be)**. The two groups are not perfectly balanced. Results below are descriptive of the generated dataset only and should not be interpreted as causal evidence or forecasts.

| Metric | Pre-redesign records | Post-redesign records |
|---|---:|---:|
| Records | 2,521 | 2,479 |
| Mean refund turnaround | 226.98 hours | 10.24 hours |
| WISMR ticket rate | 41.65% | 8.71% |
| Mean customer CSAT | 2.32 / 5 | 4.23 / 5 |
| Fraud leakage amount in dataset | ₹390,810 | ₹65,040 |
| Fraud leakage / total order value | 7.90% | 1.32% |

**Interpretation caution:** These values are embedded in a synthetic dataset designed for a portfolio demonstration. They are not independently observed baseline or post-launch results. The dataset does not include a field that establishes Pay on Delivery (PoD / COD) payout success, and the `resolution_path` categories must be checked before calculating an exchange/wallet retention KPI. Therefore, this README does not present a Pay on Delivery (PoD / COD) success rate or claim a retention uplift.

## Known limitations and next steps
- No real stakeholder interviews or user research were conducted.
- No application or integration has been built.
- UAT cases are planned scenarios; they have not been executed against a working system.
- The proposed policy thresholds and payout service levels require business, legal, finance, and technical validation.
- The synthetic data is suitable for practice, not for estimating real business impact.

## GitHub upload
From the extracted project directory:

```bash
git init
git add .
git commit -m "Add e-commerce returns and refunds BA case study"
git branch -M main
git remote add origin https://github.com/shrutithacker14/amazon-india-returns-refunds-redesign.git
git push -u origin main
```

See [AUDIT_AND_CHANGELOG.md](./AUDIT_AND_CHANGELOG.md) for audit notes and GitHub standardization updates.
