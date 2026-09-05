-- Q1. Top 5 cities with highest spends and percentage contribution
WITH citywise_sales AS
(
    SELECT TOP 5
        city,
        SUM(amount) AS city_wise_amount
    FROM credit_card_transactions
    GROUP BY city
    ORDER BY SUM(amount) DESC
),
total_spent AS
(
    SELECT SUM(amount) AS total_amount
    FROM credit_card_transactions
)
SELECT
    c.city,
    c.city_wise_amount,
    ROUND(c.city_wise_amount * 100.0 / NULLIF(t.total_amount, 0), 2) AS percentage_contribution
FROM citywise_sales c
CROSS JOIN total_spent t
ORDER BY c.city_wise_amount DESC;
