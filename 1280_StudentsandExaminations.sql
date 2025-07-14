-- Find number of times each student attended each exam
-- Need all student-subject combinations, even if no exams taken

SELECT 
    s.student_id,           -- Student ID
    s.student_name,         -- Student name
    sub.subject_name,       -- Subject name
    COUNT(e.student_id) AS attended_exams  -- Count exam attempts (0 if none)
FROM 
    Students s              -- All students
CROSS JOIN 
    Subjects sub            -- All subjects (creates all combinations)
LEFT JOIN 
    Examinations e          -- Exam records (optional)
ON 
    s.student_id = e.student_id        -- Match student
    AND sub.subject_name = e.subject_name  -- Match subject
GROUP BY 
    s.student_id,           -- Group by student
    s.student_name,         -- Include student name
    sub.subject_name        -- Group by subject
ORDER BY 
    s.student_id,           -- Order by student ID first
    sub.subject_name;       -- Then by subject name

-- Logic:
-- 1. CROSS JOIN creates all student-subject combinations
-- 2. LEFT JOIN adds exam records where they exist
-- 3. COUNT() counts actual exam attempts (0 for no records)
-- 4. GROUP BY ensures one row per student-subject pair