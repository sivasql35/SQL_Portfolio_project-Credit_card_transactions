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


-- =====================================================
-- Q1. TOP 5 CITIES WITH HIGHEST SPENDS
-- AND PERCENTAGE CONTRIBUTION OF TOTAL SPENDS
-- =====================================================

WITH city_spends AS
(
    SELECT
        city,
        SUM(amount) AS city_spend
    FROM credit_card_transactions
    GROUP BY city
)
SELECT TOP 5
    city,
    city_spend,
    ROUND(
        city_spend * 100.0 /
        SUM(city_spend) OVER (),
        2
    ) AS percentage_contribution
FROM city_spends
ORDER BY city_spend DESC;



--behind the scenes
----------------------------
--1 write a query to print top 5 cities with highest spends and their percent-age contribution of total credit card spends 
SELECT TOP 5
	city, 
	SUM(amount) as top_spends,
	CONCAT(
		CONVERT( VARCHAR(10),
			ROUND( SUM(amount)*100 / (SELECT SUM(amount) FROM credit_card_transactions), 2)), '%') as contribution_percentage
FROM credit_card_transactions
GROUP BY city
ORDER BY top_spends DESC;



with citywise_sales as
(
    select top 5 city, SUM(amount) as city_wise_amount
    from credit_card_transactions
    group by city
    order by SUM(amount) desc
)
, total_spent as
(
    select SUM(amount) as total_amount 
    from credit_card_transactions
)
select citywise_sales.*,
    concat(convert(varchar(10), (city_wise_amount*100)/ total_amount), '%')
as percentage_contribution
from citywise_sales, total_spent;



WITH city_spends AS
(
    SELECT
        city,
        SUM(amount) AS city_spend
    FROM credit_card_transactions
    GROUP BY city
)
SELECT TOP 5
    city,
    city_spend,
    ROUND(
        city_spend * 100.0 /
        SUM(city_spend) OVER (),
        2
    ) AS percentage_contribution
FROM city_spends
ORDER BY city_spend DESC;


SET STATISTICS IO ON;
SET STATISTICS TIME ON;

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
