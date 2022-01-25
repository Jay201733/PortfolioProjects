/* COMMON TABLE EXPRESSIONS CTEs 
CTE are the temporary tables created and we can extract data from such tables
*/

WITH cte_employee AS 
(
SELECT demo.firstname, demo.lastname, sal.salary, demo.gender,
COUNT(gender) OVER (PARTITION BY gender) AS GenderCount
FROM employeedemographics demo
JOIN employeesalary sal
	ON demo.employeeID = sal.employeeid
WHERE sal.salary > 45000
)

SELECT* -- we can choose different columns like an as usual query
FROM cte_employee

-- WE HAVE TO RUN THE WHOLE QUERY (INCLUDING CTE) 