SELECT 
    -- Select the date on which products were sold
    sell_date, 
    
    -- Count the number of distinct products sold on that date
    COUNT(DISTINCT product) AS num_sold, 
    
    -- Concatenate all unique product names sold on that date, sorted lexicographically, separated by commas
    GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM 
    -- The source table that contains product sales records
    Activities
GROUP BY 
    -- Group all rows by the date they were sold, so that each group corresponds to one day
    sell_date
ORDER BY 
    -- Ensure the final result is sorted by date in ascending order
    sell_date;
