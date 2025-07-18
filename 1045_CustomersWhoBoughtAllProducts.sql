-- Select customer_id from the Customer table
SELECT customer_id
FROM Customer
-- Group by customer_id so we can analyze purchases per customer
GROUP BY customer_id
-- We use the HAVING clause to filter only those customers
-- who bought the total number of distinct products present in the Product table
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
