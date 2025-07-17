-- NUMBER OF UNIQUE SUBJECTS TAUGHT BY EACH TEACHER 
-- Problem: Count distinct subjects each teacher teaches across all departments

-- MAIN SOLUTION: Using GROUP BY with COUNT(DISTINCT)
-- This is the most efficient and straightforward approach for this problem

SELECT 
    teacher_id,                    -- WHY: We need to show each teacher's ID in output
                                  -- HOW: Simply select the teacher_id column
    
    COUNT(DISTINCT subject_id) AS cnt  -- WHY: We need count of UNIQUE subjects per teacher
                                      -- HOW: COUNT(DISTINCT) eliminates duplicate subjects
                                      -- DISTINCT ensures same subject taught in multiple 
                                      -- departments is counted only once
FROM Teacher                      -- WHY: This is our source table with teacher-subject data
                                 -- HOW: Standard FROM clause to specify data source

GROUP BY teacher_id              -- WHY: We want results grouped by each teacher
                                -- HOW: GROUP BY aggregates rows with same teacher_id
                                -- This allows COUNT(DISTINCT) to work per teacher

ORDER BY teacher_id;            -- WHY: Makes output more readable and predictable
                               -- HOW: Sorts results by teacher_id in ascending order
                               -- Note: Problem says "any order" but this is good practice
