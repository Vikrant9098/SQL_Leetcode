-- Select all numbers that appear at least 3 times consecutively
SELECT 
    DISTINCT l1.num AS ConsecutiveNums   -- Use DISTINCT to avoid duplicate output
FROM 
    Logs l1
        JOIN Logs l2 ON l1.id = l2.id - 1      -- l1 is just before l2
        JOIN Logs l3 ON l1.id = l3.id - 2      -- l1 is two rows before l3
WHERE 
    -- All three consecutive rows must have the same number
    l1.num = l2.num AND
    l2.num = l3.num;
