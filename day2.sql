use practicedb; # access the db 

 #inserting technique 1
insert into students values (4,"Hades","How to kill people",98);

#inserting technique 2
insert into students (std_id,name , marks) values (5,"Zeus", 99); 

#inserting technique 3
insert into students values 
(6,"Achilles","how to be the best warrior of all time",100),
(7,"eros","how to shoot arrows of love",98),
(8,"Dick","how to date an alien",100);

###Working with null values and is keyword
select "Hello world" as greeting;
select 2=3;
select 2=2;
select 2= null as output;
select 2 is null as ouotput;
SELECT 2 is not null as output; 
# if output = o means false and 1 means true.
# while working with null values 'is' should be used.


##Update
set sql_safe_updates=0; #to disable the safe mode
update students set marks = 80 where marks is null;
UPDATE students set name = "Dick Grayson" where std_id = 8;
update students set course = "how to have extra maritial affairs" where std_id =5;

## delete 
delete from students where course is null; #delete the data points where couse is null
delete from students where marks <80; #delete all the data points where marks is less than 80.


select * from myemp limit 10;
select emp_id,first_name,last_name,salary from myemp limit 10;
##Derived columns
SELECT emp_id, first_name, last_name, salary , salary* 0.2 as bonus from myemp limit 5;

SELECT emp_id,first_name, last_name, salary,salary + salary*0.2 as total_salary from myemp limit 8; 

###USing distinct keyword to get unique values  same as df.unique() in python
## Order by is same as sort in python.
SELECT DISTINCT
    job_id
FROM
    myemp;
SELECT DISTINCT
    mgr_id
FROM
    myemp;
    
SELECT DISTINCT
    dep_id
FROM
    myemp
ORDER BY dep_id;

SELECT DISTINCT
    dep_id
FROM
    myemp
ORDER BY dep_id DESC; # to show values in descending order.


#### ADDDING Conditons;
SELECT * from myemp where salary >1000;
SELECT * from myemp where salary between 1000 and 15000;
select * from myemp where dep_id= 80;
select * from myemp where dep_id!=80;
SELECT * from myemp where DEP_ID = 80 or dep_id = 100 or dep_id = 120;
SELECT * from myemp where DEP_ID in (80,100,120) order by salary desc;
SELECT * from myemp where DEP_ID NOT in (80,100,120);


#### Pattern matching using like
select * from myemp where FIRST_NAME like "a%"; #start from a 
select * from myemp where FIRST_NAME like "%s"; #ends with s
select * from myemp where FIRST_NAME like "%c%";#contains c
select * from myemp where FIRST_NAME like "a_____"; #starts with a and has 6 letters


#DATES 
select adddate('2020-06-10',9);
SELECT year(dob) from patients;
SELECT month(dob) from patients;

select * from patients;
insert into patients values(5,"xyz","2022-5-01",now()) ;

##Concat
SELECT first_name, last_name , concat(first_name," ", last_name) as fullname from myemp limit 10;


### GROUP OR aggregate functions
select count(*) as output from myemp ;
SELECT min(salary), max(salary), avg(salary), sum(salary) from myemp;