SELECT id, DATEDIFF(end_date, start_date) as diff 
FROM Tasks
ORDER BY diff DESC
LIMIT 3;