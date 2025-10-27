# Write your MySQL query statement below

# Select the customer name and show it as 'Customers'
SELECT name AS Customers

# From the Customers table
FROM Customers

# Pick customers whose id is not in the Orders table
WHERE id NOT IN (
    
    # Get all customer IDs who placed orders
    SELECT customerId FROM Orders
);
