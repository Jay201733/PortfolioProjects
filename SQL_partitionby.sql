/*Partition by
its more like the extended version of Groupby statement (which usually shows very limited information). With partition by statement, we get
more information. Its like group by statement but still including all the information relevant to the query
*/

-- The following statement shows how limited group by statement is
SELECT gender, COUNT(gender) AS GenderCount
FROM employeedemographics demo
JOIN employeesalary sal
	ON demo.employeeID = sal.employeeid
GROUP BY gender

--More details can be extracted using the partition by statement
SELECT demo.firstname, demo.lastname, sal.salary, demo.gender,
COUNT(gender) OVER (PARTITION BY gender) AS GenderCount
FROM employeedemographics demo
JOIN employeesalary sal
	ON demo.employeeID = sal.employeeid
