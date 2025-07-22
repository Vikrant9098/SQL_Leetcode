SELECT 
    user_id,                                       -- Select user ID as-is
    CONCAT(                                        -- Concatenate two parts to fix the name format
        UPPER(LEFT(name, 1)),                     -- Capitalize the first character of the name
        LOWER(SUBSTRING(name, 2))                 -- Convert the rest of the name to lowercase
    ) AS name                                      -- Alias the result as 'name'
FROM Users
ORDER BY user_id;                                 -- Sort the result by user_id in ascending order
