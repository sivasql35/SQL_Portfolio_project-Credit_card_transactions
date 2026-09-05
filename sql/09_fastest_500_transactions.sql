-- Q9. City that took the least number of days to reach its 500th transaction
WITH ranked_transactions AS
(
    SELECT
        transaction_id,
        city,
        transaction_date,
        ROW_NUMBER() OVER
        (
            PARTITION BY city
            ORDER BY transaction_date, transaction_id
        ) AS rn
    FROM credit_card_transactions
),
city_500_transactions AS
(
    SELECT
        city,
        MIN(CASE WHEN rn = 1 THEN transaction_date END) AS first_transaction_date,
        MAX(CASE WHEN rn = 500 THEN transaction_date END) AS five_hundredth_transaction_date
    FROM ranked_transactions
    WHERE rn IN (1, 500)
    GROUP BY city
)
SELECT TOP 1
    city,
    first_transaction_date,
    five_hundredth_transaction_date,
    DATEDIFF(DAY, first_transaction_date, five_hundredth_transaction_date) AS days_to_reach_500_transactions
FROM city_500_transactions
WHERE five_hundredth_transaction_date IS NOT NULL
ORDER BY days_to_reach_500_transactions ASC, city;
