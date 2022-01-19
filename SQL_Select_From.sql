-- SELECT FIRST NAME AND LAST NAME COLUMN FROM EMPLOYEEDEMOGRAPHICS TABLE
SELECT firstname, lastname
FROM employeedemographics

-- SELECT TOP 5 ROWS FROM EMPLOYEEDEMOGRAPHICS TABLE
SELECT TOP 5 *
FROM employeedemographics

-- SELECT DISTINCT GENDER VALUES FROM EMPLOYEEDEMOGRAPHICS TABLE
SELECT DISTINCT(gender)
FROM employeedemographics

-- SELECT ALL NULL VALUES IN A COLUMN
SELECT COUNT(lastname) AS lastnamecount
FROM employeedemographics

-- min, max, avg functions
SELECT AVG(salary)
FROM employeesalary


