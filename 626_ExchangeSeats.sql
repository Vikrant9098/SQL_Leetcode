SELECT
    CASE
        -- If the id is odd and the next id exists (i.e., not the last row), swap with next student
        WHEN id % 2 = 1 AND id + 1 <= (SELECT MAX(id) FROM Seat) THEN id + 1
        
        -- If the id is even, swap with the previous student
        WHEN id % 2 = 0 THEN id - 1

        -- If it's the last student with an odd id and no one to swap with, keep id as it is
        ELSE id
    END AS id,

    -- Keep the student name as is, just reassign the new id
    student

FROM Seat

-- Finally, sort the output by new id to keep it in ascending order
ORDER BY id;
