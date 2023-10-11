
with
    staff as (
        select  							
            cast(staff_id as int) as staff_id
            , cast((first_name || " " || last_name)as string) as staff_name
            , cast(address_id as int) as address_id
            , cast(email as string) as email
            , cast(store_id as int) as store_id
            , cast(active as string) as active
            , cast(last_update as datetime) as last_update
        from {{ source('discorama','staff') }}
    )
    
select *
from staff