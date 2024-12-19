-- LC-196 Delete Duplicate Emails

-- WITH cte as
-- (SELECT id, email, RANK() OVER(PARTITION BY email ORDER BY id) as rnk
-- FROM Person)
-- DELETE FROM Person
-- WHERE id in 
-- (SELECT id FROM cte 
-- WHERE rnk > 1)

DELETE FROM Person 
WHERE id NOT IN 
(SELECT id FROM (SELECT MIN(id) as id
FROM Person GROUP BY email) as temp
)
