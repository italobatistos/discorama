
with
    customer as (
        select  							
            cast(customer_id as int) as customer_id
            , cast(store_id as int) as store_id
            , cast((first_name || " " || last_name)as string) as customer_name
            , cast(email as string) as email
            , cast(address_id as int) as address_id
            , cast(activebool as string) as activebool
            , cast(create_date as datetime) as create_date
            , cast(last_update as datetime) as last_update
            , cast(active as int) as active
        from {{ source('discorama','customer') }}
    )
    
select *
from customer