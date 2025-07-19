-- Select all triangle sides and evaluate whether they can form a triangle
SELECT 
    x,                      -- Side 1 of the triangle
    y,                      -- Side 2 of the triangle
    z,                      -- Side 3 of the triangle

    -- Apply triangle inequality conditions:
    -- If all three conditions hold, then output 'Yes', else 'No'
    CASE 
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'  -- Valid triangle
        ELSE 'No'                                              -- Not a triangle
    END AS triangle          -- Output result column named "triangle"
FROM 
    Triangle;                -- Source table containing triangle side lengths
