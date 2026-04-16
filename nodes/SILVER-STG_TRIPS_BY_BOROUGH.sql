@id("stg-trips-by-borough-001")
@nodeType("96da6079-287d-47d3-bcea-9b94eb08ff12")
SELECT
    l.BOROUGH,
    COUNT(*)                        AS TRIP_COUNT,
    SUM(t.TOTAL_AMOUNT)             AS TOTAL_REVENUE,
    SUM(t.FARE_AMOUNT)              AS TOTAL_FARE,
    SUM(t.TIP_AMOUNT)               AS TOTAL_TIPS,
    AVG(t.TRIP_DISTANCE)            AS AVG_TRIP_DISTANCE,
    SUM(t.PASSENGER_COUNT)          AS TOTAL_PASSENGERS
FROM {{ ref("BRONZE", "YELLOW_CAB_TRIPS") }} t
JOIN {{ ref("BRONZE", "LOCATION") }} l
    ON t.PU_LOCATION_ID = l.LOCATION_ID
GROUP BY l.BOROUGH
