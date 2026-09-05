-- Q5. Highest and lowest expense type for each city
WITH city_expense_spends AS
(
    SELECT city, exp_type, SUM(amount) AS total_amount
    FROM credit_card_transactions
    GROUP BY city, exp_type
),
ranked_expenses AS
(
    SELECT *,
        DENSE_RANK() OVER(PARTITION BY city ORDER BY total_amount DESC) AS rn_high,
        DENSE_RANK() OVER(PARTITION BY city ORDER BY total_amount ASC) AS rn_low
    FROM city_expense_spends
)
SELECT
    city,
    MAX(CASE WHEN rn_high = 1 THEN exp_type END) AS highest_expense_type,
    MAX(CASE WHEN rn_low = 1 THEN exp_type END) AS lowest_expense_type
FROM ranked_expenses
GROUP BY city
ORDER BY city;
