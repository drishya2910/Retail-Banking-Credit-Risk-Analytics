# Retail-Banking-Credit-Risk-Analytics
End-to-End Retail Banking and Credit Risk Analytics using Excel, SQL, Power BI, and Python.

## Project Overview:
This project presents an end-to-end Retail Banking & Credit Risk Analytics solution designed to analyze customer, loan, and credit risk data using Excel, SQL, and Power BI. The objective is to transform raw banking data into actionable business insights through data cleaning, exploratory analysis, KPI reporting, and interactive dashboards.

The project demonstrates how data analytics can support business decision-making by identifying customer trends, portfolio performance, credit risk indicators, and operational opportunities within a retail banking environment.

## Business Problem:
Retail banks manage large volumes of customer, loan, and credit data every day. Without effective analytics, identifying high-risk borrowers, monitoring loan portfolio performance, and understanding customer behavior becomes challenging. Delayed identification of credit risk can lead to increased defaults, financial losses, and inefficient decision-making.

This project addresses these challenges by analyzing retail banking data to evaluate customer profiles, loan performance, repayment behavior, and key credit risk indicators. Using Excel, SQL, and Power BI, the project transforms raw transactional and customer data into interactive dashboards and business insights that support data-driven lending decisions and portfolio monitoring.

## Project Objectives:
- Analyze retail banking customer and loan data to identify key credit risk patterns.
- Evaluate customer demographics, financial profiles, and repayment behavior.
- Measure portfolio performance using business and risk-related KPIs.
- Identify trends, anomalies, and potential risk indicators through SQL-based analysis.
- Build interactive Power BI dashboards to support business reporting and decision-making.
- Provide actionable recommendations to improve portfolio monitoring and risk management.

## Dataset Overview:
The project uses a synthetic retail banking dataset designed to simulate real-world banking operations and credit risk scenarios for analytical purposes.
The dataset includes multiple related data domains, including:
- Customer profiles (300+ customer records)
- Account and loan information
- Credit scores and risk classifications
- Banking transactions and repayment activity
- Geographic and demographic attributes

The synthetic dataset was designed to reflect realistic retail banking relationships, enabling end-to-end analysis of customer behavior, portfolio performance, credit risk, and business KPIs while maintaining complete privacy and avoiding the use of real customer data.

## Tools & Technologies:
| Category | Technologies |
|----------|--------------|
| Query Language | SQL |
| Database | MySQL |
| Business Intelligence | Power BI |
| Spreadsheet Analysis | Microsoft Excel |
| Data Modeling | Relational Database Design |
| Data Visualization | Power BI Dashboards |
| Documentation | Markdown (GitHub) |

## Project Workflow:
1. **Data Collection**
   - Generated a realistic synthetic retail banking dataset representing customers, accounts, loans, and transaction activity.
2. **Data Preparation**
   - Validated and cleaned the dataset using Excel and SQL to ensure consistency, accuracy, and completeness.
3. **SQL Analysis**
   - Performed exploratory analysis using SQL queries to identify customer trends, loan performance, transaction behavior, and credit risk indicators.
4. **Dashboard Development**
   - Built interactive Power BI dashboards to visualize KPIs, portfolio performance, customer segmentation, and risk metrics.
5. **Business Insights**
   - Identified trends, anomalies, and risk patterns to support data-driven business decisions.
6. **Recommendations**
   - Proposed actionable recommendations to improve portfolio monitoring, customer analysis, and credit risk management.

## Key Performance Indicators (KPIs)
<img width="2685" height="1671" alt="fig1_eda_dashboard" src="https://github.com/user-attachments/assets/6060a3b4-1190-42bb-a758-51f92d4fdff7" />
<img width="2338" height="1035" alt="fig2_city_risk" src="https://github.com/user-attachments/assets/3c951d11-8913-4006-8880-e88d74285362" />
<img width="2385" height="1036" alt="fig3_transactions" src="https://github.com/user-attachments/assets/0a676d3f-3cdd-4bca-bbd0-dcc6ff160079" />
<img width="2384" height="1033" alt="fig4_segmentation" src="https://github.com/user-attachments/assets/f1efc038-be94-4feb-946f-f8f4acf7ad58" />
<img width="2083" height="887" alt="fig5_model" src="https://github.com/user-attachments/assets/6343fb6e-18db-4177-af94-2e153b5d4d4c" />

## Key Insights
Core Dashboard Insights🚨:

•	Credit Risk & Loan Health Portfolio Core: 68% of loans are current and healthy.

•	Risk Alert: 32% of the portfolio is under stress (19.3% delinquent, 12.7% charged-off).

•	Risk Profile: Most accounts centre around a moderate risk rating of 4.

💰 Customer Demographics & Products Credit Quality:

•	Average credit score sits at a fair tier of 664.Income Drivers.

•	Employed individuals drive the highest median income (₹130,930).

•	Core Product: Savings accounts are the most popular product (100 accounts).

📉 Account Balance Exposure:

•	Loss Exposure: Charged-off accounts hold a higher median balance than delinquent ones.

•	Risk Outliers: High-value balance outliers (near ₹200k) exist across all loan statuses.

🌆 City-wise Risk Insights
•	📍 High-Risk Hotspots:

•	Delhi & Kolkata: Highest default concentration, peaking at 10 accounts each with a risk rating of 4.

•	Ahmedabad: Significant high-risk cluster with 9 accounts sitting at a risk rating of 4.

•	Surat: Spreads risk heavily across ratings 2 through 5, holding 7 accounts in each tier.

Portfolio Drivers:

•	Surat & Delhi: Lead the entire portfolio in total active, healthy "Current" loans.

•	Kolkata & Ahmedabad: Show the highest volume of active "Delinquent" accounts.

•	Jaipur & Mumbai: Suffer from the highest volume of finalized "Charged-off" defaults.

🛡️ Low-Risk Hubs:
•	Bangalore: Safest overall profile with minimal defaults and zero accounts in the extreme risk zones.

•	Safe Extremes: No city shows severe systemic risk in the absolute highest bands (ratings 9 and 10).

💳 Transaction Dynamics Insights

📊 Top Spending Categories:

•	Revenue Driver: Late Fees are the single highest transaction category with 565 hits.

•	Essential Spending: Groceries (475) and Online Shopping (434) drive the most consumer-facing usage.

•	Low Volume: Medical (243) and Insurance (272) transactions occur the least frequently.

📉 Transaction Activity Trends:

•	Historical Equilibrium: Credit and debit trends closely mirrored each other from 2022 through late 2023.

•	Activity Crash: A severe, sharp drop-off in all transaction volumes occurred in mid-2024.

•	Current State: Total system activity remains flat lined at near-zero volumes through late 2024.

🤖 Customer Segmentation Insights:

🎯 Cluster Definitions:

•	Low Risk, High Value: Customers with high credit scores and exceptionally high scaled income.

•	Low Risk, Low Income: High credit scores but clustered around lower average scaled income levels.

•	Medium Risk, Mid Value: Moderate credit scores paired with solid, mid-tier scaled income.

•	High Risk, Low Value: Poor credit scores combined with the lowest overall income profile.

📈 Key Takeaways:

•	Income Disparity: The "Low Risk, High Value" cluster massively eclipses all other groups in average scaled income.

•	Clear Risk Boundaries: Higher credit scores explicitly correlate with lower risk ratings across the segments.

•	Target Demographics: The distinct separation between clusters validates that a 4-segment K-Means approach effectively groups banking risk profiles.

📉 Logistic Regression Insights:

🎯 Predictive Power:

•	Model Baseline: The model achieves an AUC of 0.662, showing moderate baseline predictive power for defaults.

•	Accuracy Breakdown: Highly accurate at predicting healthy loans (47 true positives) but struggles significantly with identifying actual defaults (only 5 true positives).

•	Missed Risks: High type-II error rate with 21 actual default cases incorrectly flagged as "Current".

🧬 Feature Drivers:

•	Dominant Feature: Credit_Score holds the highest absolute coefficient value (~1.4), making it the single most critical factor in predicting risk.

•	Secondary Drivers: Credit_Risk_Rating contributes moderately (~0.6), while demographic features like Age and Cleaned_Income have a very minor overall impact on the model.

## Business Recommendations:
- Strengthen monitoring of Delinquent and Charged-off accounts through early warning indicators and proactive intervention strategies.
- Prioritize high-risk customer segments for enhanced credit review and customized repayment plans.
- Leverage customer segmentation to deliver personalized financial products and targeted marketing campaigns.
- Expand regional portfolio monitoring to identify city-specific credit risk trends and optimize lending strategies.
- Monitor high-frequency transaction categories to detect unusual spending behavior and support fraud prevention initiatives.
- Continuously refine credit risk models by incorporating additional customer, behavioral, and financial variables to improve prediction accuracy.

## How to Use This Project:
1. Read the Project Overview and Business Problem to understand the business context.
2. Review the SQL scripts to explore data cleaning, transformation, and analytical queries.
3. Open the Power BI dashboard to interact with business KPIs and visualizations.
4. Review the visual analysis and business recommendations to understand the key findings.
