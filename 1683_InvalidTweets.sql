-- Select tweet_id column from the table
SELECT tweet_id 
-- Specify the Tweets table as data source
FROM Tweets 
-- Filter rows where content length exceeds 15 characters
WHERE LENGTH(content) > 15;