SELECT * FROM customerTransactions;

--Retrieve the total number of transactions in the dataset.
SELECT COUNT(transaction_amount) AS number_of_transactions
FROM customerTransactions;

--Calculate the total transaction amount for all customers.
SELECT id, first_name, last_name, SUM(transaction_amount) as total_amount
FROM customerTransactions
GROUP BY id, first_name, last_name
ORDER BY id;

--Find the average transaction amount for each gender.
SELECT gender, ROUND(AVG(transaction_amount), 2) as avg_transaction_amount
FROM customerTransactions
GROUP BY gender;

--List the top 5 customers with the highest total transaction amounts.
SELECT TOP 5 id, first_name, last_name, SUM(transaction_amount) AS total_amount
FROM customerTransactions
GROUP BY id, first_name, last_name
ORDER BY total_amount DESC

--Find the number of transactions for each merchant name.
SELECT DISTINCT(merchant_name), COUNT(*) AS transaction_count
FROM customerTransactions
GROUP BY merchant_name
ORDER BY transaction_count DESC;

--Calculate the average transaction amount for each category.
SELECT category, AVG(transaction_amount) AS avg_amount
FROM customerTransactions
GROUP BY category
ORDER BY avg_amount DESC;

--Retrieve the most common transaction category.
SELECT TOP 1 category, COUNT(*) as transaction_count
FROM customerTransactions
GROUP BY category
ORDER BY transaction_count DESC;

--Find the oldest and youngest customers in the dataset.
SELECT 
	YEAR(GETDATE())  - MIN(YEAR(birth_date)) AS oldest_customer_birthdate, 
	YEAR(GETDATE())  - MAX(YEAR(birth_date)) AS youngest_customer_birthdate
FROM customerTransactions;

--List the 10 most frequent transaction dates.
SELECT TOP 10 date, COUNT(*) as transaction_count
FROM customerTransactions
GROUP BY date
ORDER BY transaction_count DESC;

--Calculate the total transaction amount for transactions made by female customers in a specific date range.
SELECT SUM(transaction_amount) as total_amount
FROM customerTransactions
WHERE gender = 'f' AND date >= '2000-01-01'

--Find the average transaction amount for each merchant name.
SELECT merchant_name, AVG(transaction_amount) as avg_amount
FROM customerTransactions
GROUP BY merchant_name
ORDER BY avg_amount DESC;

--Identify customers who made transactions at multiple merchants.
SELECT id, COUNT(DISTINCT merchant_name) AS merchant_count
FROM customerTransactions
GROUP BY id

--List all unique customer names and their birthdates, excluding duplicates.
SELECT DISTINCT first_name, last_name, birth_date
FROM customerTransactions
ORDER BY birth_date DESC

--Calculate the total transaction amount for each customer.
SELECT id, SUM(transaction_amount) AS total_amount
FROM customerTransactions
GROUP BY id
ORDER BY total_amount DESC;