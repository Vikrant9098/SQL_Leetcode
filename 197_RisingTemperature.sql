-- Solution using self-join to compare temperatures with previous day
SELECT 
    w1.id                        -- Get id of the day with higher temperature
FROM 
    Weather w1                   -- Current day's weather data
JOIN 
    Weather w2                   -- Previous day's weather data
ON 
    w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)  -- Join condition: w1 is exactly 1 day after w2
WHERE 
    w1.temperature > w2.temperature;  -- Filter for days where temperature increased