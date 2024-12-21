-- Find the names of the customer that are not referred by the customer with id = 2.
SELECT name
FROM Customer
WHERE referee_id is NULL or referee_id !=2;