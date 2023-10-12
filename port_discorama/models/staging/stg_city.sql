
with
    city as (
        select  							
            cast(city_id as INT64) as city_id
            , cast(country_id as INT64) as country_id
            , cast(city.city as string) as city_name
            , cast(last_update as datetime) as last_update
        from {{ source('discorama','city') }}
    )
    
select *
from city