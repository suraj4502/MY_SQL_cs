## Constraints
use suraj;

CREATE TABLE students (
    roll_no INT NOT NULL UNIQUE,
    # not null is used if we want the column not be empty
    # unique is used if we want unique values for the column,cannot add duplicates
    name VARCHAR(50),
    age INT
);

insert into students
values(1,'suraj',19);

insert into students(name)
values('anubis');  # This will not be executed because of the not null constraint

insert into students
values(1,'zeus',19); # This will also not be executed because of the unique column, only a unique value is accepted

insert into students
values(2,'zeus',20); # This will work because you we have no not null values in roll no and also it is unique as per the constraints


select * from students;



CREATE TABLE new_employee (
    emp_id INT PRIMARY KEY,
    # primary key constraints applies that the colulmn should not be null as well as the  value should be unique
    # we can say as combination of not null and unique.
    name VARCHAR(50),
    company VARCHAR(55)
);


insert into new_employee
values(1,'suraj','Google'),
	  (2,'zeus','infosys'),
      (3,'hera','wipro'),
      (4,'Hades','microsoft');
      
#FOREIGN KEY
#The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.
#A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
#The table with the foreign key is called the child table, and the table with the primary key is called the  referenced or parent table.
CREATE TABLE Department (
    dep_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    emp_id INT,
    FOREIGN KEY (emp_id)
        REFERENCES new_employee (emp_id)
        ON DELETE CASCADE ON UPDATE CASCADE  
) ;

#on DELETE cascade deletes any row from child table which is deleted from the parent table
#on UPDATE cascade updates any row from child table which is deleted from the parent table
INSERT INTO department
values (101,'IT',4),(102,'CS',1),(103,'HR',2);


# e.g of DELETE CASCADE
DELETE FROM new_employee WHERE emp_id = 4; 

#e.g of UPDATE CASCADE
UPDATE new_employee
SET emp_id =200
WHERE emp_id =2;



#CHECK constraint is used to apply some restrictions on a column.
#DEFAULT constraint is used to assign a default value if no VALUE is given for the column.
CREATE TABLE DL (
    name VARCHAR(55),
    age INT CHECK (age > 18),
    city VARCHAR(66) DEFAULT 'mumbai'
);

INSERT INTO DL 
VALUES('A',17,'pune'); #this will not be accepted

INSERT INTO DL 
VALUES('A',19,'pune'); 

INSERT INTO DL(name,age) 
VALUES('b',28);

# AUTO Increment = start with 1 and increases the value of a column by 1.;
DROP TABLE students;
CREATE TABLE students(
roll_no INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(55),
age INT);

INSERT INTO students(name,age)
VALUES('suraj',29),('s',19);



