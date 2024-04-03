# Write your MySQL query statement below
# SELECT class FROM Courses
# where class in (SELECT class, COUNT(DISTINCT student) as cnt
# FROM Courses
# GROUP BY class
# HAVING cnt > 5) 

SELECT class 
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
