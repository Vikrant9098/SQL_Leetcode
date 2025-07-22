SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016  -- Sum tiv_2016 of filtered rows and round to 2 decimal places
FROM
    Insurance                             -- Use the Insurance table
WHERE
    tiv_2015 IN (                         -- Filter: tiv_2015 must appear in multiple rows
        SELECT tiv_2015                  -- Subquery to find duplicated tiv_2015 values
        FROM Insurance
        GROUP BY tiv_2015                -- Group by tiv_2015 to count duplicates
        HAVING COUNT(*) > 1              -- Keep only tiv_2015 values that occur more than once
    )
    AND
    (lat, lon) IN (                       -- Filter: location (lat, lon) must be unique
        SELECT lat, lon                  -- Subquery to find unique locations
        FROM Insurance
        GROUP BY lat, lon                -- Group by location
        HAVING COUNT(*) = 1              -- Keep only locations that appear once
    );
