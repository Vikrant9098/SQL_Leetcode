SELECT 
    r.contest_id,  -- Select the contest ID
    ROUND(
        COUNT(DISTINCT r.user_id) * 100.0 / (SELECT COUNT(*) FROM Users),  -- Calculate percentage of users registered for the contest
        2  -- Round the result to 2 decimal places
    ) AS percentage
FROM 
    Register r  -- Use the Register table (alias r)
GROUP BY 
    r.contest_id  -- Group by contest ID to calculate per contest stats
ORDER BY 
    percentage DESC,  -- Sort by percentage in descending order
    r.contest_id ASC;  -- In case of tie, sort by contest ID in ascending order
