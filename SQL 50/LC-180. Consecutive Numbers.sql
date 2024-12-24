-- This query finds consecutive numbers that appear at least three times in a row in the Logs table.

-- Select distinct numbers that meet the consecutive criteria
SELECT DISTINCT num as ConsecutiveNums 
FROM
    -- Subquery to create a derived table with previous and next numbers
    (SELECT 
        id, 
        num, 
        LAG(num) OVER(ORDER BY id) AS prev_num,  -- Get the previous number
        LEAD(num) OVER(ORDER BY id) AS next_num  -- Get the next number
    FROM Logs) t
-- Filter for numbers that are the same as both their previous and next numbers
WHERE num = prev_num AND num = next_num;
