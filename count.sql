use classicmodels;

SELECT COUNT(*) AS total_rows FROM customers;

#couting null VALUES
SELECT COUNT(*) AS total_rows FROM customers WHERE state IS NULL;

#counting not null values.
SELECT COUNT(*) AS total_rows FROM customers WHERE state IS NOT NULL;

SELECT state FROM customers;
#getting unique VALUES
SELECT DISTINCT(state) FROM customers;

#counting the unique values 
SELECT count(DISTINCT(state))-1 AS Unique_state FROM customers;
