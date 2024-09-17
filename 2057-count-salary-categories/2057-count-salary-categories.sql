# Write your MySQL query statement below

WITH CTE AS(
SELECT account_id,
    CASE 
        WHEN income < 20000 THEN "Low Salary"
        WHEN income > 50000 THEN "High Salary"
        ELSE "Average Salary"
    END AS category
FROM Accounts),

CTE_C AS(        
SELECT "Low Salary" AS Category
UNION 
SELECT "Average Salary" AS Category
UNION 
SELECT "High Salary" AS Category
) 

SELECT CTE_C.Category, COUNT(account_id) AS  accounts_count
FROM CTE_C
LEFT JOIN CTE ON CTE_C.Category = CTE.Category
GROUP BY CTE_C.Category

-- Select * from CTE_C left JOIN CTE on CTE_C.Category = CTE.category

