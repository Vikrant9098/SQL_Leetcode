SELECT 
    d.name AS Department,             -- Select department name
    e.name AS Employee,               -- Select employee name
    e.salary AS Salary                -- Select employee salary
FROM (
    SELECT 
        e.*,                         -- Select all columns from Employee
        DENSE_RANK() OVER (          -- Rank salaries using DENSE_RANK
            PARTITION BY departmentId   -- Rank per department
            ORDER BY salary DESC        -- Highest salary = rank 1
        ) AS `rank`                  -- Alias the rank (use backticks to avoid syntax error)
    FROM Employee e
) e
JOIN Department d                    -- Join to get department names
ON e.departmentId = d.id            -- Join condition: match department ID
WHERE e.`rank` <= 3                 -- Only top 3 salaries (by rank)
