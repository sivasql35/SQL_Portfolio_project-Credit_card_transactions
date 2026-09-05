-- Q8. Weekend city with highest total spend to total transactions ratio
SET DATEFIRST 7;

SELECT TOP 1
    city,
    SUM(amount) AS total_weekend_spend,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount) * 1.0 / NULLIF(COUNT(*), 0), 2) AS spend_transaction_ratio
FROM credit_card_transactions
WHERE DATEPART(WEEKDAY, transaction_date) IN (1, 7)
GROUP BY city
ORDER BY spend_transaction_ratio DESC;
