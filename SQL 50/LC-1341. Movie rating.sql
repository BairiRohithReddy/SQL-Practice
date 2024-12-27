-- we have to write two separate queries to find 
/*
1.Find the name of the user who has rated the greatest number of movies. 
In case of a tie, return the lexicographically smaller user name.

2. Find the movie name with the highest average rating in February 2020. 
In case of a tie, return the lexicographically smaller movie name.
*/

-- we will write 2 separate queries and then union the results

-- query -1
WITH user_name AS
(SELECT u.name as results
FROM Users u
INNER JOIN MovieRating r
ON u.user_id = r.user_id
GROUP BY u.user_id
ORDER BY COUNT(u.user_id) DESC, u.name
LIMIT 1),

-- query 2
highest_avg_rating AS
(SELECT m.title as results
FROM Movies m 
INNER JOIN MovieRating r 
ON m.movie_id = r.movie_id
WHERE created_at >= '2020-02-01' AND created_at <= '2020-02-29'
GROUP BY m.title
ORDER BY AVG(rating) DESC, m.title
LIMIT 1)

-- fetching the required output by joining the outputs of above 2 queries using union all
SELECT results FROM user_name
UNION ALL
SELECT results FROM highest_avg_rating;