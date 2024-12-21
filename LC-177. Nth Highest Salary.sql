-- using User Defined Functions to calculate Nth highest salary

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN 
RETURN (
    SELECT DISTINCT(salary) FROM
    (SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk FROM Employee) AS ranked
    WHERE rnk = N LIMIT 1);
END

SELECT getNthHighestSalary(2) 
-- this will get the second highest salary and similarly we can fetch any Nth highest salary