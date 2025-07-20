-- Select 'Low Salary' category and count how many accounts have income less than 20000
SELECT 'Low Salary' AS category,           -- Label the category as 'Low Salary'
       COUNT(*) AS accounts_count          -- Count all rows where condition matches
FROM Accounts                              -- From the Accounts table
WHERE income < 20000                       -- Only include rows with income strictly less than 20000

UNION                                      -- Combine results from multiple SELECT statements

-- Select 'Average Salary' category and count how many accounts have income between 20000 and 50000 (inclusive)
SELECT 'Average Salary' AS category,       -- Label the category as 'Average Salary'
       COUNT(*) AS accounts_count          -- Count all rows where income is in average range
FROM Accounts                              -- From the Accounts table
WHERE income BETWEEN 20000 AND 50000       -- Include rows with income from 20000 to 50000 inclusive

UNION                                      -- Combine results from multiple SELECT statements

-- Select 'High Salary' category and count how many accounts have income greater than 50000
SELECT 'High Salary' AS category,          -- Label the category as 'High Salary'
       COUNT(*) AS accounts_count          -- Count all rows where income is high
FROM Accounts                              -- From the Accounts table
WHERE income > 50000;                      -- Only include rows with income strictly greater than 50000
