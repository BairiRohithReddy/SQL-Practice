SELECT *
FROM Users
WHERE mail LIKE "[a-zA-Z]%"
AND mail NOT LIKE "%#%"
AND mail LIKE "%@leetcode.com";