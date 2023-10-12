
with
    payment as (
        select  							
            cast(payment_id as int) as payment_id
            , cast(customer_id as int) as customer_id
            , cast(staff_id as int) as staff_id
            , cast(rental_id as int) as rental_id
            , cast(amount as numeric) as amount
            , cast(payment_date as datetime) as payment_date
        from {{ source('discorama','payment') }}
    )
    
select *
from payment