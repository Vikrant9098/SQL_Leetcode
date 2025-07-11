-- Select the name column from the Customer table
SELECT name
FROM Customer
-- Filter out customers who were referred by customer with id = 2
WHERE referee_id != 2 OR referee_id IS NULL;
