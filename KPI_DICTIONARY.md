# KPI Dictionary — Synthetic Dataset

These metrics are calculated from `data/raw/amazon_india_returns_dataset_5000.csv`. The dataset is synthetic; comparisons are descriptive only and do not prove that a proposed redesign caused the differences.

| KPI | Definition | Pre-redesign | Post-redesign |
|---|---|---:|---:|
| Average refund turnaround | Mean of `Refund_Turnaround_Hours` | 226.98 hours | 10.24 hours |
| WISMR ticket rate | Records with `WISMR_Support_Ticket_Raised = Yes` / all records | 41.65% | 8.71% |
| Average CSAT | Mean of `Customer_CSAT_1to5` | 2.32 / 5 | 4.23 / 5 |
| Fraud leakage amount | Sum of `Fraud_Leakage_INR` | ₹390,810 | ₹65,040 |
| Fraud leakage ratio | Sum of `Fraud_Leakage_INR` / sum of `Order_Value_INR` | 7.90% | 1.32% |

## Data caveats
- There are 5,000 rows: 2,521 pre-redesign and 2,479 post-redesign.
- The records are synthetic and not a sample of actual customers.
- `Resolution_Path` contains multiple categories; do not calculate an exchange/wallet retention KPI until the exact included categories and denominator are defined.
- There is no Pay on Delivery (PoD / COD) payout-attempt outcome field, so Pay on Delivery (PoD / COD) first-attempt payout success cannot be calculated from this file.
- Refund turnaround is a synthetic field. It should not be described as an observed service-level result.
- The fraud ratio above uses total order value as the denominator. It is not necessarily equivalent to a fraud rate defined using returned GMV.

## Recommended reporting practice
Show the numerator, denominator, time period, and population for every KPI. Label proposed targets separately from measured results. If this were a real project, validate metric definitions with Finance, Operations, and Customer Support before publishing a dashboard.


---

## Full KPI Definitions Table (`data/processed/kpi_definitions_and_impact.csv`)

| kpi_id | kpi_name | formula_calculation_logic | unit | pre_redesign_synthetic_records | post_redesign_synthetic_records | difference_descriptive | interpretation_limitation |
| --- | --- | --- | --- | --- | --- | --- | --- |
| KPI-01 | Average refund turnaround time | Mean(Refund_Turnaround_Hours) | Hours | 226.98 | 10.24 | Descriptive difference only | Synthetic field; not a measured operational SLA. |
| KPI-02 | Exchange / wallet retention rate | Requires validated Resolution_Path categories and denominator | Not reported | Not calculated | Not calculated | Not available from current definition | Define included resolution paths before calculating. |
| KPI-03 | WISMR ticket rate | Count(WISMR_Support_Ticket_Raised = Yes) / all records | Percentage | 41.65% | 8.71% | Descriptive difference only | Synthetic labels; not a real support-ticket audit. |
| KPI-04 | Pay on Delivery (PoD / COD) first-attempt payout success | Requires payout attempt outcome field | Not reported | Not available | Not available | Cannot be calculated | Dataset has payment mode but no payout outcome. |
| KPI-05 | Fraud leakage ratio | Sum(Fraud_Leakage_INR) / Sum(Order_Value_INR) | Percentage | 7.90% | 1.32% | Descriptive difference only | Denominator is order value, not returned GMV; synthetic values. |
| KPI-06 | Average customer CSAT | Mean(Customer_CSAT_1to5) | Score (1–5) | 2.32 | 4.23 | Descriptive difference only | Synthetic ratings; not a measured customer survey. |

---

## State-Wise Synthetic Returns Summary (`data/processed/state_wise_returns_inr.csv`)

| customer_state | implementation_phase | total_returns | avg_refund_tat_hours | retained_revenue_inr | fraud_leakage_inr | avg_csat_1to5 |
| --- | --- | --- | --- | --- | --- | --- |
| Delhi NCR | Post-Redesign (To-Be) | 348 | 9.6 | 378580 | 11830 | 4.25 |
| Delhi NCR | Pre-Redesign (As-Is) | 348 | 228.2 | 59500 | 36830 | 2.36 |
| Gujarat | Post-Redesign (To-Be) | 416 | 11.0 | 419940 | 4220 | 4.19 |
| Gujarat | Pre-Redesign (As-Is) | 468 | 226.8 | 96940 | 81300 | 2.4 |
| Karnataka | Post-Redesign (To-Be) | 418 | 9.5 | 445430 | 7740 | 4.23 |
| Karnataka | Pre-Redesign (As-Is) | 412 | 229.7 | 85320 | 77940 | 2.33 |
| Maharashtra | Post-Redesign (To-Be) | 499 | 10.9 | 479150 | 21730 | 4.22 |
| Maharashtra | Pre-Redesign (As-Is) | 500 | 226.8 | 109980 | 76430 | 2.28 |
| Rajasthan | Post-Redesign (To-Be) | 188 | 10.0 | 234270 | 2370 | 4.27 |
| Rajasthan | Pre-Redesign (As-Is) | 212 | 228.3 | 53170 | 40200 | 2.3 |
| Tamil Nadu | Post-Redesign (To-Be) | 279 | 10.2 | 330040 | 9820 | 4.34 |
| Tamil Nadu | Pre-Redesign (As-Is) | 237 | 227.4 | 41730 | 40910 | 2.21 |
| Telangana | Post-Redesign (To-Be) | 184 | 10.2 | 185760 | 7330 | 4.17 |
| Telangana | Pre-Redesign (As-Is) | 182 | 219.4 | 25260 | 7970 | 2.29 |
| West Bengal | Post-Redesign (To-Be) | 147 | 10.3 | 156800 | 0 | 4.16 |
| West Bengal | Pre-Redesign (As-Is) | 162 | 224.6 | 32650 | 29230 | 2.35 |
