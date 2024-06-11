# Write your MySQL query statement below

# SELECT requester_id, accepter_id, accept_date, COUNT(*) OVER(partition by requester_id) as cnt_req FROM RequestAccepted

# {"headers": ["requester_id", "accepter_id", "accept_date", "cnt_req"]
# , "values": [[1, 2, "2016-06-03", 2],
#              [1, 3, "2016-06-08", 2], 
#              [2, 3, "2016-06-08", 1], 
#              [3, 4, "2016-06-09", 1]]}
             
SELECT  requester_id as id, SUM(cnt_req) as num

FROM            
    (SELECT COUNT(*) as cnt_req, requester_id
    FROM RequestAccepted 
    group by requester_id
    UNION ALL
    SELECT COUNT(*) as cnt_acc, accepter_id  
    FROM RequestAccepted
    group by accepter_id)
    as subquery
    
Group by requester_id 
order by num desc
limit 1


# {"headers": ["cnt_req", "requester_id"], 
# "values": [[2, 1], 
#            [1, 2], 
#            [1, 3], 
#            [1, 2],
#            [2, 3], 
#            [1, 4]]}



# {"headers": ["requester_id", "accepter_id", "accept_date", "COUNT(*)"],
# "values": [[1, 2, "2016-06-03", 2], 
#            [2, 3, "2016-06-08", 1], 
#            [3, 4, "2016-06-09", 1], 
#            [1, 2, "2016-06-03", 1], 
#            [1, 3, "2016-06-08", 2]]}




# {"headers": ["requester_id", "accepter_id", "accept_date", "COUNT(*)"],
# "values": [[1, 2, "2016-06-03", 2], 
#            [2, 3, "2016-06-08", 1], 
#            [3, 4, "2016-06-09", 1]]}