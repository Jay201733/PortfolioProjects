/* ALIASING */

SELECT firstname + '' + lastname AS FullName
FROM employeedemographics

-- ASSIGNING ALIASING TO THE ACTUAL TABLE - USEFUL WHEN USING ALOT OF JOINS
SELECT demo.age
FROM employeedemographics AS demo

/*we can combine different conditions like earlier, the only thing that changes is the reference to the actual table/ column through
aliased word */

SELECT demo.employeeID, sal.salary
FROM employeedemographics AS demo
JOIN employeesalary AS sal
	ON demo.employeeID = sal.employeeID

-- I can do the same thing like the above statement by just adding the alias after the table/ column without using 'AS'

SELECT demo.employeeID, sal.salary
FROM employeedemographics demo
JOIN employeesalary sal
	ON demo.employeeID = sal.employeeID