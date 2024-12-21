/*
Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
here we have two tables product(product_id, product_name) and Sales(sale_id, product_id, year, quantity, price)
*/
SELECT p.product_name, s.year, s.price
FROM Sales s
LEFT JOIN Product p
ON s.product_id = p.product_id;