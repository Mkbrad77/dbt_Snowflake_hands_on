WITH BIKE AS (

    SELECT
        RIDE_ID,

        REPLACE(STARTED_AT, '"', '') AS STARTED_AT,

        REPLACE(ENDED_AT, '"', '') AS ENDED_AT,

        START_STATION_NAME,
        START_STATIO_ID,
        END_STATION_NAME,
        END_STATION_ID,

        START_LAT,
        START_LNG,
        END_LAT,
        END_LNG,

        MEMBER_CSUAL

    FROM {{ source('demo', 'bike') }}

    WHERE
        LOWER(TRIM(REPLACE(RIDE_ID, '"', ''))) != 'bike_id'

        AND TRY_TO_TIMESTAMP(
            TRIM(REPLACE(STARTED_AT, '"', ''))
        ) IS NOT NULL

        AND TRY_TO_TIMESTAMP(
            TRIM(REPLACE(ENDED_AT, '"', ''))
        ) IS NOT NULL

)

SELECT *
FROM BIKE