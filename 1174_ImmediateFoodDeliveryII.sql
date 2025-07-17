SELECT 
    ROUND(
        SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),  -- Calculate percentage of immediate first orders
        2  -- Round to 2 decimal places
    ) AS immediate_percentage
FROM 
    Delivery d
WHERE 
    -- Filter to only first orders for each customer
    (customer_id, order_date) IN (
        SELECT 
            customer_id, MIN(order_date)  -- Find the earliest order date per customer (first order)
        FROM 
            Delivery
        GROUP BY 
            customer_id
    );
OUTTEAM