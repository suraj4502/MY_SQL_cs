use classicmodels;


#sorting by state
select customerNumber,customerName,country,state FROM customers
WHERE country IN ('usa')
ORDER BY state;

#descending order
select customerNumber,customerName,country,state FROM customers
WHERE country IN ('usa')
ORDER BY state DESC;

SELECT customerNumber , Creditlimit from customers ORDER BY creditLimit DESC;