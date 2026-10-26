# Audit and Change Log

## What was checked
- ZIP archive structure and included deliverables.
- CSV row count, columns, missing values, duplicate rows, and duplicate return IDs.
- Descriptive KPI calculations grouped by the `Phase` field.
- Consistency of claims in Markdown documentation and the KPI workbook.
- UAT and RTM language that could imply tests or approvals had already occurred.

## Changes made
- Rewrote the README to describe the work as a fictional, self-directed case study.
- Removed unsupported operational claims, annual savings, and causal impact claims from the README.
- Recalculated supported metrics directly from the synthetic CSV.
- Updated the KPI workbook and dictionary; marked unsupported KPIs as unavailable rather than inventing values.
- Rewrote the BRD and aligned the Word version with the Markdown version.
- Reframed journey, stakeholder, and risk documents as proposals/hypotheses rather than findings from a real audit.
- Clarified that UAT scenarios are planned and have not been executed.
- Added `.gitignore` and this change log.

## Validation findings
- Dataset contains 5,000 rows and 15 columns.
- No missing values or fully duplicated rows were found in the CSV during this check.
- Phase counts: 2,521 pre-redesign and 2,479 post-redesign.
- Pre-redesign mean refund turnaround: 226.98 hours; post-redesign: 10.24 hours.
- Pre-redesign WISMR ticket rate: 41.65%; post-redesign: 8.71%.
- Pre-redesign mean CSAT: 2.32/5; post-redesign: 4.23/5.
- Fraud leakage / total order value: 7.90% pre-redesign and 1.32% post-redesign.

## Remaining limitations
- The data is synthetic, so the differences are illustrative and not evidence of real-world impact.
- Policy thresholds and payout workflows still need stakeholder, legal/compliance, security, finance, and engineering review.
- User stories, stakeholder matrix, and requirements traceability should be reconciled before a final interview presentation.
- UAT has not been executed against a working application.

## GitHub Data Standardization Updates
- **Converted All Binary Excel Workbooks into Diffable UTF-8 CSVs:** Extracted all 8 multi-sheet `.xlsx` tables (Stakeholder Register, RACI Matrix, Agile User Stories & MoSCoW Backlog, UAT Test Scenarios, Requirements Traceability Matrix, Risk Register, KPI Definitions, and State-Wise Returns) plus the Business Rules Decision Matrix into flat, UTF-8 encoded `.csv` files with single-row `snake_case` headers for interactive GitHub browser rendering and line-by-line Git diffs.
- **Reconciled UAT Actual Result Text with `Not Run` Status:** Replaced simulated past-tense UAT actual result entries in `uat_test_scenarios.csv` and `uat_scenarios_and_rtm.xlsx` with explicit `Not executed — planned test scenario only` text so they are 100% consistent with `Status = Not Run`.
- **Separated Raw vs. Processed Data:** Structured `08_kpi_definitions_and_returns_dataset/` into `data/raw/` (5,000-row synthetic CSV with standardized `snake_case` column names), `data/processed/` (state-wise, category-wise, and executive KPI summary CSVs), and `dashboards/` (original Excel workbook), accompanied by a dedicated `DATA_DICTIONARY.md`.
- **Enforced `snake_case` Naming & Added Reproducible Scripts:** Standardized all folder and file paths to lowercase `snake_case` and added `scripts/reproduce_kpi_metrics.sql` and `scripts/generate_processed_summaries.py`.

## Amazon India (Amazon.in) Domain Alignment Updates
- **Reframed Case Study for Amazon India (`Amazon.in`):** Updated all documentation, BRD (`Markdown` & `Word`), user stories, business rules, stakeholder personas, risk register, and UAT scenarios to reflect Amazon India's operational ecosystem (`Your Orders`, **ASINS / FNSKU / LPN** barcodes, **Amazon Prime** 3-day grace window, **Amazon Pay Balance** instant refund bonus, **Pay on Delivery (PoD / COD)** to verified UPI VPA penny-drop, **Amazon Transportation Services (ATS)** Delivery Associate **Rabbit App** 4-point doorstep QC, **Fulfillment Center (FC) C-Returns / AFT** inspection, and **Seller Central SAFE-T** claims).
- **Updated Synthetic Dataset & Scripts:** Renamed raw dataset to `amazon_india_returns_dataset_5000.csv` and updated `resolution_path` (`Amazon Pay Balance (+5%)`, `Rejected at FC C-Returns Hub`) and `risk_routing_channel` (`FC C-Returns Hub Hold (100%)`, `Red Channel (FC C-Returns Hold)`) values across all CSVs, Excel workbooks, and SQL/Python verification scripts.
- **Explicit Portfolio Disclaimer Maintained:** Clearly stated across README and BRD that this is an independent, self-directed Business Analyst portfolio case study modeled on Amazon.in concepts using synthetic data, and is not affiliated with or endorsed by Amazon.
