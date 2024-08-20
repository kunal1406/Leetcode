# Write your MySQL query statement below

# percentage of immediate orders in the first orders all customers

    # immediate orders- order date = customer's preferred delivery date
    # First order- order with earliest order date
    # first order of the customers ---> immediate orders/ total orders

WITH first_orders as 

(Select  customer_id, dense_rank() over(partition by customer_id order by order_date) as ranks,
        order_date,
        customer_pref_delivery_date
from Delivery)

SELECT
    ROUND(
        100.0 * SUM(IF( order_date = customer_pref_delivery_date, 1 , 0 )) / COUNT(*),
        2
    ) AS immediate_percentage
FROM
    first_orders
WHERE
    ranks = 1