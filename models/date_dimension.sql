WITH CTE AS (
    select 
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,

    CASE 
    WHEN dayname(TO_TIMESTAMP(STARTED_AT)) IN ('sat', 'sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END AS DAY_TYPE,

    CASE WHEN month(TO_TIMESTAMP(STARTED_AT)) IN (12,1,2)
        THEN 'SPRING'
        WHEN month(TO_TIMESTAMP(STARTED_AT)) IN (6,7,8)
        THEN 'SUMMER'
        ELSE 'AUUMN'
        END AS STATION_OF_YEAR

    from
    {{ source('demo', 'bike') }}
    WHERE STARTED_AT != 'started_at'
)

select
*
from CTE