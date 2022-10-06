use assignment;

call order_status(2005,05);

CREATE TABLE cancellations (
    id INT PRIMARY KEY,
    customernumber INT,
    ordernumber INT,
    comments VARCHAR(8),
    CONSTRAINT fk_c FOREIGN KEY (customernumber)
        REFERENCES customers (customernumber),
    CONSTRAINT fk_o FOREIGN KEY (ordernumber)
        REFERENCES orders (ordernumber)
);

desc cancellations;

ALTER TABLE cancellations
MODIFY COLUMN comments VARCHAR(255);

ALTER TABLE cancellations
MODIFY COLUMN id SERIAL;

call insert_cancelled_orders();

select * FROM cancellations;

call show_purchase_status(114);

call show_purchase_status_01;

-- the first name of the employee who gets the third highest salary.
SELECT 
    *
FROM
    employee
ORDER BY salary DESC
LIMIT 2 , 1;


-- Assigning Ranks.
select * ,ROW_NUMBER() OVER(ORDER BY salary desc) ranks from employee ;


-- --------------------------------------------------------------------------------------------------------------------------------------------








