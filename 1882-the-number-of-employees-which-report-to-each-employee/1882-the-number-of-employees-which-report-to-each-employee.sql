# Write your MySQL query statement below

# manager >= 1
# names of all managers
# number of employees report directly to them

With manager_id as (select count(*) as counts, Round(avg(age), 0) as average, reports_to from Employees
group by reports_to 
having count(*) >= 1) 

select employee_id, name, counts  as reports_count, average as average_age from manager_id m Inner join Employees e on m.reports_to = e.employee_id order by e.employee_id