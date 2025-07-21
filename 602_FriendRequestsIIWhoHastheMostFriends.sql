-- Step 1: Create a temporary table 'AllFriends'
-- This combines requester_id and accepter_id into one column 'id'
-- Because a friendship means both people should count as having a friend
WITH AllFriends AS (
    SELECT requester_id AS id FROM RequestAccepted  -- Take requester as a friend
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted   -- Take accepter as a friend
),

-- Step 2: Count the number of friends each user has
-- We group by 'id' (user ID) and count how many times each appears in the AllFriends list
FriendCount AS (
    SELECT
        id,                 -- User ID
        COUNT(*) AS num     -- Number of friends the user has
    FROM AllFriends
    GROUP BY id             -- Group by each user to count their friends
),

-- Step 3: Find the maximum number of friends among all users
-- This tells us what is the highest friend count
MaxCount AS (
    SELECT MAX(num) AS max_friends FROM FriendCount  -- Get the maximum number of friends
)

-- Step 4: Select users whose friend count equals the maximum found
-- This will return all users tied with the most friends (if more than one)
SELECT
    f.id,            -- User ID
    f.num            -- Their friend count
FROM FriendCount f
JOIN MaxCount m ON f.num = m.max_friends;  -- Only return users whose friend count is the maximum
