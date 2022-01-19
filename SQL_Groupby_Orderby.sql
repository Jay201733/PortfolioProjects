/*
GROUP BY, ORDER BY
*/

-- WE DONT ADD ANY DERIVED COLUMN IN THE GROUPBY STATEMENTS SUCH AS COUNT(GENDER) IN THE FOLLOWING QUERY
SELECT gender, age, COUNT(gender) AS gendercount
FROM employeedemographics
GROUP BY gender, age


-- USING WHERE STATEMENTS WITH GROUPBY STATEMENTS
SELECT gender, age, COUNT(gender) AS gendercount
FROM employeedemographics
WHERE age<32
GROUP BY gender, age

-- USING WHERE STATEMENTS WITH ORDERBY STATEMENTS
SELECT gender, COUNT(gender) AS gendercount
FROM employeedemographics
WHERE age<32
GROUP BY gender
ORDER BY gendercount ASC

SELECT*
FROM employeedemographics
ORDER BY age DESC, gender DESC /* same thing can be done by using the column number ORDER BY 4, 5*/