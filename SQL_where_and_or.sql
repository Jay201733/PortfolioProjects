/*
WHERE STATEMENTS
=, <>, <, >, AND, OR, LIKE, NULL, NOT NULL, IN
*/

--SELECT PEOPLE WITH AGE LESS THAN 32
SELECT *
FROM employeedemographics
WHERE age<32 

--SELECT PEOPLE WITH AGE LESS THAN 32 AND GENDER MALE
SELECT *
FROM employeedemographics
WHERE age<32 AND gender = 'male'
-- Similary you can use different boolean operators like AND/OR depending on the requirement



--USE LIKE STATEMENT (WILDCARD) TO FIND LAST NAMES WHICH CONTAINS CERTAIN CHARACTERS
SELECT*
FROM employeedemographics
WHERE lastname LIKE '%co%'

-- USING NULL STATEMENTS
SELECT *
FROM employeedemographics
WHERE firstname IS NOT NULL

-- USING IN STATEMENTS, ITS MORE LIKE MULTIPLE EQUAL STATEMENTS
SELECT *
FROM employeedemographics
WHERE firstname in ('jim', 'michael')
