# Write your MySQL query statement below
# SELECT p.product_id, ROUND(SUM(p.price*us.units)/SUM(us.units),2) as average_price FROM Prices as p
# JOIN UnitsSold as us on p.product_id = us.product_id
# where (us.purchase_date BETWEEN p.start_date and p.end_date)  
# Group By p.product_id;

SELECT 
    p.product_id, 
    COALESCE(ROUND(SUM(p.price * us.units) / NULLIF(SUM(us.units), 0), 2), 0) AS average_price
FROM 
    Prices p
LEFT JOIN 
    UnitsSold us ON p.product_id = us.product_id AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 
    p.product_id;

