-- Select manager details and aggregated report data
SELECT 
    e.employee_id,          -- Manager's employee ID
    e.name,                 -- Manager's name
    COUNT(r.employee_id) AS reports_count,     -- Count of direct reports
    ROUND(AVG(r.age)) AS average_age           -- Average age of reports, rounded to nearest integer
FROM 
    Employees e             -- e: represents the manager
JOIN 
    Employees r             -- r: represents the employees reporting to e
ON 
    r.reports_to = e.employee_id   -- Join where r reports to e (i.e., manager relationship)
GROUP BY 
    e.employee_id, e.name   -- Group by manager to calculate aggregates
ORDER BY 
    e.employee_id;          -- Order the result by manager's ID as per output requirement
