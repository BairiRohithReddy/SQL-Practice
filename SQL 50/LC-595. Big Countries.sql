/*
A country is big if:

it has an area of at least three million (i.e., 3000000 km2), or
it has a population of at least twenty-five million (i.e., 25000000).

Write a solution to find the name, population, and area of the big countries.
*/
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;