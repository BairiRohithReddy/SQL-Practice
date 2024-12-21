/*
The idea is to use dense_rank() and order the salary in descending order and then fetch the salary where dense_rank = 2;
case when is used to ensure we return null if there is no second highest or dense_rank() =2;


*/
SELECT 
    CASE 
        WHEN COUNT(DISTINCT salary) < 2 THEN NULL
        ELSE (
            SELECT DISTINCT salary
            FROM (
                SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rnk 
                FROM Employee
            ) a
            WHERE a.rnk = 2
        )
    END AS SecondHighestSalary
FROM Employee;

-- Another approach would be to use cte
WITH salary_rnk as (
    SELECT *, DENSE_RANK() OVER (order by salary DESC) as rnk
    FROM Employee)

SELECT ( SELECT salary FROM salary_rnk WHERE rnk=2 LIMIT 1) as SecondHighestSalary;