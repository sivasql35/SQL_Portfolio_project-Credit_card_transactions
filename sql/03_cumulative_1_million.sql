-- Q3. First transaction where each card type reaches cumulative 1,000,000 spend
WITH spends AS
(
    SELECT *,
        SUM(amount) OVER
        (
            PARTITION BY card_type
            ORDER BY transaction_date, transaction_id
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumulative_spends
    FROM credit_card_transactions
),
ranked_transactions AS
(
    SELECT *,
        ROW_NUMBER() OVER(PARTITION BY card_type ORDER BY cumulative_spends, transaction_date, transaction_id) AS rn
    FROM spends
    WHERE cumulative_spends >= 1000000
)
SELECT *
FROM ranked_transactions
WHERE rn = 1
ORDER BY card_type;
