-- USER ACTIVITY FOR THE PAST 30 DAYS I 
-- Problem: Find daily active user count for 30 days ending 2019-07-27 (inclusive)

-- MAIN SOLUTION: Using GROUP BY with COUNT(DISTINCT) and date filtering
-- This is the most efficient approach for counting unique users per day

SELECT 
    activity_date AS day,           -- WHY: We need to show each activity date as "day"
                                   -- HOW: Rename activity_date to match expected output format
                                   -- Each row will represent one day with user activity
    
    COUNT(DISTINCT user_id) AS active_users  -- WHY: Count unique users per day (not total activities)
                                            -- HOW: COUNT(DISTINCT) eliminates duplicate users on same day
                                            -- Same user can have multiple activities on same day
                                            -- but should be counted only once as "active"
                                            
FROM Activity                      -- WHY: This is our source table with user activity data
                                  -- HOW: Standard FROM clause to specify data source

WHERE activity_date BETWEEN       -- WHY: We need exactly 30 days ending 2019-07-27 inclusive
    DATE_SUB('2019-07-27', INTERVAL 29 DAY)  -- WHY: Start date = end_date - 29 days (not 30!)
                                             -- HOW: DATE_SUB subtracts 29 days from 2019-07-27
                                             -- LOGIC: 29 days before + end day = 30 days total
                                             -- Start: 2019-06-28, End: 2019-07-27 = 30 days
    AND '2019-07-27'              -- WHY: End date is inclusive (specified in problem)
                                 -- HOW: BETWEEN includes both start and end dates

GROUP BY activity_date           -- WHY: We want results grouped by each day
                                -- HOW: GROUP BY aggregates all rows with same activity_date
                                -- This allows COUNT(DISTINCT user_id) to work per day

ORDER BY activity_date;         -- WHY: Makes output chronological and more readable
                               -- HOW: Sorts results by date in ascending order
                               -- Problem says "any order" but this is good practice

-- STEP-BY-STEP EXPLANATION OF HOW IT WORKS:
-- 1. WHERE clause filters data to 30-day window (2019-06-28 to 2019-07-27)
-- 2. GROUP BY activity_date creates separate groups for each day
-- 3. Within each group, COUNT(DISTINCT user_id) counts unique users
-- 4. If user has multiple activities on same day, DISTINCT ensures counted once
-- 5. Only days with activity appear in result (days with zero users excluded)

-- EXAMPLE WALKTHROUGH WITH GIVEN DATA:
-- After filtering (only 2019-07-20 and 2019-07-21 are in 30-day window):
-- 2019-07-20: user_id [1,1,1,2] → DISTINCT gives [1,2] → COUNT = 2
-- 2019-07-21: user_id [2,2,3,3] → DISTINCT gives [2,3] → COUNT = 2
-- 2019-06-25: Filtered out (outside 30-day window)
