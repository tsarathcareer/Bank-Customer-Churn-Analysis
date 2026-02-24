📊 Bank Customer Churn Analysis | SQL + Power BI

🔎 Project Overview

This project focuses on analyzing customer churn behavior in a retail banking dataset using MySQL for data analysis and Power BI for visualization and storytelling.

The goal was to move beyond basic churn rate calculation and perform business-driven segmentation, risk profiling, and revenue impact analysis to identify high-risk customer groups and actionable retention insights.

🎯 Objectives

Calculate overall churn rate and churn contribution
Identify high-risk customer segments
Analyze churn drivers across:
Demographics
Financial behavior
Engagement patterns
Product ownership
Estimate revenue (balance) impact due to churn
Build an interactive Power BI dashboard for executive-level insights

🗂 Dataset Features

| Column          | Description                            |
| --------------- | -------------------------------------- |
| CustomerId      | Unique customer identifier             |
| Geography       | Country of customer                    |
| Gender          | Customer gender                        |
| Age             | Customer age                           |
| Tenure          | Years with bank                        |
| CreditScore     | Creditworthiness score                 |
| Balance         | Account balance                        |
| NumOfProducts   | Number of products held                |
| HasCrCard       | Credit card ownership                  |
| IsActiveMember  | Engagement status                      |
| EstimatedSalary | Annual salary                          |
| Exited          | Churn flag (1 = churned, 0 = retained) |


🧠 SQL Analysis Performed

1️⃣ Descriptive Analysis
  - Overall churn rate
  - Churn by geography, gender, age group
  - Churn by tenure

2️⃣ Behavioral Analysis
  - Product holding vs churn
  - Active vs inactive churn comparison
  - Credit score segmentation
  - Balance band churn analysis

3️⃣ Revenue Impact Analysis
  - Total balance lost due to churn
  - High-value customer churn segments
  - Salary vs churn behavior

4️⃣ Advanced Segmentation
  - Multi-factor churn risk grouping
  - High-risk segment ranking
  - Rule-based churn risk scoring

📈 Power BI Dashboard
  - The dashboard includes:
  - KPI Cards
  - Churn by Geography
  - Churn by Age Group
  - Product Depth vs Churn
  - Engagement Impact Analysis
  - High-Risk Segment Matrix
  - Interactive slicers for dynamic analysis

The dashboard enables business users to identify:
   - Where churn is concentrated
   - Which customers are most valuable yet at risk
   - Which segments should be prioritized for retention campaigns

🛠 Tools & Technologies
   - MySQL 
   - Power BI
   - DAX (Custom churn metrics & segmentation)

📌 Key Insights
  - Inactive members show significantly higher churn rates.
  - Customers with only one product are more likely to churn.
  - Certain geographies exhibit disproportionately high churn.
  - High-balance churn segments represent substantial revenue risk.

🚀 Business Value
  - This analysis supports:
  - Targeted retention strategies
  - Risk-based customer segmentation
  - Revenue protection planning
  Executive decision-making dashboards
