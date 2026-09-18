WITH BIKE AS (
    select 
    distinct 
  --  STARTED_AT
--ENDED_AT
START_STATIO_ID AS station_id,
START_STATION_NAME AS station_name,

--END_STATION_NAME,
--END_STATION_ID,
START_LAT AS station_lat,
START_LNG AS station_lng,
--END_LAT,
--END_LNG,
--MEMBER_CSUAL,
    FROM {{ ref('stg_bike') }}
    WHERE RIDE_ID != 'bike_id' and RIDE_ID != '"bike_id"'

)
select *
FROM BIKE