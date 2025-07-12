-- Select unique author_id values and rename column to id
SELECT DISTINCT author_id AS id 
-- Specify the Views table as data source
FROM Views 
-- Filter rows where author viewed their own content
WHERE author_id = viewer_id 
-- Sort results by id in ascending order
ORDER BY id;