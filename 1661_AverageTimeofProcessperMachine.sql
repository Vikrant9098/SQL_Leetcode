-- Calculate average processing time per machine
-- Join start and end activities, then calculate average time difference

SELECT 
    s.machine_id,
    ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM 
    Activity s  -- 's' for start activities
JOIN 
    Activity e  -- 'e' for end activities
ON 
    s.machine_id = e.machine_id    -- Same machine
    AND s.process_id = e.process_id -- Same process
WHERE 
    s.activity_type = 'start'       -- Get start timestamps
    AND e.activity_type = 'end'     -- Get end timestamps
GROUP BY 
    s.machine_id                    -- Group by machine for average
ORDER BY 
    s.machine_id;

-- Logic:
-- 1. Self-join to match start/end pairs for each process
-- 2. Calculate processing time: end - start
-- 3. Average all processing times per machine
-- 4. Round to 3 decimal places