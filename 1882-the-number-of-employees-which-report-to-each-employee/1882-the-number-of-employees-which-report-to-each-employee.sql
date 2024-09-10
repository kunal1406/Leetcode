# Write your MySQL query statement below

# manager >= 1
# names of all managers
# number of employees report directly to them

-- With manager_id as (select count(*) as counts, Round(avg(age), 0) as average, reports_to from Employees
-- group by reports_to 
-- having count(*) >= 1) 

-- select employee_id, name, counts  as reports_count, average as average_age from manager_id m Inner join Employees e on m.reports_to = e.employee_id order by e.employee_id

SELECT 
    e.employee_id,
    e.name,
    COUNT(r.employee_id) AS reports_count,
    ROUND(AVG(r.age)) AS average_age
FROM 
    Employees e
JOIN 
    Employees r ON e.employee_id = r.reports_to
GROUP BY 
    e.employee_id, e.name
ORDER BY 
    e.employee_id;
