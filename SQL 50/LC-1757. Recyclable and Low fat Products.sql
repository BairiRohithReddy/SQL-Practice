-- find the ids of the products that are both low fat and recyclable
SELECT product_id
FROM Products
WHERE low_fats = 'Y' and recyclable = 'Y';