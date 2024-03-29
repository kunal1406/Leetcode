# Write your MySQL query statement below
SELECT *
FROM Cinema
WHERE description NOT LIKE '%boring%' and id%2=1 
ORDER By rating DESC;
