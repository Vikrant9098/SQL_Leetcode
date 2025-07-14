-- Find employees with bonus < 1000 (including those with no bonus)
-- Use LEFT JOIN to include all employees, even without bonus records

SELECT 
    e.name,        -- Employee name
    b.bonus        -- Bonus amount (NULL if no bonus record)
FROM 
    Employee e     -- All employees
LEFT JOIN 
    Bonus b        -- Bonus records (optional)
ON 
    e.empId = b.empId    -- Match by employee ID
WHERE 
    b.bonus < 1000       -- Bonus less than 1000
    OR b.bonus IS NULL;  -- OR no bonus record exists

-- Logic:
-- 1. LEFT JOIN keeps all employees, even without bonus
-- 2. Filter for bonus < 1000 OR bonus IS NULL
-- 3. This includes employees with no bonus (NULL) and bonus < 1000