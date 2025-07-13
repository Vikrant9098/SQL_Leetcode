-- Solution using INNER JOIN to combine Sales and Product tables
SELECT 
    p.product_name,  -- Get product name from Product table
    s.year,          -- Get year from Sales table
    s.price          -- Get price from Sales table
FROM 
    Sales s          -- Main table containing sales data
INNER JOIN 
    Product p        -- Join with Product table to get product names
ON 
    s.product_id = p.product_id;  -- Join condition: match product_id in both tables