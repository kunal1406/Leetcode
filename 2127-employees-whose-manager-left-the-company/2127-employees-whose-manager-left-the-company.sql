# Write your MySQL query statement below
-- Select employee_id from Employees 
-- where salary < 30000 and manager_id not in (select employee_id from Employees)
-- order by employee_id

SELECT e1.employee_id
FROM Employees e1
LEFT JOIN Employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.salary < 30000 AND e2.employee_id IS NULL AND e1.manager_id IS NOT NULL
ORDER BY employee_id;