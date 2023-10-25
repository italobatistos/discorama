
with
    customer as (
        select *
        from{{ ref('dim_customer')}}
    )
    
    , inventory as (
        select *
        from{{ ref('dim_inventory')}}
    )

    , payment as (
        select *
        from{{ ref('dim_payment')}}
    )
    
    , join_rental as (
        select
            payment.sk_payment
            , inventory.store_id
            , customer.sk_store
            , payment.manager_staff_id
            , payment.staff_id
            , inventory.inventory_id
            , inventory.film_id
            , payment.rental_id
            , payment.payment_id
            , payment.customer_id
            , customer.address_id
            , payment.staff_name
            , payment.email as staff_email
            , payment.staff_active
            , customer.create_date
            , customer.customer_name
            , customer.email as customer_email
            , customer.phone as customer_phone
            , customer.country_name
            , customer.city_name
            , customer.district
            , customer.postal_code
            , customer.address as customer_address
            , customer.address_additional as customer_address_additional
            , customer.active as customer_active
            , inventory.title as film_title
            , inventory.category_name as film_category
            , inventory.release_year as film_release_year
            , inventory.description as film_description
            , inventory.actor_list as film_actor_list
            , inventory.special_features
            , inventory.rating
            , inventory.language_id
            , inventory.length
            , inventory.replacement_cost
            , inventory.rental_duration
            , inventory.rental_rate
            , payment.delay_rental_days
            , payment.amount
            , payment.payment_date
            , payment.rental_date
            , payment.return_date
        from payment
        left join inventory on payment.inventory_id = inventory.inventory_id
        inner join customer on payment.customer_id = customer.customer_id

    )

    , transformations as (
        select
             *
            , cast((amount - rental_rate) as numeric) as amount_delay_tax
        from join_rental
    )

select *
from transformations