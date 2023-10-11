
with
    film_category as (
        select  							
            cast(film_id as int) as film_id
            , cast(category_id as int) as category_id
            , cast(last_update as datetime) as last_update
        from {{ source('discorama','film_category') }}
    )
    
select *
from film_category