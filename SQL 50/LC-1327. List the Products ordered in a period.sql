-- approach -1
SELECT p.product_name, sum(unit) as unit
FROM Products p 
JOIN Orders o 
ON p.product_id = o.product_id
WHERE LEFT(order_date, 7) = '2020-02'
GROUP BY p.product_id
HAVING unit >= 100;

-- approach -2
SELECT p.product_name, sum(o.unit) AS unit
FROM Products p 
JOIN Orders o 
ON p.product_id = o.product_id
WHERE year(order_date)= 2020 AND month(order_date) = 02
GROUP BY p.product_id
HAVING unit >= 100;