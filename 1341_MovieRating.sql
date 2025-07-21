-- Step 1: Find the user who has rated the greatest number of movies
(
    SELECT name AS results
    FROM Users u
    JOIN MovieRating mr ON u.user_id = mr.user_id
    -- Count how many movies each user has rated
    GROUP BY u.user_id, u.name
    -- Order by number of ratings (descending), then name (ascending)
    ORDER BY COUNT(*) DESC, u.name ASC
    LIMIT 1  -- Get the top user only
)

UNION ALL

-- Step 2: Find the movie with the highest average rating in Feb 2020
(
    SELECT title AS results
    FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
    -- Only consider ratings in February 2020
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    -- Group by each movie to calculate average rating
    GROUP BY m.movie_id, m.title
    -- Order by highest average rating, then title (lexicographically)
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1  -- Get the top movie only
);
