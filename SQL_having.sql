/* Having clause */
SELECT jobtitle, count(jobtitle) as total, AVG(salary)
FROM employeedemographics
JOIN employeesalary
	ON employeedemographics.employeeID = employeesalary.employeeid
GROUP BY jobtitle
HAVING AVG(salary) > 45000
ORDER BY AVG(salary)

-- we need to careful in chosing correct order of groupby, orderby statements
