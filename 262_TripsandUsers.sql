# Write your MySQL query statement below
SELECT 
    t.request_at AS Day,  -- Date of the trip
    ROUND(
        SUM(CASE WHEN t.status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END) 
        / COUNT(*), 2      -- Calculate cancellation rate and round to 2 decimals
    ) AS "Cancellation Rate"
FROM Trips t
JOIN Users c ON t.client_id = c.users_id AND c.banned = 'No' AND c.role = 'client'  -- Only unbanned clients
JOIN Users d ON t.driver_id = d.users_id AND d.banned = 'No' AND d.role = 'driver'  -- Only unbanned drivers
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'  -- Filter dates
GROUP BY t.request_at  -- Group by each day
ORDER BY t.request_at;  -- Order by date
