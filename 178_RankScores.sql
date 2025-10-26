SELECT 
    score,                              -- Select the score column
    DENSE_RANK() OVER (ORDER BY score DESC) AS `rank`  -- Assign rank without gaps, highest score = 1
FROM Scores                              -- From the Scores table
ORDER BY score DESC;                      -- Order the output from highest to lowest score
