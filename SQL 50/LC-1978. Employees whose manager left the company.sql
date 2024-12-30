-- approach -1
SELECT e1.employee_id
FROM Employees e1
LEFT JOIN Employees e2
on e1.manager_id = e2.employee_id
WHERE e1.salary< 30000 AND e1.manager_id IS NOT NULL and e2.employee_id IS NULL
ORDER BY e1.employee_id;

-- approach -2
SELECT e1.employee_id
FROM Employees e1
WHERE e1.salary < 30000 
  AND e1.manager_id IS NOT NULL 
  AND NOT EXISTS (
      SELECT 1 
      FROM Employees e2 
      WHERE e2.employee_id = e1.manager_id
  )
ORDER BY e1.employee_id;
