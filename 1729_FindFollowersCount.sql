-- Select user_id and the number of followers they have
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id           -- Group by each user_id to count their followers
ORDER BY user_id ASC;      -- Sort the result by user_id in ascending order
