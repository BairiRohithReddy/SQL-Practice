WITH cte AS(
    SELECT managerId, count(*) AS direct_reports 
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId)

SELECT name 
FROM Employee 
WHERE managerId IN (
    SELECT managerId 
    FROM cte 
    WHERE direct_reports >= 5)


-- approach 2

SELECT b.name 
FROM Employee a
JOIN Employee b
ON a.managerId = b.id
GROUP BY b.id 
HAVING COUNT(*) >= 5;