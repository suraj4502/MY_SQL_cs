##joins to get customernumber and the total quantity of product they oredered
use classicmodels;
SELECT 
    c.customernumber,
    c.customername,
    SUM(od.quantityordered) AS total_qty
FROM
    customers c
        INNER JOIN
    orders o ON c.customerNumber = o.customerNumber
        INNER JOIN
    orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber
ORDER BY total_qty DESC;




SELECT 
    c.customernumber,
    c.customername,
    od.productCode,
    p.productname,
    (od.quantityordered * od.priceeach) AS amount
FROM
    customers c
        INNER JOIN
    orders o ON c.customerNumber = o.customerNumber
        INNER JOIN
    orderdetails od ON o.orderNumber = od.orderNumber
        INNER JOIN
    products p ON od.productcode = p.productcode;