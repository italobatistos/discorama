
with
    customer as (
        select *
        from{{ ref('stg_customer')}}
    )

    , address as (
        select *
        from{{ ref('int_address')}}
    )

    , join_customer as (
        select
            customer.store_id
            , customer.customer_id
            , customer.address_id
            , customer.create_date
            , customer.customer_name
            , customer.email
            , address.phone
            , address.country_name
            , address.city_name
            , address.district
            , address.postal_code
            , address.address
            , address.address_additional
            , customer.activebool
            , customer.active
        from customer
        left join address on customer.address_id = address.sk_address
    )

    , transformations as (
        select
            row_number() over (order by store_id) as sk_store
            , *
        from join_customer
    )

select *
from transformations