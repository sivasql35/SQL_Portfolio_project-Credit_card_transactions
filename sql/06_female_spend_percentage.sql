-- Q6. Percentage contribution of spends by females for each expense type
WITH spends AS
(
    SELECT
        exp_type,
        SUM(CASE WHEN gender = 'F' THEN amount ELSE 0 END) AS female_spends,
        SUM(amount) AS total_amount
    FROM credit_card_transactions
    GROUP BY exp_type
)
SELECT
    exp_type,
    female_spends,
    total_amount,
    ROUND(female_spends * 100.0 / NULLIF(total_amount, 0), 2) AS female_percentage_contribution
FROM spends
ORDER BY female_percentage_contribution DESC;
