# Write your MySQL query statement below
select DATE_FORMAT(trans_date, '%Y-%m') as month,
       country,
       count(id) as trans_count, 
       SUM(If(State = 'approved', 1, 0)) as approved_count,
       SUM(amount) as trans_total_amount,
       SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount


from Transactions
group by country, month
ORDER BY month, country;