-- Find the latest price of each product before or on '2019-08-16'
WITH latest_price_change AS (                            -- Create a temporary table (CTE)
    SELECT
        product_id,                                      -- Select the product ID
        MAX(change_date) AS latest_date                  -- Get the latest date of price change
    FROM Products                                         -- From the Products table
    WHERE change_date <= '2019-08-16'                    -- Only consider changes up to this date
    GROUP BY product_id                                  -- One latest date per product
)

-- Now get the price of each product as of '2019-08-16'
SELECT
    p.product_id,                                        -- Show product ID
    COALESCE(lp.new_price, 10) AS price                  -- Show latest price or default to 10
FROM
    (SELECT DISTINCT product_id FROM Products) AS p      -- Get all unique products
LEFT JOIN Products lp                                    -- Join to find their latest price
    ON p.product_id = lp.product_id                      -- Match product IDs
   AND lp.change_date = (                                -- Only pick the latest valid date
        SELECT MAX(change_date)                          -- Get the latest date for this product
        FROM Products
        WHERE product_id = p.product_id                  -- For the same product
        AND change_date <= '2019-08-16'                  -- Only up to the target date
    )
