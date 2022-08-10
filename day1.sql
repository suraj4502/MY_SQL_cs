SHOW DATABASES; #To show all the databases

CREATE DATABASE practicedb; #to create a database

USE practicedb; # to access the database

CREATE TABLE students( ID INT, Name CHAR(50), Age INT, Course CHAR(50)); # to creata a table

SHOW TABLES; # to shoe all the tables


## Inserting values into a table
INSERT INTO students VALUES(1,"Suraj",20,"Mysql");
INSERT INTO students VALUES(2,"ZAYN",29,"Mysql"),(3,"Niall",28,"IRISH");


## To show all the values in the table
SELECT * FROM students;

CREATE TABLE Patients (
    pid INT,
    pname VARCHAR(30),
    dob DATE,
    doa DATETIME
);

insert into Patients values(1,"suraj","2002-05-04","2022-05-20 12:12:58") ,
(2,"abc","2002-05-04","2022-05-20 12:12:58") ;

select * from Patients;
-------------------------------------------------------------------------------------------------


### ALTER
alter table students drop column age;
alter table students add column marks int;
alter table students CHANGE column ID std_id int;
alter table students MODIFY column Name varchar(255);
alter table students rename to myclass;


## REname
RENAME TABLE myclass to students;

##Drop
create table dummy(id int);
insert into dummy values (2);
show tables;
select * from dummy;
drop table dummy;
show tables;

