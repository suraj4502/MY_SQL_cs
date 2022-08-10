use practicedb;
set GLOBAL log_bin_trust_function_creators=1;

select emp_id, First_name , expereince(emp_id) from myemp;

alter table books add column sales INT default 0;
update books set sales = sales+3 where bookid= 5;
select * from books;

select * from myemp where salary = (select max(salary)from myemp);

select * from myemp where salary > (select avg(salary)from myemp);

SELECT * from employees where officeCode = 1 or officeCode =2 or officeCode =3;
SELECT * from employees where officeCode in (select officecode from offices where country ='usa');
 