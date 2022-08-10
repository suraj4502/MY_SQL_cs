SELECT * FROM orderdetails;

SELECT MIN(quantityOrdered) as min_qty FROM orderdetails;

SELECT MAX(quantityOrdered) as max_qty FROM orderdetails;

SELECT SUM(quantityOrdered) as Total_qty FROM orderdetails;

SELECT AVG(quantityOrdered) as avg_qty FROM orderdetails;