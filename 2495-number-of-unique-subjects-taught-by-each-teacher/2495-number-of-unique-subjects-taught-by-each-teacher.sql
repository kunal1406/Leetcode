# Write your MySQL query statement below
Select teacher_id, Count(distinct subject_id) as cnt from Teacher
group by teacher_id
order by teacher_id