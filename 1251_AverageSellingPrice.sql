-- Find average selling price for each product
SELECT 
    p.product_id,
    -- Calculate average price: total revenue / total units sold
    ROUND(
        COALESCE(
            SUM(p.price * u.units) / SUM(u.units),
            0
        ),
        2
    ) AS average_price
FROM Prices p
-- Left join to include products with no sales (price = 0)
LEFT JOIN UnitsSold u ON p.product_id = u.product_id
-- Join condition: purchase date must be within price period
AND u.purchase_date BETWEEN p.start_date AND p.end_date
-- Group by product to calculate average per product
GROUP BY p.product_id;