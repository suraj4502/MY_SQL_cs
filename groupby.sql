SELECT * FROM orderdetails;


SELECT 
    ordernumber, SUM(quantityOrdered) AS total_quantity
FROM
    orderdetails
GROUP BY orderNumber;




#ADDING a condition
SELECT 
    ordernumber, SUM(quantityOrdered) AS total_quantity
FROM
    orderdetails
GROUP BY orderNumber
HAVING total_quantity > 600;

SELECT 
    ordernumber, SUM(quantityOrdered) AS total_quantity
FROM
    orderdetails
GROUP BY orderNumber
HAVING total_quantity BETWEEN 500 AND 600;



SELECT 
    ordernumber, SUM(quantityOrdered) AS total_quantity
FROM
    orderdetails
GROUP BY orderNumber
ORDER BY total_quantity DESC
LIMIT 10;




#getting the max number of quantity for each oreder number.
SELECT 
    ordernumber, MAX(quantityordered) AS max_quantity
FROM
    orderdetails
GROUP BY quantityOrdered;




# getting top 10 maximum quantity ordered on the basis of ordernumber
SELECT 
    ordernumber, MAX(quantityordered) AS max_quantity
FROM
    orderdetails
GROUP BY ordernumber
ORDER BY max_quantity DESC
LIMIT 10;

SELECT 
    productcode, SUM(quantityOrdered) AS total_quantity
FROM
    orderdetails
GROUP BY productCode
ORDER BY total_quantity DESC
LIMIT 99 , 2;



#getting distict values for productcode
SELECT 
    COUNT(DISTINCT (productcode)) AS count_productcode
FROM
    orderdetails;