-- Q2. Highest spend month and amount for each card type
WITH all_spends AS
(
    SELECT
        card_type,
        DATEPART(YEAR, transaction_date) AS [year],
        DATEPART(MONTH, transaction_date) AS month_number,
        DATENAME(MONTH, transaction_date) AS [month],
        SUM(amount) AS spent
    FROM credit_card_transactions
    GROUP BY card_type,
             DATEPART(YEAR, transaction_date),
             DATEPART(MONTH, transaction_date),
             DATENAME(MONTH, transaction_date)
),
ranked_spends AS
(
    SELECT *,
        DENSE_RANK() OVER(PARTITION BY card_type ORDER BY spent DESC) AS rn
    FROM all_spends
)
SELECT card_type, [year], [month], spent
FROM ranked_spends
WHERE rn = 1
ORDER BY card_type;
