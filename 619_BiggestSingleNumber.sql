-- Select the maximum number among all single numbers (appeared only once)
SELECT MAX(num) AS num
-- From a subquery that identifies all single numbers
FROM (
    SELECT num
    -- Group numbers to count their occurrences
    FROM MyNumbers
    GROUP BY num
    -- Keep only the numbers that appear exactly once
    HAVING COUNT(*) = 1
) AS singles;
