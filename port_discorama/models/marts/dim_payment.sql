
with
    rental as (
        select *
        from{{ ref('stg_rental')}}
    )
    
    , payment as (
        select *
        from{{ ref('stg_payment')}}
    )

    , store as (
        select *
        from{{ ref('int_store')}}
    )

    , join_payment as (
        select
           payment.payment_id
           , rental.inventory_id
           , payment.rental_id
           , payment.customer_id
           , store.store_id
           , store.manager_staff_id
           , payment.staff_id
           , store.staff_name
           , store.email
           , payment.payment_date
           , rental.rental_date
           , rental.return_date
           , payment.amount
           , store.active as staff_active
        from payment
        inner join rental on payment.rental_id = rental.rental_id
        left join store on payment.staff_id = store.sk_staff
    )
    , transformations as (
        select
            row_number() over (order by payment_id) as sk_payment
            , *
            , date_diff(return_date, rental_date, day) AS delay_rental_days
        from join_payment
    )

select *
from transformations