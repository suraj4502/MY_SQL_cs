#ALTER TABLE
DROP TABLE students;
CREATE TABLE students (
    roll_no INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(55),
    age INT
);
DESCRIBE students;

ALTER TABLE students
ADD city VARCHAR(55),ADD state VARCHAR(66),ADD country VARCHAR(66);

DESCRIBE students;

ALTER TABLE students
ADD mobile_no INT		#columns can be added after or before any column as desires
AFTER age ;

ALTER TABLE students
MODIFY city VARCHAR(77); #can change the features of a column

ALTER TABLE students
DROP state ,DROP country; # can delete the columns

ALTER TABLE students
CHANGE COLUMN roll_no student_id INT; # can CHANGE the name of a column

INSERT INTO students
values(1,'s',19,444554455,'ryjvik');

INSERT INTO students
VALUES(2,'r',88,55515151,'mumbai'),(3,'a',7,98989898,'rus');

/* 
multi line comment
*/

ALTER TABLE students
RENAME TO students_table;