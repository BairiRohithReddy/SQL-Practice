-- approach -1
SELECT class FROM
(SELECT class, count(*) as cnt
FROM Courses
GROUP BY class 
HAVING cnt >= 5) t;

-- approach -2
SELECT class
FROM Courses
GROUP BY class 
HAVING count(*) >= 5
