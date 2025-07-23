SELECT
  (SELECT DISTINCT salary     -- Select unique salaries only
   FROM Employee              -- From the Employee table
   ORDER BY salary DESC       -- Sort salaries in descending order (highest first)
   LIMIT 1 OFFSET 1)          -- Skip the first (highest), and return the second
  AS SecondHighestSalary;     -- Name the column as SecondHighestSalary
