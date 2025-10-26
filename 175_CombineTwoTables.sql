-- Select the first name of each person
SELECT 
    p.firstName,
    -- Select the last name of each person
    p.lastName,
    -- Select the city from the Address table (will be NULL if no match)
    a.city,
    -- Select the state from the Address table (will be NULL if no match)
    a.state
-- From the Person table (alias as p)
FROM Person p
-- Left join with the Address table (alias as a)
LEFT JOIN Address a
-- Join condition: match personId in Person with personId in Address
ON p.personId = a.personId;
