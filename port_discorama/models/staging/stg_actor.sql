
with
    actor as (
        select  							
            cast((actor_id) as int) as actor_id
            ,cast((first_name || " " || last_name)as string) as actor_name
            ,cast((last_update) as datetime) as last_update
        from {{ source('discorama','actor') }}
    )
    
select *
from actor