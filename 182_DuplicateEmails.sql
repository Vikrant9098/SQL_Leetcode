# Write your MySQL query statement below

# Select the email column and name it as 'Email'
SELECT email AS Email

# From the Person table
FROM Person

# Group rows having the same email together
GROUP BY email

# Keep only emails that appear more than once
HAVING COUNT(email) > 1;
