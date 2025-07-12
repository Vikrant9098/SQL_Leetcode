-- Select specific columns from the World table
SELECT name, population, area 
-- Specify the table to query from
FROM World 
-- Filter rows based on two conditions
WHERE area >= 3000000 
   -- OR operator allows either condition to be true
   OR population >= 25000000;