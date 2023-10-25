
with
    
    category as (
        select *
        from{{ ref('stg_category')}}
    )

    , film_category as (
        select *
        from{{ ref('stg_film_category')}}
    )

    , join_film_category as (
        select
           film_category.film_id
           , film_category.category_id
           , category.category_name
        from film_category
        left join category on film_category.category_id = category.category_id
    )

    , transformations as (
        select
            row_number() over (order by film_id) as sk_film
            , *
        from join_film_category
    )

select *
from transformations