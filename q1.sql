USE classicmodels;

# Q. Name the ordernumber for which the quantityordered is maximum.
SELECT 
    ordernumber, MAX(quantityOrdered) AS max_quantity
FROM
    orderdetails
GROUP BY ordernumber
ORDER BY max_quantity DESC;

# using subqueries
SELECT 
    ordernumber, quantityordered
FROM
    orderdetails
WHERE
    quantityoredered = (SELECT 
            MAX(quantityordered)
        FROM
            orderdetails);
            
            
            
# Q. query to get all the ordernumber where the qunatity oredered is more than the average 
#    qunatityordered.
SELECT 
    ordernumber, quantityordered
FROM
    orderdetails
WHERE
    quantityordered > (SELECT (AVG(quantityordered))
    FROM orderdetails);