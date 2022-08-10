# Date/Time
select ('2022-01-01 09:30:45') as result;
select DATE('2022-01-01 09:30:45') as result;
select TIME('2022-01-01 09:30:45') as result;

#Current time/date
SELECT CURRENT_DATE() AS result;
SELECT CURRENT_TIME() AS result;
SELECT CURRENT_TIMESTAMP() AS Result;
# //
SELECT NOW() AS result;

#Date ADD
SELECT DATE_ADD('2022-04-12', INTERVAL 5 YEAR) AS Result;
SELECT DATE_ADD('2022-04-12', INTERVAL -5 YEAR) AS Result;

SELECT DATE_ADD('2022-04-12 08:14:14', INTERVAL 5 YEAR_MONTH) AS Result;
SELECT DATE_ADD('2022-04-12 08:14:14', INTERVAL '-4:15' Hour_Minute) AS Result;
SELECT DATE_ADD('2022-04-12 08:14:14', INTERVAL 26 second) AS Result;
SELECT DATE_ADD('2022-04-12 08:14:14',INTERVAL 26 HOUR) AS Result;


SELECT datediff('2022-05-04','2022-04-30') as Result;
SELECT timestampdiff(DAY,'2018-04-30','2022-05-04') as Result;
SELECT timestampdiff(Month,'2018-04-30','2022-05-04') as Result;
SELECT timestampdiff(Year,'2018-04-30','2022-05-04') as Result;
SELECT timestampdiff(Hour,'2018-04-30','2022-05-04') as Result;
SELECT timestampdiff(MINUTE,'2018-04-30','2022-05-04') as Result;
SELECT timestampdiff(SECOND,'2018-04-30','2022-05-04') as Result;


#Date Format
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y') AS Result;
SELECT DATE_FORMAT(NOW(), '%D-%M-%Y') AS Result;
SELECT DATE_FORMAT(NOW(), '%d-%b-%Y') AS Result;

SELECT DATE_FORMAT(NOW(), '%d-%m-%Y %h:%I:%S %p') AS Result;
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y %H:%i:%S') AS Result;

SELECT WEEK(NOW()) AS Result;
SELECT dayname(NOW()) AS Result;