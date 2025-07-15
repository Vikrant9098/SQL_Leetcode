SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,  -- Extract year and month in YYYY-MM format
    country,  -- Grouping by country

    COUNT(*) AS trans_count,  -- Total number of transactions
    SUM(state = 'approved') AS approved_count,  -- Count only approved transactions using boolean sum

    SUM(amount) AS trans_total_amount,  -- Total amount for all transactions
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount  -- Total amount for approved transactions only

FROM 
    Transactions  -- Source table

GROUP BY 
    month, country  -- Group results by extracted month and country