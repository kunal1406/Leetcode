# Write your MySQL query statement below

# cross join the Employee and Department table

-- Select d.name as Department, e.name as Employee, e.salary from Employee e
-- cross join Department d
-- on e.departmentID = d.id

# apply dense rank and give ranking to the employees
With combined as 
(Select d.name as Department, e.name as Employee, e.salary from Employee e
cross join Department d
on e.departmentID = d.id),

ranks as
(select *, dense_rank() over(partition by Department order by salary Desc) as rankings from combined)

Select Department, Employee, salary as Salary from ranks 
where rankings <= 3

# top 3 out of each department