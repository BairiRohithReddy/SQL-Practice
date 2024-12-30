-- approach -1
SELECT r.contest_id, 
ROUND(COUNT(DISTINCT r.user_id) * 100.0 /NULLIF((SELECT COUNT(user_id) FROM Users), 0), 2) AS percentage
FROM Users u 
INNER JOIN Register r 
ON u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id;

-- approach -2
SELECT 
    contest_id, 
    ROUND(COUNT(DISTINCT user_id) * 100.0 / NULLIF((SELECT COUNT(user_id) FROM Users), 0), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;
