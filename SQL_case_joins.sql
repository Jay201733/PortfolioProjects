/*
CASE STATEMENT: specify conditions, its more like if then else statements 
*/

SELECT firstname, lastname, age
FROM employeedemographics
WHERE age IS NOT NULL
ORDER BY age

-- building case statement
SELECT firstname, lastname, age,
CASE
	WHEN age> 30 THEN 'old'
	ELSE 'young'
END AS agetype
FROM employeedemographics
WHERE age IS NOT NULL
ORDER BY age

-- we can add as many case statements
-- in case of conflicting when statements the first statement gets the priority i.e. why 'baby' statement does not get executed
SELECT firstname, lastname, age,
CASE
	WHEN age> 30 THEN 'old'
	WHEN age BETWEEN 27 AND 30 THEN 'young'
	ELSE 'baby'
END AS agetype
FROM employeedemographics
WHERE age IS NOT NULL
ORDER BY age

-- JOIN STATEMENTS
SELECT firstname, lastname, jobtitle, salary
FROM employeedemographics
JOIN employeesalary
	ON employeesalary.employeeid = employeedemographics.employeeid

-- case statement with joining tables with common columns
SELECT firstname, lastname, jobtitle, salary,
CASE
    WHEN jobtitle = 'salesman' THEN salary + (salary*.10)
	WHEN jobtitle = 'accountant' THEN salary + (salary*.5)
	WHEN jobtitle = 'hr' THEN salary + (salary*.0001)
	ELSE salary + (salary* 0.3)
END AS updatedsalary
FROM employeedemographics
JOIN employeesalary
	ON employeesalary.employeeid = employeedemographics.employeeid