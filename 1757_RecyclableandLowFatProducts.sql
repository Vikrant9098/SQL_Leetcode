-- Select the product_id from the Products table
SELECT product_id
FROM Products
-- Filter only those rows where both low_fats and recyclable are 'Y'
WHERE low_fats = 'Y' AND recyclable = 'Y';
