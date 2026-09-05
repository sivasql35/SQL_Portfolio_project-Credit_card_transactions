-- Basic data exploration
SELECT TOP 10 * FROM credit_card_transactions;

SELECT COUNT(*) AS total_transactions
FROM credit_card_transactions;

SELECT SUM(amount) AS total_spend
FROM credit_card_transactions;

SELECT DISTINCT card_type
FROM credit_card_transactions;

SELECT DISTINCT exp_type
FROM credit_card_transactions;

SELECT gender, COUNT(*) AS transaction_count, SUM(amount) AS total_spend
FROM credit_card_transactions
GROUP BY gender;

SELECT MIN(transaction_date) AS first_transaction,
       MAX(transaction_date) AS last_transaction
FROM credit_card_transactions;
