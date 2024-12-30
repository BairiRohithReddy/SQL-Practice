-- Approach 1: Using CTE

WITH cte AS (
  SELECT machine_id, process_id, MIN(timestamp) as start_time, MAX(timestamp) as end_time
  FROM Activity
  GROUP BY machine_id, process_id
)

SELECT machine_id, ROUND(AVG(end_time - start_time), 3) as processing_time
FROM cte 
GROUP BY machine_id;


-- Approach 2: Using JOIN

SELECT a1.machine_id, ROUND(AVG(a2.timestamp - a1.timestamp), 3) as processing_time
FROM Activity a1
JOIN Activity a2
  ON a1.machine_id = a2.machine_id 
  AND a1.process_id = a2.process_id
  AND a1.activity_type = 'start' 
  AND a2.activity_type = 'end'
GROUP BY a1.machine_id;


-- Approach 3: Using PIVOT

SELECT 
  machine_id, 
  ROUND(AVG(end_time - start_time), 3) as processing_time
FROM (
  SELECT 
    machine_id, 
    process_id,
    MAX(CASE WHEN activity_type = 'start' THEN timestamp END) as start_time,
    MAX(CASE WHEN activity_type = 'end' THEN timestamp END) as end_time
  FROM Activity
  GROUP BY machine_id, process_id
) pivoted
GROUP BY machine_id;

/*
This query uses a subquery to pivot the data, creating start_time and end_time columns. Then it calculates the average 
processing time for each machine.

All three approaches are valid and will produce the same result. The choice between them depends on factors like:

1. **Readability**: The CTE approach might be more readable for complex queries.
2. **Performance**: The JOIN approach might be faster in some databases.
3. **Flexibility**: The PIVOT approach can be more flexible if you need to add more activity types in the future.

In terms of efficiency, the CTE and PIVOT approaches are likely to be slightly more efficient as they only need to scan the 
table once, while the JOIN approach requires a self-join. However, the actual performance may vary depending on your specific database system and the size of your data.
*/