# 💳 Credit Card Transactions SQL Analysis

## Project Overview
A SQL portfolio project analyzing credit card transaction data to uncover city-level spending, card usage, expense patterns, cumulative milestones, month-over-month growth, and customer segment insights.

## Technologies
- SQL Server
- T-SQL
- SSMS
- Git & GitHub

## SQL Concepts Demonstrated
CTEs, aggregations, window functions, ROW_NUMBER, DENSE_RANK, LAG, running totals, conditional aggregation, date functions, percentage calculations, and ranking.

## Business Questions
1. Top 5 cities by spend and percentage contribution.
2. Highest spend month for each card type.
3. First transaction where each card type reaches cumulative 1,000,000 spend.
4. City with lowest percentage contribution for Gold card spending.
5. Highest and lowest expense type for each city.
6. Female spend percentage contribution for each expense type.
7. Card and expense type with highest month-over-month growth in January 2014.
8. City with highest weekend spend-to-transaction ratio.
9. City that reached its 500th transaction in the least number of days.

## Project Structure
```text
├── README.md
├── sql/
│   ├── 01_top_5_cities.sql
│   ├── 02_highest_spend_month.sql
│   ├── 03_cumulative_1_million.sql
│   ├── 04_lowest_gold_card_city.sql
│   ├── 05_highest_lowest_expense_type.sql
│   ├── 06_female_spend_percentage.sql
│   ├── 07_highest_mom_growth.sql
│   ├── 08_weekend_spend_ratio.sql
│   └── 09_fastest_500_transactions.sql
├── setup/
│   ├── 01_database_setup.sql
│   └── 02_data_exploration.sql
└── docs/
    └── business_questions.md
```

## Author
**Sivananda Nadimidoddi**

Aspiring Data Engineer | SQL | Python | Snowflake | Data Engineering
