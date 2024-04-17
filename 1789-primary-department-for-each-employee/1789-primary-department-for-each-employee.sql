/* Write your T-SQL query statement below */

SELECT employee_id, department_id FROM Employee
WHERE primary_flag = 'Y'
OR
employee_id in
(select employee_id from Employee GROUP BY employee_id HAVING COUNT(*) = 1)
