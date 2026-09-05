-- Q4. City with lowest percentage contribution of Gold card spending
WITH gold_city_spends AS
(
    SELECT city, SUM(amount) AS city_spend
    FROM credit_card_transactions
    WHERE card_type = 'Gold'
    GROUP BY city
),
gold_total AS
(
    SELECT SUM(city_spend) AS total_gold_spend
    FROM gold_city_spends
)
SELECT TOP 1
    g.city,
    g.city_spend,
    ROUND(g.city_spend * 100.0 / NULLIF(t.total_gold_spend, 0), 2) AS percentage_spend
FROM gold_city_spends g
CROSS JOIN gold_total t
ORDER BY percentage_spend ASC, g.city;
