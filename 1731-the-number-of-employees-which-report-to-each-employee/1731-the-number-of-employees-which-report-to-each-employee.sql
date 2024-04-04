# Write your MySQL query statement below
SELECT e.employee_id, e.name, sj.reports_count, sj.average_age FROM Employees as e
join (SELECT reports_to, COUNT(*) as reports_count, ROUND(AVG(age)) as average_age FROM Employees GROUP BY reports_to) as sj
on e.employee_id = sj.reports_to
ORDER BY e.employee_id