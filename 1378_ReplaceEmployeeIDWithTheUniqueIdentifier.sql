-- Solution using LEFT JOIN to include all employees even without unique_id
SELECT 
    eu.unique_id,  -- Select unique_id from EmployeeUNI (will be NULL if no match)
    e.name         -- Select name from Employees table
FROM 
    Employees e    -- Main table with all employees
LEFT JOIN 
    EmployeeUNI eu -- Left join to preserve all employees
ON 
    e.id = eu.id;  -- Join condition: match employee id with unique identifier table