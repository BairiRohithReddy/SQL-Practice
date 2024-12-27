-- SELECT 
-- CASE WHEN income < 20000 THEN 'Low Salary'
-- ELSE WHEN 20000 <= income AND income <= 50000 THEN 'Average Salary'
-- ELSE WHEN income > 50000 THEN 'High Salary'
-- END AS category, COUNT(category) AS accounts_count
-- FROM Accounts
-- GROUP BY category;

SELECT DISTINCT 'Low Salary' AS category, (SELECT COUNT(income) FROM Accounts where income < 20000) AS accounts_count
FROM Accounts
UNION ALL
SELECT DISTINCT 'Average Salary' AS category, (SELECT COUNT(income) FROM Accounts where income >= 20000 AND income <= 50000) AS accounts_count
FROM Accounts
UNION ALL
SELECT DISTINCT 'High Salary' AS category, (SELECT COUNT(income) FROM Accounts where income > 50000) AS accounts_count
FROM Accounts