use suraj;

/* Cross join gives the ouptut for each row of both the columns like if we 
3 rows in one table and 4 rows in another table the the cross join will 
give 12 rows. */


CREATE TABLE laptop (
    name VARCHAR(55)
);

CREATE TABLE Colour (
    colour_name VARCHAR(66)
);

insert into laptop
values('Dell'),('acer'),('hp');

INSERT INTO Colour
VALUES('red'),('black'),('grey'); 

SELECT * FROM laptop cross join colour;

SELECT * FROM colour cross join laptop;