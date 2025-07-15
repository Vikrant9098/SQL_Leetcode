-- Find confirmation rate for each user
SELECT 
    s.user_id,
    -- Calculate confirmation rate: confirmed messages / total messages
    ROUND(
        COALESCE(
            SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.action),
            0
        ), 
        2
    ) AS confirmation_rate
FROM Signups s
-- Left join to include users who never requested confirmations
LEFT JOIN Confirmations c ON s.user_id = c.user_id
-- Group by user to calculate rate per user
GROUP BY s.user_id;