
with
    rental as (
        select  							
            cast(rental_id as int) as rental_id
            , cast(rental_date as datetime) as rental_date
            , cast(inventory_id as int) as inventory_id
            , cast(customer_id as int) as customer_id
            , cast(return_date as datetime) as return_date
            , cast(staff_id as int) as staff_id
            , cast(last_update as datetime) as last_update
        from {{ source('discorama','rental') }}
    )
    
select *
from rental