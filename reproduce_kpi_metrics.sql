-- ============================================================================
-- Reproducible KPI Verification Queries (SQL)
-- Dataset: 08_kpi_definitions_and_returns_dataset/data/raw/amazon_india_returns_dataset_5000.csv
-- ============================================================================

-- 1. Executive Cohort KPI Summary (Pre-Redesign vs. Post-Redesign)
SELECT
    phase AS scenario_cohort,
    COUNT(*) AS total_records,
    ROUND(AVG(refund_turnaround_hours), 2) AS mean_refund_turnaround_hours,
    ROUND(SUM(CASE WHEN wismr_support_ticket_raised = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS wismr_ticket_rate_pct,
    ROUND(AVG(customer_csat_1to5), 2) AS mean_customer_csat,
    SUM(fraud_leakage_inr) AS total_fraud_leakage_inr,
    ROUND(SUM(fraud_leakage_inr) * 100.0 / SUM(order_value_inr), 2) AS fraud_leakage_pct_of_order_value
FROM amazon_india_returns_dataset_5000
GROUP BY phase
ORDER BY phase DESC;

-- 2. State-Wise Returns Performance Summary (INR)
SELECT
    customer_state,
    phase AS implementation_phase,
    COUNT(*) AS total_returns,
    ROUND(AVG(refund_turnaround_hours), 1) AS avg_refund_tat_hours,
    SUM(retained_revenue_inr) AS retained_revenue_inr,
    SUM(fraud_leakage_inr) AS fraud_leakage_inr,
    ROUND(AVG(customer_csat_1to5), 2) AS avg_csat_1to5
FROM amazon_india_returns_dataset_5000
GROUP BY customer_state, phase
ORDER BY customer_state ASC, phase ASC;
