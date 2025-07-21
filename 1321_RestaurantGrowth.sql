-- Aggregate data by visited_on (since one customer can visit per day)
WITH DailyAmount AS (
    SELECT
        visited_on,
        SUM(amount) AS amount -- total amount per day (even if multiple customers visited)
    FROM Customer
    GROUP BY visited_on
)

-- Now calculate 7-day window data
SELECT
    d1.visited_on,  -- current day (window end)
    SUM(d2.amount) AS amount, -- sum of amounts from current day + past 6 days
    ROUND(SUM(d2.amount) / 7, 2) AS average_amount -- average rounded to 2 decimal places
FROM DailyAmount d1

-- Join with all dates d2 that are within 6 days before current date (inclusive)
JOIN DailyAmount d2
    ON d2.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 6 DAY) AND d1.visited_on

-- Only include rows where we have full 7-day data
WHERE d1.visited_on >= (
    SELECT MIN(visited_on) + INTERVAL 6 DAY FROM DailyAmount
)

-- Group by the current day
GROUP BY d1.visited_on

-- Sort by visited_on ascending
ORDER BY d1.visited_on;
