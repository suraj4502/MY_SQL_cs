use practicedb;
SELECT dep_id, avg(salary)  as average_salary from myemp GROUP BY dep_id order by dep_id;
SELECT dep_id, avg(salary)  as average_salary from myemp GROUP BY dep_id order by average_salary desc;

## Having clause
SELECT dep_id, avg(salary)  as average_salary from myemp GROUP BY dep_id having dep_id in(20,50,90);

## 2 level of groupbyb function
SELECT dep_id, mgr_id, avg(salary) as average_salary from myemp GROUP BY dep_id, mgr_id order by dep_id;

## JOINS
# ==>INNER JOIN
SELECT * from movies inner join members on movies.id = members.movieid;
#getting only select columns and for inner join no need to write inner.
select title, category,first_name, last_name from movies join members on movies.id = members.movieid; 

# ==> Left join
SELECT 
    *
FROM
    movies
        LEFT JOIN
    members ON movies.id = members.movieid;
    
## USing ifnull to replace the null values by a value of our  choice
SELECT 
    title,
    category,
    IFNULL(first_name, '-'),
    IFNULL(last_name, '-')
FROM
    movies
        LEFT JOIN
    members ON movies.id = members.movieid;


# ==> RIght join    
SELECT * from movies right join members on id=movieid;

# ==> Cross JOin
SELECT * from meals cross join drinks;
SELECT mealname, drinkname , meals.rate, drinks.rate from meals cross join drinks;
# giving alias to table name and adding the two rates to combine a total cost.
SELECT 
    m.mealname, d.drinkname, m.rate + d.rate AS Total
FROM
    meals AS m
        CROSS JOIN
    drinks AS d;
    
# ==> Self join
select emp.emp_id,emp.first_name, emp.last_name, mgr.first_name,mgr.last_name from myemp as emp inner JOIN myemp as mgr on emp.mgr_id = mgr.emp_id; 

## USING domain CONSTRAINTS ON STUDENTS TABLE 
ALTER table students modify std_id int unique;
ALTER table students modify name VARCHAR(90) not null;
ALter table students modify course VARCHAR(255) default 'MYSQL';
alter table students MODIFY marks int  check (marks > 50);

## inserting some values that violates the constraints
insert into students values(1,'xyx','mysql',20);



### Primary key and foreign key
drop table books;
drop table authors;

CREATE TABLE Authors(AuthorId INTEGER primary key, 
                                Name VARCHAR(70));
insert into Authors values(1,'J K Rowling');
insert into Authors values(2,'Thomas Hardy');
insert into Authors values(3,'Oscar Wilde');
insert into Authors values(4,'Sidney Sheldon');
insert into Authors values(5,'Alistair MacLean');
insert into Authors values(6,'Jane Austen');
insert into Authors values(7,'Chetan Bhagat');
insert into Authors values(8,'Oscar Wilde');


CREATE TABLE Books(
             BookId INTEGER primary key, 
             Title VARCHAR(50),
             AuthorId INTEGER, foreign key (authorid) references authors(authorid) on delete cascade on update CASCADE);
             
		
insert into Books values(1,'Harry Potter and the Philosopher\'s Stone',1);
insert into Books values(2,'Harry Potter and the Chamber of Secrets',1);
insert into Books values(3,'Harry Potter and the Half-Blood Prince',1);
insert into Books values(4,'Harry Potter and the Goblet of Fire',1);

insert into Books values(5,'Night Without End',5);
insert into Books values(6,'Fear is the Key',5);
insert into Books values(7,'Where Eagles Dare',5);

insert into Books values(8,'Sense and Sensibility',6);
insert into Books values(9,'Pride and Prejudice',6);
insert into Books values(10,'Emma',6);
insert into Books values(11,'Five Point Someone',7);
insert into Books values(12,'Two States',7);
insert into Books values(13,'Salome',8);
insert into Books values(14,'The Happy Prince',8);

delete from books where authorid =1;
select * from books;
update authors set authorid = 80 WHERE authorid =8;


