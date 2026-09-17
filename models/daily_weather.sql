WITH daily_weather as (
    select 
    date(time) as daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    from {{ source('demo', 'weather')}}
    limit 10

),

daily_weather_agg as (

    select 
    daily_weather,
    weather,
    round(avg(temp),2) AS avg_temp,
    round(avg(pressure),2) AS avg_pressure,
    round(avg(humidity),2) as avg_humidity,
    round(avg(clouds),2) as avg_clouds
    --count(weather),
    --row_number() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc) AS row_number
    from daily_weather
    group by daily_weather, weather
    qualify row_number() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc) = 1
)
select *
from daily_weather_agg