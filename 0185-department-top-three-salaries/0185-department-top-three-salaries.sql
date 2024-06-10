# Write your MySQL query statement below

SELECT Department, name as Employee, salary as Salary FROM

(SELECT E.id, E.name, E.salary, D.name As Department, DENSE_RANK() over (partition by E.departmentId ORDER BY E.salary DESC) As salary_rank
FROM Employee E
Join Department D on E.departmentId = D.id)  as RankedSalaries

WHERE salary_rank <= 3
