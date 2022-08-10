# TCL = Transcation control language

use practicedb;
# to disable the autocommit option
set autocommit=0; 
SELECT * from students;
insert into students values(9,'Aphrodite','Mysql',100);
SELECT * from students;

ROLLBACK;
SELECT * from students; # the record is gone
insert into students values(9,'Aphrodite','Mysql',100);
SELECT * from students;

commit;

# to enable the autocommit option
set autocommit =1;

### Another way to write a transcation is to use START Transcation


create TABLE mytab(name varchar(30));

start TRANSACTION;

insert into mytab values('a'),('b');
SAVEPOINT s1;

insert into mytab values('c'),('d');
savepoint s2;

INSERT into mytab values('e'),('f');
savepoint s3;

select * from mytab;

ROLLBACK to s3;

select * from mytab;

ROLLBACK to s2;

select * from mytab;

commit;



### VIEWS
# Joined two tables and created a view of it so in future we can quickly access the output .ALTER

CREATE VIEW movieview AS
    SELECT 
        mv.id,
        mv.title,
	IFNULL(mm.first_name, '-') AS Fname,
        IFNULL(mm.last_name, '-') AS Lname
    FROM
        movies AS mv
            LEFT JOIN
        members AS mm ON mv.id = mm.movieid;
        
select * from movieview;


select * from authors;
update authors set authorid = 73 where authorid = 80;

select * from authors;

### CREATEing a view;
create view sview as select * from authors WHERE authorid < 50;

SELECT * from sview;

insert into sview values (55 ,'Madelline Miller');
SELECT * from sview;
SELECT * from authors;
## Adding a check constraint to throw an error if the values are more than 50.
create VIEW s2view as select * from authors WHERE authorid < 50 with check option;
insert into s2view values (60 ,'suraj');


## CREATEING sequences
CREATE TABLE stnew (
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(50),
    age INT,
    course VARCHAR(50)
);
 insert into stnew (sname,age,course) values('suraj',20,'mYSQL'),
 ('niraj',15,'MYSQL'),
 ('sky',22,'PYTHON');
 select * from stnew;
 
alter TABLE stnew auto_increment=100;



### CREATING INDEXES
create index myindex  on myemp(emp_id);
show indexes from myemp;

 
 



