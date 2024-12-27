-- # Write your MySQL query statement below
SELECT Department, Employee, Salary 
FROM (
    SELECT 
    d.name as Department, 
    e.name as Employee, 
    e.salary as Salary, 
    dense_rank() OVER(
        PARTITION BY d.id 
        ORDER BY Salary DESC) as rnk
FROM Employee e
INNER JOIN Department d
ON e.departmentId = d.id) t
WHERE rnk < 4
ORDER BY Department, Salary DESC;