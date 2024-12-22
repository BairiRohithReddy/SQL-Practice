SELECT a.id AS id 
FROM Weather a, Weather b
WHERE datediff(a.recordDate, b.recordDate) = 1 AND a.temperature > b.temperature;

--approach 2 using LAG() window function along with cte
WITH WeatherCompare AS (
    SELECT 
        id,
        temperature,
        recordDate,
        LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
        LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM Weather
)
SELECT id
FROM WeatherCompare
WHERE temperature > prev_temp 
  AND DATEDIFF(recordDate, prev_date) = 1;
