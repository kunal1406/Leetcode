# have same tiv_2015 value
# not located in same city

WITH tiv2015_dups AS (
    -- Identify policies that have the same tiv_2015 as at least one other policy
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
),
unique_location_policies AS (
    -- Identify policies with unique (lat, lon) combinations
    SELECT pid, tiv_2016
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
),
eligible_policies AS (
    -- Select policies that meet both criteria
    SELECT ulp.tiv_2016
    FROM unique_location_policies ulp
    JOIN Insurance i ON ulp.pid = i.pid
    WHERE i.tiv_2015 IN (SELECT tiv_2015 FROM tiv2015_dups)
)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM eligible_policies
