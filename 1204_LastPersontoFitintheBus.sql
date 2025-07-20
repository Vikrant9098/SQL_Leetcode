-- Select the name of the last person who can board the bus within the 1000 kg limit
SELECT person_name
FROM (
    -- Calculate cumulative weight as people board the bus by turn order
    SELECT person_name, 
           SUM(weight) OVER (ORDER BY turn) AS total_weight,
           turn
    FROM Queue
) AS boarding
-- Filter out anyone who exceeds the weight limit after boarding
WHERE total_weight <= 1000
-- Sort in reverse to get the last person who boarded within the limit
ORDER BY turn DESC
-- Only return one result: the last person
LIMIT 1;
