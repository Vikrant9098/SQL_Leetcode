-- Select the product name and total units ordered
SELECT 
    p.product_name,
    SUM(o.unit) AS unit           -- Calculate total units per product for Feb 2020
FROM 
    Products p                    -- Main table with product details
JOIN 
    Orders o                      -- Orders table, join on product_id
ON 
    p.product_id = o.product_id   -- Match products with their orders
WHERE 
    o.order_date BETWEEN '2020-02-01' AND '2020-02-29'  
    -- Filter only the orders from Feb 2020
GROUP BY 
    p.product_id, p.product_name  
    -- Group by product to aggregate units
HAVING 
    SUM(o.unit) >= 100;          
    -- Keep only products with 100 or more units ordered
