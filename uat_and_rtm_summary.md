# UAT Scenarios and Requirements Traceability Matrix

The workbook contains draft UAT scenarios and a proposed traceability matrix for the hypothetical returns-and-refunds workflow.

- Scenarios cover eligibility, policy exceptions, payout method validation, partial-refund calculations, risk routing, pickup QC, and returnless-refund exceptions.
- The RTM links requirement IDs to business rules, user stories, UAT scenarios, and intended KPI impacts where applicable.
- These are **planned tests**, not executed or passed tests. No working application is included in this portfolio.
- Traceability completeness should be rechecked whenever requirement IDs or scope change.

Before implementation, add test data, preconditions, exact expected results, execution date, actual result, defect ID, and tester sign-off. Keep all execution statuses as Not Run until tests are actually performed.


---

## Requirements Traceability Matrix (`requirements_traceability_matrix.csv`)

| brd_req_id | requirement_description | business_rule_id | user_story_id | uat_scenario_id | target_kpi_impacted | sign_off_status |
| --- | --- | --- | --- | --- | --- | --- |
| FR-01 | Dynamic Category & Return Window Eligibility | BR-01, BR-02 | US-01 | UAT-01, UAT-02, UAT-03 | Self-Service Adoption >= 85% | Draft |
| FR-02 | 48-Hour Damaged/Wrong Item Override with Photo | BR-01A | US-02 | UAT-04 | Customer CSAT >= 4.5 / 5.0 | Draft |
| FR-03 | Exchange-First UI Nudge & 48h Inventory Lock | BR-04 | US-03 | UAT-05 | Exchange Conversion >= 35% | Draft |
| FR-04 | Instant Amazon Pay Balance Refund with +5% Bonus | BR-04 | US-04 | UAT-05 | Retained Revenue +₹4.8 Cr/yr | Draft |
| FR-05 | Pay on Delivery (PoD / COD)-to-UPI VPA Penny-Drop Verification | BR-07 | US-05 | UAT-06 | Pay on Delivery (PoD / COD) Refund Success >= 99% | Draft |
| FR-06 | Real-Time Fraud Risk Scoring (Green vs Red Channel) | BR-06 | US-07 | UAT-09, UAT-10 | Return Fraud Rate < 1.8% | Draft |
| FR-07 | ATS Rabbit App 4-Point Doorstep QC Checklist | BR-08 | US-08 | UAT-09, UAT-11 | Doorstep QC Dispute < 2% | Draft |
| FR-08 | Instant Refund Payout Trigger (<15m Post-Pickup) | BR-06, BR-08 | US-09 | UAT-09 | Avg Refund TAT < 6 Hours | Draft |
| FR-09 | Pro-Rata Conditional Coupon & Bundle Recalculation | BR-05, BR-05A | US-06 | UAT-07, UAT-08 | Zero Promo Abuse Leakage | Draft |
| FR-10 | Automated Returnless Refund for <₹299 Defective ASINs | BR-09 | US-10 | UAT-12 | Reverse Logistics Savings ₹ | Draft |

---

## Planned UAT Scenarios (`uat_test_scenarios.csv`)

| uat_scenario_id | linked_req_and_rule | linked_user_story | scenario_category | test_case_description | pre_conditions_and_test_data_inr | test_execution_steps | expected_business_outcome | actual_uat_result | status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| UAT-01 | FR-01 / BR-02 | US-01 | Positive - Standard Window | Verify Apparel return within 14-day window is approved | ASIN: Men's Cotton Jacket (₹2,499) \| Delivered: 6 days ago \| Category: Apparel | 1. Open 'Your Orders' (Amazon.in) \| 2. Click 'Return/Exchange' on Jacket \| 3. Verify window status. | System displays '8 Days Left to Return/Exchange' and unlocks workflow. | Not executed — planned test scenario only; no live environment available. | Not Run |
| UAT-02 | FR-01 / BR-02 | US-01 | Negative - Window Expired | Verify Electronics return on Day 9 (>7-day window) is blocked | ASIN: Wireless Earbuds (₹1,999) \| Delivered: 9 days ago \| Category: Electronics (7d Window) | 1. Open 'Your Orders' (Amazon.in) \| 2. Attempt to click Return on Earbuds. | Return button disabled; displays '7-Day Return Window Closed on [Date]' + Brand Warranty link. | Not executed — planned test scenario only; no live environment available. | Not Run |
| UAT-03 | FR-01 / BR-01 | US-01 | Negative - Non-Returnable ASIN | Verify Innerwear/Cosmetics return for 'Changed Mind' is rejected | ASIN: Matte Lipstick (₹599) \| Category: Cosmetics (Non-Returnable) \| Reason: 'Did not like color' | 1. Select Lipstick \| 2. Attempt return with reason 'Changed Mind / Color'. | System blocks request per BR-01 Hygiene/Cosmetics policy. | Not executed — planned test scenario only; no live environment available. | Not Run |
| UAT-04 | FR-02 / BR-01A | US-02 | Exception - Damaged Non-Returnable | Verify Damaged Cosmetics claim within 48h with 2 photos is allowed | ASIN: Matte Lipstick (₹599) \| Delivered: 18 hours ago \| Reason: 'Damaged / Broken Seal' | 1. Select 'Damaged in Transit' \| 2. Upload 2 live camera photos of broken seal & label \| 3. Submit. | BR-01A overrides restriction; claim routed for priority verification. | Not executed — planned test scenario only; no live environment available. | Not Run |
| UAT-05 | FR-03 / BR-04 | US-03 | Positive - Exchange Nudge | Verify 1-Click Free Size Exchange locks inventory and issues ₹0 replacement | ASIN: Running Shoes Size UK-8 (₹3,200) \| Reason: 'Size Too Small' \| Replacement: UK-9 (In Stock) | 1. Select 'Size Too Small' \| 2. Click 'Free Exchange for UK-9' \| 3. Confirm. | 1 unit of UK-9 locked in Amazon FC Inventory for 48h; Exchange Order created at ₹0 + ₹100 bonus coupon. | Not executed — planned test scenario only; no live environment available. | Not Run |
| UAT-06 | FR-05 / BR-07 | US-05 | Positive - Pay on Delivery (PoD / COD) to UPI Penny-Drop | Verify Pay on Delivery (PoD / COD) order refund via verified UPI VPA penny-drop | Order: Pay on Delivery (PoD / COD) (₹1,450 paid in cash) \| Customer VPA: 'test.customer@upi' \| Account Name: 'Test Customer' | 1. Select Pay on Delivery (PoD / COD) Return \| 2. Enter UPI ID 'test.customer@upi' \| 3. Verify ₹1 Penny-Drop. | Gateway deposits ₹1, confirms 100% name match, and binds VPA for instant refund. | Not executed — planned test scenario only; no live environment available. | Not Run |
| UAT-07 | FR-09 / BR-05 | US-06 | Exception - Promo Pro-Rata Math | Verify partial bundle return revokes unmerited conditional coupon | Cart: Shirt (₹1,200) + Jeans (₹1,300) = ₹2,500 \| Coupon: SAVE500 (Min ₹2,000) -> Paid ₹2,000 \| Action: Return Shirt ('Changed Mind') | 1. Select Shirt for Refund ('Changed Mind') \| 2. View Refund Calculation Modal. | Modal shows: Item ₹1,200 - ₹500 Revoked Promo = ₹700 Net Refund (or ₹0 loss if Exchanged). | Not executed — planned test scenario only; no live environment available. | Not Run |
| UAT-08 | FR-09 / BR-05A | US-06 | Exception - Damaged Bundle Item | Verify partial bundle return for Damaged item does NOT penalize promo | Same Cart (Paid ₹2,000) \| Action: Return Shirt ('Damaged Item' verified at QC) | 1. Select Shirt for Refund ('Damaged Item') \| 2. Complete QC pass. | Rule BR-05A preserves prorated discount; Customer refunded full prorated ₹960. | Not executed — planned test scenario only; no live environment available. | Not Run |
| UAT-09 | FR-06, FR-08 / BR-06 | US-07, US-09 | Positive - Green Channel Instant Refund | Verify Low-Risk user (<=₹5,000) gets instant refund within 15m of Doorstep QC | Item: Ethnic Dress (₹2,800) \| User Return Rate: 12% (Green Channel) \| Courier: Marks 4-Point QC Pass | 1. ATS Associate scans FNSKU/LPN barcode & passes 4-point QC on Rabbit App \| 2. Check Refund Gateway log. | Webhook triggers Amazon Pay Payouts Engine payout within 15 mins; ₹2,800 credited with Bank RRN SMS. | Not executed — planned test scenario only; no live environment available. | Not Run |
| UAT-10 | FR-06, FR-13 / BR-06 | US-07 | Risk Control - Red Channel Hold | Verify High-Value item (>₹5,000) is held for Amazon FC C-Returns Inspection | Item: Smart Watch (₹8,999) \| Threshold: > ₹5,000 (Red Channel) | 1. ATS Associate picks up Smart Watch \| 2. Check refund status immediately after pickup. | Status shows 'Picked Up - In Transit to Hub for Final Inspection' (Refund held until FC C-Returns AFT scan). | Not executed — planned test scenario only; no live environment available. | Not Run |
| UAT-11 | FR-07, FR-11 / BR-08 | US-08, US-11 | Negative - Doorstep QC Failure | Verify ATS Associate rejects pickup on Rabbit App when Brand Price Tag is missing/cut | Item: Designer Kurta (₹1,899) \| Condition at Doorstep: Brand tag cut off | 1. ATS Associate marks Rabbit App Check #2 'Brand Tag Intact = NO' \| 2. Takes photo of missing tag \| 3. Submits. | App blocks pickup, leaves item with customer, and sends photo + Dispute link to customer app. | Not executed — planned test scenario only; no live environment available. | Not Run |
| UAT-12 | FR-10 / BR-09 | US-10 | Edge Case - Returnless Refund | Verify defective item < ₹299 triggers instant Returnless Refund (1st claim) | Item: Ceramic Mug (₹249) \| Reason: 'Arrived Cracked' (Photo uploaded) \| Reverse Shipping Cost: ₹145 | 1. Submit Damaged claim with photo on ₹249 Mug \| 2. Verify pickup vs. payout action. | Engine triggers Returnless Refund: ₹249 refunded instantly; message 'No pickup needed - please dispose/keep'. | Not executed — planned test scenario only; no live environment available. | Not Run |
