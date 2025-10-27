# Write your MySQL query statement below

# Get employee name
SELECT e.name AS Employee

# From employee table joined with itself
FROM Employee e
JOIN Employee m

# Match employee’s manager with manager’s id
ON e.managerId = m.id

# Only take employees who earn more than their manager
WHERE e.salary > m.salary;
