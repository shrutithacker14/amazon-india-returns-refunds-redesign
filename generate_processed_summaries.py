"""
Reproducible Data Pipeline: Generates processed KPI summary CSVs from raw synthetic dataset.
Usage: python scripts/generate_processed_summaries.py
"""
import os
import pandas as pd

RAW_PATH = os.path.join("08_kpi_definitions_and_returns_dataset", "data", "raw", "amazon_india_returns_dataset_5000.csv")
PROCESSED_DIR = os.path.join("08_kpi_definitions_and_returns_dataset", "data", "processed")

def main():
    df = pd.read_csv(RAW_PATH)
    os.makedirs(PROCESSED_DIR, exist_ok=True)

    state_summary = df.groupby(['customer_state', 'phase'], as_index=False).agg(
        total_returns=('return_id', 'count'),
        avg_refund_tat_hours=('refund_turnaround_hours', lambda x: round(x.mean(), 1)),
        retained_revenue_inr=('retained_revenue_inr', 'sum'),
        fraud_leakage_inr=('fraud_leakage_inr', 'sum'),
        avg_csat_1to5=('customer_csat_1to5', lambda x: round(x.mean(), 2))
    ).rename(columns={'phase': 'implementation_phase'})

    state_summary.to_csv(os.path.join(PROCESSED_DIR, "state_wise_returns_inr.csv"), index=False)
    print("Saved state_wise_returns_inr.csv successfully.")

if __name__ == "__main__":
    main()
