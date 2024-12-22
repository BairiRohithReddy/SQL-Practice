# Write your MySQL query statement below
WITH cte as(
    SELECT v.visit_id AS visit_id, v.customer_id AS customer_id, t.transaction_id AS txn_id
    FROM Visits v 
    LEFT JOIN Transactions t 
    ON v.visit_id = t.visit_id
)


SELECT customer_id, COUNT(visit_id) AS count_no_trans
FROM cte
WHERE txn_id IS NULL GROUP BY customer_id;

-- approach 2

SELECT customer_id, COUNT(visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id;