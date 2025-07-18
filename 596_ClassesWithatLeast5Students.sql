-- Select the class column from a subquery that groups students by class
SELECT class
FROM Courses
GROUP BY class         -- Group the records by the 'class' column
HAVING COUNT(student) >= 5;  -- Only keep groups (classes) that have 5 or more students
