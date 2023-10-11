
with
    film_actor as (
        select  							
            cast(actor_id as int) as actor_id
            , cast(film_id as int) as film_id
            , cast(last_update as datetime) as last_update
        from {{ source('discorama','film_actor') }}
    )
    
select *
from film_actor