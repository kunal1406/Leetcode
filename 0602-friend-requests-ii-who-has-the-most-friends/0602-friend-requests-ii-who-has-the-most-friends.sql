# Write your MySQL query statement below


# find the person with most friends 
        # requester id count + accepter_id count

WITH FriendCount AS (
    SELECT 
        requester_id AS id, 
        COUNT(DISTINCT accepter_id) AS num_friends
    FROM 
        RequestAccepted
    GROUP BY 
        requester_id
    UNION ALL
    SELECT 
        accepter_id AS id, 
        COUNT(DISTINCT requester_id) AS num_friends
    FROM 
        RequestAccepted
    GROUP BY 
        accepter_id
),

TotalFriends AS (
    SELECT 
        id, 
        SUM(num_friends) AS total_friends
    FROM 
        FriendCount
    GROUP BY 
        id
)

select id, total_friends as num from TotalFriends
order by total_friends desc limit 1

