-- Select the employee and their primary department
SELECT 
    employee_id,         -- Select employee ID
    department_id        -- Select the department ID (which will be the primary department)
FROM 
    Employee             -- From the Employee table
WHERE 
    primary_flag = 'Y'   -- Case 1: Choose if this is explicitly marked as the primary department

    OR                   -- OR, include employees who belong to only one department

    employee_id IN (     -- Begin subquery to find such employees
        SELECT 
            employee_id          -- Look for employee IDs
        FROM 
            Employee             -- From the same Employee table
        GROUP BY 
            employee_id          -- Group by employee to count how many departments they belong to
        HAVING 
            COUNT(*) = 1         -- Case 2: Only include employees who belong to exactly one department
    );

-- Logic:
-- 1. CASE 1: If the employee is marked as primary, include them
-- 2. CASE 2: If the employee is not marked as primary, but belongs to only one department, include them