use adventureworks;
CREATE TABLE salespeople (
    snum INT PRIMARY KEY,
    sname VARCHAR(80),
    city VARCHAR(80),
    comm FLOAT
);

INSERT into salespeople values
(1001,'peel','london',0.12),
(1002,'Serres','San Jose',0.13),
(1003,'Axelrod','New York',0.10),
(1004,'Motika','london',0.11),
(1007,'Rafkin','Barcelona',0.15);

CREATE TABLE cust (
    cnum INT PRIMARY KEY,
    cname VARCHAR(100),
    city VARCHAR(100),
    rating INT,
    snum INT
);

insert into cust values
(2001,'hoffman','london',100,1001),
(2002,'Giovanne','rome',200,1003),
(2003,'Liu','san jose',300,1002),
(2004,'Grass','Berlin',100,1002),
(2006,'clemens','London',300,1007),
(2007,'pereira','rome',100,1004),
(2008,'James','london',200,1007);

CREATE TABLE orders (
    onum INT PRIMARY KEY,
    amt FLOAT,
    odate DATE,
    cnum INT,
    snum INT,
    CONSTRAINT sp FOREIGN KEY (snum)
        REFERENCES salespeople (snum),
    CONSTRAINT cs FOREIGN KEY (cnum)
        REFERENCES cust (cnum)
);

INSERT into orders values
(3001,18.69,'1994-10-03',2008,1007),
(3002,1900.10,'1994-10-03',2007,1004),
(3003,767.19,'1994-10-03',2001,1001),
(3005,5160.45,'199-10-03',2003,1002),
(3006,1098.16,'1994-10-04',2008,1007),
(3007,75.75,'1994-10-05',2004,1002),
(3008,4723.00,'1994-10-05',2006,1001),
(3009,1713.23,'1994-10-04',2002,1003),
(3010,1309.95,'1994-10-06',2004,1002),
(3011,9891.88,'1994-10-06',2006,1001);



# Write a query to match the salespeople to the
# customers according to the city they are living.
SELECT 
    s.sname, c.cname, c.city
FROM
    salespeople s,
    cust c
WHERE
    s.city = c.city;
    
    
    
# Write a query to select the names of customers and the salespersons 
-- who are providing service to them.

SELECT 
    cname AS Customer_Name,
    (SELECT 
            sname
        FROM
            salespeople
        WHERE
            snum = cust.snum) AS Salesperson_Name
FROM
    cust;
    

# Write a query to find out all orders by customers not located 
-- in the same cities as that of their salespeople.

select onum,
(select city from cust where cnum = orders.cnum) AS cust_city,
(select city from salespeople where snum = orders.snum) as sales_city 
	from orders
where
	(select city from cust where cnum = orders.cnum) <> 
    (select city from salespeople where snum = orders.snum);
    

# Write a query that lists each order number followed by name of customer who made that order,

SELECT 
    onum AS Order_Number,
    (SELECT cname FROM cust
        WHERE
            cnum = orders.cnum) AS Customer_name
FROM
    orders
ORDER BY onum;


# Write a query that finds all pairs of customers having the same rating.

SELECT 
    a.cname, b.cname, a.rating
FROM
    cust a,
    cust b
WHERE
    a.rating = b.rating AND a.cnum != b.cnum;



# Write a query to find out all pairs of customers served by a single salesperson

SELECT 
    a.cname, b.cname, a.snum
FROM
    cust a,
    cust b
WHERE
    a.snum = b.snum AND a.cnum != b.cnum AND a.cnum < b.cnum;

# a query that produces all pairs of salespeople who are living in same city.

SELECT 
    a.sname, b.sname, a.city
FROM
    salespeople a,
    salespeople b
WHERE
    a.city = b.city AND a.snum <> b.snum
        AND a.snum < b.snum;
        
        
# Write a Query to find all orders credited to the same salesperson who services Customer 2008.

SELECT 
    *
FROM
    orders
WHERE
    snum = (SELECT snum FROM cust WHERE cnum = 2008);
    
    
# Write a Query to find out all orders that are greater than the average for Oct 4th.

SELECT 
    *
FROM
    orders
WHERE
    amt > (SELECT AVG(amt) FROM orders WHERE odate = '1994-10-04');
    

# Write a Query to find all orders attributed to salespeople in London.

SELECT 
    *
FROM
    orders
WHERE snum in (select snum from salespeople where city = 'LONDON');


# Write a query to find all the customers whose cnum is 1000 above the snum of Serres. 
    
SELECT 
    cnum, cname as customers_whose_cnum_is_1000_above_snum_of_Serres
FROM
    cust
WHERE
    cnum > (SELECT snum + 1000 FROM salespeople WHERE sname = 'serres');
    
    
# Write a query to count customers with ratings above San Jose’s average rating.

select count(cnum) as number_of_customers from cust where rating > (select AVG(rating) from cust where city ='san Jose');
    
# Write a query to show each salesperson with multiple customers. 

SELECT 
    *
FROM
    salespeople
WHERE
    snum IN (SELECT DISTINCT snum FROM cust a WHERE EXISTS
				( SELECT * FROM cust b WHERE b.snum = a.snum AND b.cname <> a.cname));
                
                
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------







