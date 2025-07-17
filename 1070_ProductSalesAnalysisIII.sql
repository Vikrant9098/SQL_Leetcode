-- Step 1: Create a Common Table Expression (CTE) to find the first year each product was sold
WITH FirstYear AS (
    SELECT 
        product_id,             -- Select the product ID
        MIN(year) AS first_year -- Get the earliest year this product was sold
    FROM Sales
    GROUP BY product_id        -- Group by product to find the first year per product
)

-- Step 2: Select the sales that happened in the first year for each product
SELECT 
    s.product_id,   -- Product ID from Sales table
    f.first_year,   -- First year from the CTE
    s.quantity,     -- Quantity sold in that sale
    s.price         -- Price per unit in that sale
FROM Sales s
JOIN FirstYear f                   -- Join the CTE with the original Sales table
    ON s.product_id = f.product_id -- Match on product_id
    AND s.year = f.first_year      -- Only take sales that happened in the first year
;
