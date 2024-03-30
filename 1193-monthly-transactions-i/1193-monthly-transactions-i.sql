# Write your MySQL query statement below


SELECT DATE_FORMAT(trans_date, '%Y-%m') as month,
    country, 
    COUNT(*) as trans_count,
    SUM(state = 'approved') as approved_count,
    SUM(amount) as trans_total_amount ,
    SUM(amount*(CASE WHEN state='approved' THEN 1 ELSE 0 END)) as approved_total_amount 

FROM Transactions
GROUP BY month, country;






















