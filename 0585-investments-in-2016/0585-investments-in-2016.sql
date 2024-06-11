# Write your MySQL query statement below


SELECT ROUND(SUM(tiv_2016), 2) as tiv_2016
FROM
    (SELECT tiv_2015, tiv_2016, lat, lon,
               COUNT(*) OVER (PARTITION BY tiv_2015) AS cnt_tiv_2015,
               COUNT(*) OVER (PARTITION BY lat, lon) AS cnt_location
    FROM Insurance)
    As subquery
where cnt_tiv_2015 > 1 and cnt_location = 1


# {"headers": ["tiv_2015", "tiv_2016", "lat", "lon", "cnt_tiv_2015", "cnt_location"],
# "values": [[10.0, 5.0, 10.0, 10.0, 3, 1], 
#            [10.0, 30.0, 20.0, 20.0, 3, 2], 
#            [20.0, 20.0, 20.0, 20.0, 1, 2], 
#            [10.0, 40.0, 40.0, 40.0, 3, 1]]}