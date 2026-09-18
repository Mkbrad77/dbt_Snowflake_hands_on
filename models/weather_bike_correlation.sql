WITH CTE AS (
    select 
    t.*,
    w.*,
    FROM {{ ref('trip_fact') }} AS t
    left join {{ ref('daily_weather') }} AS w
    on t.TRIP_DATE = w.DAILY_WEATHER
)

select *
From CTE