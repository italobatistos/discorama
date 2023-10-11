
with
    country as (
        select  							
            cast(country_id as INT64) as country_id
            , cast(country.country as string) as country_name
            , cast(last_update as datetime) as last_update
        from {{ source('discorama','country') }}
    )
    
select *
from country