/*
Inner joins (or JOIN), full/left/right outer joins
*/

INSERT INTO employeedemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly','Flax', NULL, 'Male'),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

INSERT INTO employeesalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)

 fULL OUTER JOIN
SELECT *
FROM employeedemographics
FULL OUTER JOIN employeesalary
	ON employeedemographics.employeeID = employeesalary.employeeid


-- INNER JOIN
SELECT *
FROM employeedemographics
INNER JOIN employeesalary
	ON employeedemographics.employeeID = employeesalary.employeeid

-- LEFT OUTER JOIN
SELECT *
FROM employeedemographics
LEFT OUTER JOIN employeesalary
	ON employeedemographics.employeeID = employeesalary.employeeid

-- LEFT OUTER JOIN
SELECT *
FROM employeedemographics
RIGHT OUTER JOIN employeesalary
	ON employeedemographics.employeeID = employeesalary.employeeid

-- SELECTING SPECIFIC COLUMNS THROUGH JOINS
SELECT employeedemographics.employeeID, firstname, lastname, jobtitle, salary
FROM employeedemographics
INNER JOIN employeesalary
	ON employeedemographics.employeeID = employeesalary.employeeid

SELECT employeesalary.employeeID, firstname, lastname, jobtitle, salary
FROM employeedemographics
INNER JOIN employeesalary
	ON employeedemographics.employeeID = employeesalary.employeeid

-- SELECTING THE SAME SPECIFIC COLUMNS USING LEFT/ RIGHT OUTER JOINS BUT WITH EMPLOYEEIDS OF DIFFERENT TABLES
-- RIGHT OUTER JOINS WILL CHOOSE EVERYTHING FROM THE SALARY TABLE BUT BASED ON THE EMPLOYEE ID FROM DEMOGRAPHICS (WHICH HAS SOME NULL VALUES)
SELECT employeedemographics.employeeID, firstname, lastname, jobtitle, salary
FROM employeedemographics
RIGHT OUTER JOIN employeesalary
	ON employeedemographics.employeeID = employeesalary.employeeid

-- RIGHT OUTER JOINS WILL CHOOSE EVERYTHING FROM THE SALARY TABLE BUT BASED ON THE EMPLOYEE ID FROM SALARY (WHICH HAS DIFFERENT NULL VALUES)
SELECT employeesalary.employeeID, firstname, lastname, jobtitle, salary
FROM employeedemographics
RIGHT OUTER JOIN employeesalary
	ON employeedemographics.employeeID = employeesalary.employeeid

-- one can further add WHERE and similar other statements combined with JOINS