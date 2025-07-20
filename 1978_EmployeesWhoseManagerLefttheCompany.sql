-- Select the employee_id of employees who meet the criteria
SELECT e.employee_id                      -- Select employee ID from alias 'e' (Employees table)
FROM Employees e                          -- Use 'e' as an alias for the Employees table (employee record)
WHERE e.salary < 30000                    -- Only consider employees with salary strictly less than 30000
  AND e.manager_id IS NOT NULL           -- Ensure the employee has a manager (manager_id is not NULL)
  AND e.manager_id NOT IN (              -- Check that the manager_id does not exist in employee_id column
    SELECT employee_id                   -- Subquery: list all existing employee IDs
    FROM Employees                       -- From the same Employees table
  )
ORDER BY e.employee_id;                  -- Sort the result by employee_id in ascending order
