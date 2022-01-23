/* Union, unionall */
-- joins combined tables based on a common column
-- Union select all the data from both tables in one table (works better when columns displayed share similar datatype)

SELECT employeeid, firstname, age
FROM employeedemographics

UNION -- union removes the duplicates whereas UNION ALL statement provides all the data including duplicates

SELECT employeeid, jobtitle, salary
FROM employeesalary
ORDER BY employeeID