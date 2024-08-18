# Write your MySQL query statement below

# find confirmation rate = number of times confired/ total number of times requested

With temp as 
(select s.user_id, case when action = "confirmed" then 1 else 0 end as score  from Signups s
left join Confirmations c
on s.user_id = c.user_id)

select user_id, Round(avg(score),2) as confirmation_rate from temp
group by user_id
