CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  -- Adjust N to use 0-based indexing for OFFSET
  SET N = N-1;

  -- Return the Nth highest distinct salary
  RETURN (
      -- Select distinct salaries from Employee table
      SELECT DISTINCT(salary)
      -- Order salaries from highest to lowest
      FROM Employee
      ORDER BY salary DESC
      -- Skip the first N salaries and get the next one
      LIMIT 1 OFFSET N
  );
END
