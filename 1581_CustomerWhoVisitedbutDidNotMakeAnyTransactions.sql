-- Solution using LEFT JOIN to find visits without transactions
SELECT 
    v.customer_id,                    -- Get customer_id from Visits table
    COUNT(v.visit_id) AS count_no_trans  -- Count visits without transactions
FROM 
    Visits v                          -- Main table with all visits
LEFT JOIN 
    Transactions t                    -- Left join to preserve all visits
ON 
    v.visit_id = t.visit_id          -- Join condition: match visit_id in both tables
WHERE 
    t.visit_id IS NULL               -- Filter for visits with no corresponding transactions
GROUP BY 
    v.customer_id;                   -- Group by customer to count visits per customer