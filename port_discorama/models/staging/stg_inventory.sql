
with
    inventory as (
        select  							
            cast(inventory_id as int) as inventory_id
            , cast(film_id as int) as film_id
            , cast(store_id as int) as store_id
            , cast(last_update as datetime) as last_update
        from {{ source('discorama','inventory') }}
    )
    
select *
from inventory