create database suraj;
use suraj;
CREATE table Employee(
emp_id INT ,
emp_name varchar(50),
age int
);

select * from Employee;

insert into Employee
values(1,'suraj',19);

insert into Employee(emp_name,age,emp_id)
values('zayn',28,2);

insert into Employee
values(3,'zeus',100000),(4,'appolo',100000),(5,'Krishna',10000);


#addig only for some specific data
insert into EMployee(emp_id,emp_name)
values(6,'HADES');


select * from Employee;


drop table Employee;