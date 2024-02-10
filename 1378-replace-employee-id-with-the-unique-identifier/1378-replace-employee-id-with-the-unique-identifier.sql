# Write your MySQL query statement below
Select unique_id, name FROM Employees as E
LEFT JOIN EmployeeUNI as EU ON EU.id = E.id; 