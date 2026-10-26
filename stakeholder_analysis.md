# Stakeholder Analysis and RACI Governance

This is a proposed stakeholder model for a fictional e-commerce returns-redesign case study. The roles are illustrative; no real stakeholders have been interviewed or have approved the solution.

## Stakeholder groups
- Customer Experience / Product Sponsor — owns customer outcomes and prioritization.
- Finance — reviews refund accounting, promotion adjustments, and financial controls.
- Trust and Risk — reviews abuse indicators, fraud controls, and appeal safeguards.
- Reverse Logistics / Warehouse QC — validates pickup and inspection workflows.
- Customer Support — defines customer communications and escalation paths.
- Engineering / Payments — assesses feasibility, integrations, reliability, and security.
- QA / UAT — prepares test coverage and records execution outcomes.
- Customers and sellers — provide requirements through research and feedback in a real project.

## Proposed conflict-resolution approach
Where faster refunds conflict with fraud controls, define risk-based routing with transparent customer communication and an appeal path. Where promotion rules affect partial refunds, display the calculation before the customer submits the request. These are recommendations for stakeholder review, not decisions made by an actual steering group.

## RACI
Use the workbook as a draft. Confirm one accountable owner per deliverable and validate responsibilities with the actual organization before implementation.


---

## Full Stakeholder Register (`stakeholder_register.csv`)

| stakeholder_id | role_or_department | persona_type | influence_power | interest_level | mendelow_strategy | core_pain_points_as_is | primary_goal_requirement_to_be | conflicting_priority_and_resolution |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| SH-01 | Amazon.in Prime & Non-Prime Customers | External - End User | Medium | High | Keep Informed | 9.4-day refund wait; opaque rejection reasons; Pay on Delivery (PoD / COD) bank transfer failures. | Instant UPI/Wallet refund at pickup; 1-click free size exchange; live status tracker. | Wants zero-questions instant refund -> Balanced via Doorstep 4-Point QC for <= ₹5,000. |
| SH-02 | VP of Customer Experience & Retention | Internal - Sponsor | High | High | Manage Closely | NPS dragged down (+14) by refund delays; 42% of support volume is 'Where is my refund?'. | Cut WISMR tickets by 70%; convert 35%+ of size returns into automated exchanges. | Pushed for 100% instant refunds -> Agreed to Risk-Tiered Green/Red routing. |
| SH-03 | Chief Financial Officer (CFO) & Finance Recon | Internal - Governance | High | High | Manage Closely | ₹18.6 Cr annual reverse logistics & fraud loss; coupon abuse on partial bundle returns. | Enforce pro-rata coupon recalculation, automated GST credit notes, and fraud controls. | Wanted 100% warehouse inspection -> Accepted Green Channel for <₹5,000 with Fraud Score <60. |
| SH-04 | Amazon Transportation Services (ATS) & Reverse Logistics Head | Internal - Operations | Medium | High | Keep Informed | 31% failed pickups; couriers bring back used/wrong items that fail warehouse QC later. | Mandatory 4-point mobile doorstep QC checklist with barcode & tag photo verification. | Concerned about doorstep dwell time -> Designed 4-tap checklist taking <75 seconds. |
| SH-05 | Amazon Fulfillment Center (FC) & C-Returns (AFT) Lead | Internal - Operations | Low | High | Keep Informed | Backlog of unlabelled return parcels; manual grading delays restocking by 6 days. | Pre-tagged LPN / FNASIN return barcodes; Red-Channel high-value queue prioritized for 24h unboxing. | Synced courier QC photos directly into FC C-Returns workstation for side-by-side comparison. |
| SH-06 | Amazon Marketplace 3P Sellers (FBA / Easy Ship) & SAFE-T Governance | External - Partner | Medium | Medium | Keep Satisfied | Unfairly debited for customer-damaged returns and fake 'wrong item' claims. | Mandatory unboxing photo proof within 48h for damaged claims; Seller Central SAFE-T Claim portal. | Protected sellers via strict 48h photo timestamp rule and courier doorstep verification. |
| SH-07 | Amazon Pay & NPCI UPI Payouts Engineering Lead | Internal - Technical | High | Medium | Keep Satisfied | High IMPS/NEFT failures on Pay on Delivery (PoD / COD) returns due to wrong IFSC codes. | Real-time UPI VPA Penny-Drop verification API and automated webhook reconciliation. | Implemented instant fallback to Amazon Pay Balance if bank/UPI server is in downtime. |
| SH-08 | Trust, Safety & Fraud Analytics Team | Internal - Risk | High | High | Manage Closely | Serial returners ('wardrobing') and bricked electronics swaps costing ₹3.2 Cr/yr. | Real-time ML/Rule risk scoring, IMEI/Serial scan at doorstep, and Returnless Refund cap. | Enforced 1 Returnless Refund/year cap and Red-Channel lock for return rates >35%. |

---

## Full RACI Governance Matrix (`raci_governance_matrix.csv`)

| deliverable_or_workstream | lead_business_analyst | vp_of_cx_sponsor | cfo_finance | reverse_logistics_lead | engineering_it_lead | qa_uat_lead |
| --- | --- | --- | --- | --- | --- | --- |
| As-Is Journey Mapping & Return Reason Audit | R | A | I | C | I | I |
| Return Eligibility Decision Logic & Business Rules | R | A | C | C | C | C |
| Pro-Rata Coupon & Partial Bundle Refund Formula | R | C | A | I | C | C |
| Doorstep 4-Point QC Mobile Workflow Design | R | I | I | A | R | C |
| Pay on Delivery (PoD / COD)-to-UPI Penny-Drop & Instant Payout Integration | C | I | A | I | R | C |
| UAT Scenario Execution & Edge-Case Sign-Off | A | I | C | C | C | R |
