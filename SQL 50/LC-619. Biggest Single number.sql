SELECT max(num) AS num FROM
(SELECT num, count(*) AS cnt
FROM MyNumbers
GROUP BY num) t
WHERE cnt = 1;