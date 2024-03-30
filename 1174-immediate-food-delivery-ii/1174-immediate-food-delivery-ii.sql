# Write your MySQL query statement below
SELECT ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS immediate_percentage
from delivery where (customer_id, order_date) IN
(select customer_id, min(order_date) as first_order
from delivery
group by customer_id)