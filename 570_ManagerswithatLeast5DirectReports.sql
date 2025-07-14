-- Find managers with at least 5 direct reports
-- Count employees per manager and filter for >= 5

SELECT 
    m.name                  -- Manager name
FROM 
    Employee e              -- All employees
JOIN 
    Employee m              -- Manager details
ON 
    e.managerId = m.id      -- Match employee's manager to manager record
GROUP BY 
    e.managerId,            -- Group by manager ID
    m.name                  -- Include manager name
HAVING 
    COUNT(e.id) >= 5;       -- Filter for managers with >= 5 direct reports

-- Logic:
-- 1. JOIN Employee table with itself to connect employees to their managers
-- 2. GROUP BY managerId to count reports per manager
-- 3. HAVING COUNT() >= 5 filters for managers with at least 5 reports