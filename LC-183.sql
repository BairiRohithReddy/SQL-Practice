-- # Write your MySQL query statement below
-- select name as Customers from
-- Customers
-- where id NOT IN
-- (select c.id
-- FROM Customers as c
-- inner join Orders o
-- on c.id = o.customerId)

select c.name as Customers from Customers c
left join Orders o
on c.id = o.customerId
where o.id is null;