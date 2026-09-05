-- Q7. Card and expense type with highest month-over-month growth in January 2014
WITH monthly_spends AS
(
    SELECT
        card_type,
        exp_type,
        DATEPART(YEAR, transaction_date) AS [year],
        DATEPART(MONTH, transaction_date) AS [month],
        SUM(amount) AS total_spend
    FROM credit_card_transactions
    GROUP BY card_type, exp_type,
             DATEPART(YEAR, transaction_date),
             DATEPART(MONTH, transaction_date)
),
previous_month AS
(
    SELECT *,
        LAG(total_spend) OVER
        (
            PARTITION BY card_type, exp_type
            ORDER BY [year], [month]
        ) AS previous_month_spend
    FROM monthly_spends
)
SELECT TOP 1
    card_type,
    exp_type,
    [year],
    [month],
    previous_month_spend,
    total_spend,
    total_spend - previous_month_spend AS mom_growth
FROM previous_month
WHERE [year] = 2014
  AND [month] = 1
  AND previous_month_spend IS NOT NULL
ORDER BY mom_growth DESC;
