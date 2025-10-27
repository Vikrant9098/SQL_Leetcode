# Write your MySQL query statement below

# Select department name, employee name, and salary
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary

# Join Employee and Department tables
FROM Employee e
JOIN Department d

# Match employee’s department with department id
ON e.departmentId = d.id

# Keep only employees who have the highest salary in their department
WHERE (e.departmentId, e.salary) IN (

    # Find department id and highest salary for each department
    SELECT departmentId, MAX(salary)
    FROM Employee
    GROUP BY departmentId
);
