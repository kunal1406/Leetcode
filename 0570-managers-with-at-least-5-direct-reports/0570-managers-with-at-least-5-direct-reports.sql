# Write your MySQL query statement below
Select name from Employee E
where E.id IN (
    select managerID 
    from Employee 
    group by managerID
    having count(id) >= 5
);