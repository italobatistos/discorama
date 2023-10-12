
with
    store as (
        select  							
            cast(store_id as int) as store_id
            , cast(manager_staff_id as int) as manager_staff_id
            , cast(address_id as int) as address_id
            , cast(last_update as datetime) as last_update
        from {{ source('discorama','store') }}
    )
    
select *
from store