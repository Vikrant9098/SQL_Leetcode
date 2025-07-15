-- Find movies with odd ID and not boring description
SELECT 
    id,
    movie,
    description,
    rating
FROM Cinema
-- Filter for odd-numbered IDs using modulo operator
WHERE id % 2 = 1
-- Filter out movies with "boring" description
AND description != 'boring'
-- Order by rating in descending order (highest first)
ORDER BY rating DESC;