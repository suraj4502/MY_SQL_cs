#to get all the countries which start with i.
SELECT 
    customername, country
FROM
    customers
WHERE
    country LIKE 'i%';


#to get all the countries which ends with a.
SELECT 
    customername, country
FROM
    customers
WHERE
    country LIKE '%a';
    

#to get all the countries which start WITH a and ends with a.
SELECT 
    customername, country
FROM
    customers
WHERE
    country LIKE 'A%a';
    
    
#to get all the countries which contains i
SELECT 
    customername, country
FROM
    customers
WHERE
    country LIKE '%i%';