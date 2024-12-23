-- approach -1
select 
query_name,
round( sum(rating * 1.0 /position)/count(*),2)
as quality,

round(sum(case when rating < 3 then 1 else 0 end)*100.0 /count(*),2)
as poor_query_percentage

from queries
group by query_name;

-- approach -2 
SELECT query_name, 
round(AVG(rating/position),2) AS quality,
round(AVG(rating<3) * 100,2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

