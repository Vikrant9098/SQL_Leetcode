-- GAME PLAY ANALYSIS IV 
-- Problem: Find fraction of players who logged in on the day after their first login

-- STEP 1: Create a subquery to find each player's first login date
-- This is crucial because we need to identify the "first day" for each player
-- We use MIN(event_date) to get the earliest login date for each player
-- GROUP BY player_id ensures we get one record per player

-- STEP 2: Join with original Activity table to check consecutive day login
-- We use LEFT JOIN to keep all players (even those who didn't login consecutively)
-- The join condition checks if player logged in exactly 1 day after first login
-- DATE_ADD(first_login, INTERVAL 1 DAY) calculates the next day

-- STEP 3: Calculate fraction using AVG with CASE statement
-- AVG() is more efficient than COUNT(DISTINCT)/COUNT(DISTINCT) approach
-- CASE statement returns 1.0 for consecutive logins, 0.0 for non-consecutive
-- AVG of 1s and 0s gives us the fraction directly
-- ROUND(..., 2) formats result to 2 decimal places as required

SELECT 
    ROUND(
        -- Calculate average of 1s and 0s to get fraction
        AVG(
            CASE 
                WHEN consecutive_check.player_id IS NOT NULL 
                THEN 1.0  -- Player logged in consecutively
                ELSE 0.0  -- Player did NOT log in consecutively
            END
        ), 
        2  -- Round to 2 decimal places as per problem requirement
    ) AS fraction
FROM (
    -- SUBQUERY: Get first login date for each player
    -- This gives us the baseline to check consecutive login
    SELECT 
        player_id,
        MIN(event_date) AS first_login  -- Find earliest login date per player
    FROM Activity
    GROUP BY player_id  -- One record per player
) AS first_logins

-- LEFT JOIN to check if player logged in the day after first login
-- LEFT JOIN ensures all players are included in final count
LEFT JOIN Activity AS consecutive_check 
    ON first_logins.player_id = consecutive_check.player_id 
    AND consecutive_check.event_date = DATE_ADD(first_logins.first_login, INTERVAL 1 DAY);
