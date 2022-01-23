/* UPDATING/ DELETING TABLE */

SELECT *
FROM employeedemographics
WHERE firstname = 'holly' AND lastname = 'flax'
-- the above statement showed that this particular data entry does not have employeeid assigned to it

-- the following query will update the employeeid for 
UPDATE employeedemographics
SET employeeID = 1012
WHERE firstname = 'holly' AND lastname = 'flax'

-- lets add the age and gender of Holly
UPDATE employeedemographics
SET age = 21, gender = 'female'   -- instead of AND statement we use comma to seperate out different conditions
WHERE firstname = 'holly' AND lastname = 'flax'

--DELETE INFORMATION FROM TABLES | But be careful as there is no way to reverse back the delete statement outcome
DELETE FROM employeedemographics
WHERE employeeID = 1012