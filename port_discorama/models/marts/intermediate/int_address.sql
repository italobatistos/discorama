
with
    city as (
        select *
        from{{ ref('stg_city')}}
    )

    , address as (
        select *
        from{{ ref('stg_address')}}
    )

    , country as (
        select *
        from{{ ref('stg_country')}}
    )

    , join_address as (
        select
            address.address_id
            , country.country_id
            , city.city_id
            , country.country_name
            , city.city_name
            , address.district
            , address.postal_code
            , address.address
            , address.address_additional
            , address.phone
        from city
        left join address on city.city_id = address.city_id
        left join country on city.country_id = country.country_id
    )

    , transformations as (
        select
            row_number() over (order by address_id) as sk_address
            , *
        from join_address
    )

select *
from transformations