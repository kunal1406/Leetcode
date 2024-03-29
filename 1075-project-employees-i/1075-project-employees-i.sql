# Write your MySQL query statement below
SELECT p.project_id, ROUND(AVG(e.experience_years),2) as average_years FROM Project as p LEFT JOIN Employee as e on p.employee_id = e.employee_id
GROUP BY p.project_id


# {"headers": ["project_id", "employee_id", "employee_id", "name", "experience_years"],
# "values": [[1, 1, 1, "Khaled", 3],
#            [1, 2, 2, "Ali", 2],
#            [1, 3, 3, "John", 1],
#            [2, 1, 1, "Khaled", 3], 
#            [2, 4, 4, "Doe", 2]]}