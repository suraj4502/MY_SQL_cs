use practicedb;

# common table
SELECT 
    first_name, last_name, salary, bonus
FROM
    (SELECT 
        first_name, last_name, salary, salary * 0.2 AS bonus
    FROM
        myemp
    LIMIT 10) AS e;
    

with S as (select first_name, last_name, salary,salary * 0.2 as bonus from myemp limit 10) 
select first_name, last_name, salary, bonus from S;

### WINDOW FUNCTIONS:
# over
# partition by 
# order by

Select first_name, last_name, dep_id, salary, avg(salary) over (PARTITION BY dep_id) from myemp;

Select first_name, last_name, dep_id, salary, 
avg(salary) over (PARTITION BY dep_id), 
min(salary) over(PARTITION BY dep_id),
max(salary) over(PARTITION BY dep_id) as max_salary from myemp;

Select first_name, last_name, dep_id, salary, 
avg(salary) over (w) as avg_sal_dep, 
min(salary) over(w) as min_sal_dep,
max(salary) over(w) as max_sal_dep 
from myemp WINDOW w as(partition by dep_id) limit 10;

#mark(), dense_rank():

create table marks( marks int);
insert into marks values(50),(60),(60),(70),(90),(100);
select * from marks;
select marks, rank() over(ORDER BY marks desc) from marks;
select marks, DENSE_RANK() over(ORDER BY marks desc ) from marks;



# Rank each employee based on thier sales meaning in 2016 who did how much sales
select sales_employee, fiscal_year, sale, 
DENSE_RANK() over (PARTITION BY fiscal_year order by sale DESC) rank_ FROM sales;
	
select first_name, last_name, salary,NTH_VALUE(last_name,5) over(order by salary desc) from myemp LIMIT 10;

# get employee name eho joined the originaztion first 

select first_name, last_name ,hire_date,rank() over(order by hire_date ) from myemp limit 10;


select first_name, last_name ,hire_date,NTH_VALUE(last_name,1) over(order by hire_date ),
NTH_VALUE(last_name,2) over(order by hire_date ) from myemp limit 10;

select first_name, last_name ,hire_date,
first_value(last_name) over(w) as first_employee,
NTH_VALUE(last_name,2) over(w) as second_employee from myemp 
window w as (order by hire_date) limit 10;

create table trains(Train_id integer,   Station varchar(50),  Time time);


select train_id,station,time ,
lead(time,1) over (partition by train_id order by time) as next_station_time from trains;

