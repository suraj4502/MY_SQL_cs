use classicmodels;

#WHERE
SELECT * from customers WHERE country='Usa';

#selecting only required columns and addiding another filtering condition.
SELECT customernumber,customerName,country,state FROM customers WHERE country='usa' AND state ='ny';

SELECT customernumber,customerName,country FROM customers WHERE country='usa' or country ='canada';

# <> means not equal to
SELECT customernumber,customerName,country FROM customers WHERE country<>'usa';

#applying multiple condtions(to include )
SELECT customernumber,customerName,country FROM customers
WHERE country IN('uk','russia','france','austria');

#applying multiple condtions(to exclude )
SELECT customernumber,customerName,country FROM customers
WHERE country NOT IN('uk','russia','france','austria');