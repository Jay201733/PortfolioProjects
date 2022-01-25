/* 
TEMP TABLES: These tables are physically created in the tempdb database. These tables act as the normal table and also can have constraints,
and index like normal tables. CTE is a temporary result set which is to manipulate the complex sub query data. This is created in memory 
rather than the Tempdb database.
*/

CREATE TABLE #temp_employee(
employeeID int, jobtitle varchar(100), salary int
)

SELECT*
FROM #temp_employee

INSERT INTO #temp_employee VALUES
('1001', 'HR', '45000')


-- instead of inserting values everything time using INSERT INTO command, we can simply copy contents from one of the table to the temp table
INSERT INTO #temp_employee
SELECT*
FROM employeesalary

CREATE TABLE #temp_employee2(
jobtitle varchar(100),
employeesperjob int,
avgage int,
avgsalary int
)

select *
from #temp_employee2

INSERT INTO #temp_employee2
SELECT sal.jobtitle, COUNT(sal.jobtitle), AVG(demo.age), AVG(sal.salary)
FROM employeedemographics demo
JOIN employeesalary sal
	ON demo.employeeID = sal.employeeid
GROUP BY jobtitle



