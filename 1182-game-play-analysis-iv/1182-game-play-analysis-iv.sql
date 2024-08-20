# Write your MySQL query statement below

-- WITH temp as 
-- (select player_id, event_date, LEAD(event_date) OVER(partition by player_id) as next_date from Activity)

-- select ROUND(SUM(IF (event_date + 1 = next_date, 1, 0))/ COUNT( distinct player_id),2) as fraction
-- FROM temp


WITH FirstLogins AS (
    SELECT 
        player_id, 
        MIN(event_date) AS first_login_date
    FROM 
        Activity
    GROUP BY 
        player_id
),

NextDayLogins AS (
    SELECT 
        a.player_id
    FROM 
        Activity a
    WHERE 
        (a.player_id, a.event_date) IN (
            SELECT 
                fl.player_id, 
                DATE_ADD(fl.first_login_date, INTERVAL 1 DAY)
            FROM 
                FirstLogins fl
        )
)

SELECT 
    ROUND(COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM 
    NextDayLogins;
