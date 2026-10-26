# Data Dictionary — Synthetic E-commerce Returns Dataset

All 5,000 rows in `data/raw/amazon_india_returns_dataset_5000.csv` are synthetic and intended for business analysis practice. Column names follow the industry-standard lowercase `snake_case` convention for seamless SQL, Python, and BI tool ingestion.

| Field (`snake_case`) | Type | Description | Notes |
|---|---|---|---|
| `return_id` | Text | Synthetic unique return identifier | `RET-200001` to `RET-205000` |
| `phase` | Category | Scenario cohort: `Pre-Redesign (As-Is)` (2,521 rows) or `Post-Redesign (To-Be)` (2,479 rows) | Constructed scenario labels, not observed production phases |
| `customer_state` | Category | Fictional customer state / region | 8 Indian regional markets |
| `product_category` | Category | Merchandise category | `Apparel`, `Electronics`, `Footwear`, `Home & Kitchen`, `Beauty & Personal Care`, etc. |
| `return_reason` | Category | Customer-selected return reason | Synthetic values |
| `original_payment_mode` | Category | Payment method used on original order | `Pay on Delivery (PoD / COD)`, `UPI`, `Credit/Debit Card`, `NetBanking`, `Wallet` |
| `order_value_inr` | Integer | Simulated order value in INR (`₹`) | Used as denominator for descriptive fraud ratio |
| `resolution_path` | Category | Simulated resolution outcome | `Monetary Refund`, `Exchange/Replacement`, `Amazon Pay Balance`, etc. |
| `risk_routing_channel` | Category | Simulated routing path | `FC C-Returns Hub Hold (100%)`, `Green Channel (Doorstep Instant)`, `Red Channel (FC C-Returns Hold)` |
| `refund_turnaround_hours` | Float | Simulated refund turnaround time in hours | Synthetic field; mean is 226.98h (As-Is) vs. 10.24h (To-Be) |
| `reverse_logistics_cost_inr` | Integer | Simulated reverse pickup/shipping cost in INR (`₹`) | Synthetic values |
| `retained_revenue_inr` | Integer | Simulated retained revenue value in INR (`₹`) | Synthetic values associated with exchange/wallet outcomes |
| `fraud_leakage_inr` | Integer | Simulated fraud loss value in INR (`₹`) | Sum is `₹390,810` (As-Is) vs. `₹65,040` (To-Be) |
| `wismr_support_ticket_raised` | Category | `Yes` / `No` flag indicating whether a "Where Is My Refund?" ticket was raised | Rate is 41.65% (As-Is) vs. 8.71% (To-Be) |
| `customer_csat_1to5` | Integer | Simulated post-return satisfaction score (`1` to `5`) | Mean is 2.32 (As-Is) vs. 4.23 (To-Be) |
