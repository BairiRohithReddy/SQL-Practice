-- # Write your MySQL query statement below
-- SELECT *
-- FROM Cinema
-- WHERE id % 2 != 0
-- AND description != 'boring'
-- ORDER BY rating DESC;

-- Write your MySQL query statement below
SELECT *
FROM Cinema
WHERE mod(id, 2) != 0
AND description != 'boring'
ORDER BY rating DESC;