SELECT 
    query_name,  -- Select the query name (grouping key)

    -- Calculate quality: average of (rating / position)
    ROUND(AVG(1.0 * rating / position), 2) AS quality,  

    -- Calculate poor query percentage: (count of poor queries / total queries) * 100
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage  

FROM 
    Queries  -- From the Queries table
GROUP BY 
    query_name;  -- Group the results by query_name
