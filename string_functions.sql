# ASCII
SELECT ASCII('appple') AS result;

SELECT ASCII('Apple') AS result;

#CHAR_LENGTH
SELECT CHAR_LENGTH('MY_SQL') AS RESULT;

#concat
SELECT CONCAT('I am learning ', 'python.') AS concated_string;


#format
SELECT FORMAT(115151515.55515151518, 3) AS foramtted_number;

#insert
SELECT INSERT('google.com', 1, 0, 'www.') AS string_inserting;

#INSTR
SELECT INSTR('good AFTERNOON', 't');

#Locate
SELECT LOCATE('oon', 'good AFTERNOON') AS located_string;

#position
SELECT POSITION('oo' IN 'goodmorining') AS result;

#upper
SELECT UPPER('Suraj') AS uppercase;

#lower
SELECT LOWER('Suraj') AS uppercase;

#Left/Right
SELECT LEFT('united states of america', 13) AS result;
SELECT RIGHT('united states of america', 13) AS result;

SELECT LPAD('surajkumar', 13, 'mr.') AS ressult;
SELECT RPAD('surajkumar', 14, ' sir') AS ressult;

#LTRIM/RTRIM/TRIM
SELECT ('      abc     ') AS result;
SELECT RTRIM('      abc     ') AS result;
SELECT LTRIM('      abc     ') AS result;
SELECT TRIM('      abc     ') AS result;


#substring
SELECT SUBSTRING('surajkumar', 6) AS sub_string;
SELECT SUBSTRING('surajkumar', 1, 5) AS sub_string;
SELECT SUBSTRING('surajkumar', - 10, 5) AS string_;


#replace
SELECT REPLACE('surajkumar', 'kumar', ' yadav') AS replaced;
SELECT REPLACE('surajkumar','surajkumar','kumar yadav') AS replaced;

#Reverse 
SELECT REVERSE('python') AS Result;


#Substring_index (looks at delimeter)
SELECT SUBSTRING_INDEX('www.gmail.com', '.', 1) AS result;
SELECT SUBSTRING_INDEX('www.gmail.com', '.', -1) AS result;
SELECT SUBSTRING_INDEX('www.gmail.com', '.', 2) AS result;
SELECT SUBSTRING_INDEX('www.gmail.com', '.', -2) AS result;


SELECT SUBSTRING_INDEX(SUBSTRING_INDEX('Mahendra Singh Dhoni', ' ', - 2),' ',1) AS reasult;
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX('suraj KUmar Yadav', ' ', 2),' ',1) AS reasult;