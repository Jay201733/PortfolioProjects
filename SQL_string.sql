   
/*
String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/

--Drop Table EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

SELECT*
FROM employeeerrors

-- trimming the gaps front/back from employeeID column
SELECT employeeID, TRIM(employeeID)
FROM employeeerrors 

-- removing white space only from left or right
SELECT employeeID, LTRIM(employeeID), RTRIM(employeeID)
FROM employeeerrors 

--USING REPLACE FUNCTION TO FIX THE ERRORS IN NAME ENTRY
SELECT LastName, REPLACE(LastName, '- Fired', '')
FROM EmployeeErrors

-- USING SUBSTRINGS
SELECT FirstName, SUBSTRING(Firstname,1,2), SUBSTRING(firstname, 3,5)
FROM EmployeeErrors

/* substring function is very useful in joining different tables where strings denoting the info about the same person do not match 100%,
such as two different columns with name ALEX and ALEXANDER can be joined by using first 4 alphabets only
*/
SELECT err.FirstName, SUBSTRING(err.FirstName, 1,3), dem.firstname, SUBSTRING(dem.firstname, 1, 3)
FROM EmployeeErrors err
JOIN employeedemographics dem
	ON SUBSTRING(err.FirstName, 1,3) = SUBSTRING(dem.FirstName, 1,3)