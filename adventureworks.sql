create DATABASE AdventureWorks;
show DATABASES;
use adventureWorks;


# Creating employee table .
create TABLE Employee (
empno int PRIMARY KEY,
ename varchar(100),
job varchar(100) DEFAULT 'Clerk',
mgr int,
hiredate date,
sal int ,
CHECK (sal>0),
comm FLOAT,
deptno int not null );

# Creating DEPT Table.
create Table Dept (
deptno int PRIMARY key,
dname varchar(100),
loc VARCHAR(100));

#ADDING FOREIGN KEY.
ALTER TABLE employee
     ADD CONSTRAINT fk_d
     FOREIGN KEY (deptno)
     REFERENCES Dept(deptno);
     
desc employee;
desc DEPt;

# Inserting values in tables.

Insert into DEPT values
(10,'operations','Boston'),
(20,'research','Dallas'),
(30,'Sales','Chicago'),
(40,"Accounting","New York");

INSERT into employee VALUES
(7369,'SMITH','CLERK',7902,'1890-12-17',800.00,NULL,20);

INSERT into employee VALUES
(7499,'Allen','Salesman',7698,'1981-02-20',1600.00,300.00,30),
(7521,'Ward','Salesman',7698,'1981-02-22',1250.00,500.00,30),
(7566,'Jones','Manager',7839,'1981-04-02',2975.00,NULL,20),
(7654,'Martin','Salesman',7698,'1981-09-28',1250.00,1400.00,30),
(7698,'Blake','Manager',7839,'1981-05-01',2850.00,NULL,30),
(7782,'Clark','Manager',7839,'1981-06-09',2450.00,NULL,10),
(7788,'Scoot','Analyst',7566,'1987-04-19',3000.00,NULL,20),
(7839,'King','President',Null,'1981-11-17',5000.00,NULL,10),
(7844,'Turner','Salesman',7698,'1981-09-08',1500.00,0.00,30),
(7876,'Adams','CLERK',7788,'1987-05-23',1100.00,NULL,20),
(7900,'James','CLERK',7698,'1981-12-03',950.00,NULL,30),
(7902,'Ford','Analyst',7566,'1981-12-03',3000.00,NULL,20),
(7934,'Miller','CLERK',7782,'1982-01-23',1300.00,NULL,10);

SELECT * from employee;

#List the Names and salary of the employee whose salary is greater than 1000.
SELECT 
    ename, sal
FROM
    employee
WHERE
    sal > 1000;

#List the details of the employees who have joined before end of September 81
SELECT 
    *
FROM
    employee
WHERE
    hiredate < '1981-09-01';
    
# List Employee Names having I as second character.
SELECT 
    *
FROM
    employee
WHERE
    ename LIKE '_i%';
    
#List Employee Name, Salary, Allowances (40% of Sal), P.F. (10 % of Sal) and Net Salary. 
# Also assign the alias name for the columns

SELECT 
    ename,
    sal,
    (0.4 * sal) AS Allowance,
    (0.1 * sal) AS PF,
    (sal + 0.4 * sal + 0.1 * sal) AS net_salary
FROM
    employee;
    
    
#List Employee Names with designations who does not report to anybody.
SELECT 
    ename AS Employee_Name
FROM
    employee
WHERE
    mgr IS NULL;
    
    
#List Empno, Ename and Salary in the ascending order of salary.
SELECT 
    empno, ename, sal
FROM
    employee
ORDER BY sal ASC;

# How many jobs are available in the Organization ?
# ==> for this we can calculate the unique categories in jobs.
 
SELECT 
    COUNT(DISTINCT (job)) AS Number_of_jobs_availabe
FROM
    employee;
    
    
# Determine total payable salary of salesman category.

SELECT 
    SUM(sal) AS total_payable_Salary_Salesman
FROM
    employee
WHERE
    job = 'salesman';


# List average monthly salary for each job within each department

SELECT 
    deptno, job, COUNT(*), AVG(sal)
FROM
    employee
GROUP BY deptno , job
ORDER BY deptno;  

# Use the Same EMP and DEPT table used in the Case study to Display 
# EMPNAME, SALARY and DEPTNAME in which the employee is working. 

SELECT 
    ename AS Employee_Name,
    sal AS Salary,
    dname AS Department_Name
FROM
    employee e
        INNER JOIN
    dept d ON e.deptno = d.deptno;
    
#Creating job greade Table
CREATE TABLE job_grades (
    Grade CHAR(5),
    lowest_sal INT,
    higest_sal INT
);

Insert into job_grades values
("A",0,999),
("B",1000,1999),
("C",2000,2999),
("D",3000,3999),
("E",4000,5000);

select * from job_grades;

# Display the last name, salary and  Corresponding Grade.

SELECT 
    E.ename, E.sal, J.Grade
FROM
    employee E
        JOIN
    job_grades J ON E.sal BETWEEN J.lowest_sal AND J.higest_sal;
    
    
# Display the Emp name and the Manager name under whom the 
# Employee works in the below format.

SELECT 
    ename AS Employee_Name,
    (SELECT 
            ename
        FROM
            employee
        WHERE
            empno = e.mgr) AS Manager
FROM
    employee e;
    
#Display Empname and Total sal where Total Sal (sal + Comm).
SELECT 
    ename AS Employee_Name,
    CASE
        WHEN comm <> 'null' THEN (e.sal + e.comm)
        ELSE e.sal
    END AS Total_Salary
FROM
    employee e;
 
 
 # Display Empname and Sal whose empno is a odd number.
SELECT 
    empno, ename AS Employee_Name, sal AS Salary
FROM
    employee
WHERE
    MOD(empno, 2) != 0;
    
# Display Empname , Rank of sal in Organisation , Rank of Sal in their department

select Ename, 
DENSE_RANK() over (order by sal desc) As overall_Rank,
DENSE_RANK() over (PARTITION BY deptno ORDER BY sal desc) as Department_rank,
sal,deptno
from employee
order by overall_rank;

# Display Top 3 Empnames based on their Salary

# Top 3
SELECT 
    ename AS emp_with_highest_salary
FROM
    employee
ORDER BY sal DESC
LIMIT 3;
    
# Bottom 3 
SELECT 
    ename AS emp_with_lowest_salary
FROM
    employee
ORDER BY sal
LIMIT 3;

# Display Empname who has highest Salary in Each Department.
SELECT 
    e.ename AS Employee_name,
    e.deptno AS Department,
    e.sal AS salary
FROM
    employee e
WHERE
    e.sal IN (SELECT 
            MAX(sal)
        FROM
            employee
        GROUP BY deptno)
ORDER BY deptno;


-- --------------------------------------------------------------------------------------------------------------------------------------------------------------



