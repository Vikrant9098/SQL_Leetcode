-- Select all records from the Users table
SELECT * 
FROM Users
-- Apply a filter using REGEXP_LIKE to match only valid leetcode emails
WHERE REGEXP_LIKE(
    mail, 
    '^[A-Za-z]+[A-Za-z0-9_.-]*@leetcode[.]com$',  -- Regular expression pattern
    'c'                                           -- 'c' flag means case-sensitive matching
);
