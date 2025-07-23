DELETE P1  -- Delete rows from the Person table using alias P1
FROM Person P1  -- Give the Person table an alias P1 (the row to potentially delete)
JOIN Person P2  -- Join again with the same table, giving it alias P2 (the row we want to keep)
  ON P1.email = P2.email  -- Match rows that have the same email
  AND P1.id > P2.id;      -- But only where P1 has a higher id (duplicate with larger id)
