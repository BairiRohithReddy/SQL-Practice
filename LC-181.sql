-- Find employees who earn more than their managers

SELECT e1.name as Employee
FROM employee as e1
Inner Join employee as e2
on e1.managerid = e2.id;