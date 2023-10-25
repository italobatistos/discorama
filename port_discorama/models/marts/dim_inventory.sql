
with
    actor as (
        select *
        from{{ ref('stg_actor')}}
    )

    , film as (
        select *
        from{{ ref('stg_film')}}
    )

    , film_actor as (
        select *
        from{{ ref('stg_film_actor')}}
    )

    , film_category as (
        select *
        from{{ ref('int_film_category')}}
    )

    , inventory as (
        select *
        from{{ ref('stg_inventory')}}
    )

    , join_actor_film as (
        select
           inventory.inventory_id
           , inventory.store_id
           , film_actor.film_id
           , film.title
           , film_category.category_name
           , film.release_year
           , film.description
           , string_agg(actor.actor_name, ', ') as actor_list
           , film.language_id
           , film.rental_duration
           , film.rental_rate
           , film.length
           , film.replacement_cost
           , film.rating
           , film.special_features
        from film_actor
        left join film on film_actor.film_id = film.film_id
        left join actor on film_actor.actor_id = actor.actor_id
        left join film_category on film_actor.film_id = film_category.sk_film
        inner join inventory on film_actor.film_id = inventory.film_id
        group by film_actor.film_id, film.title, film.description, film.release_year, film.language_id, film.rental_duration, film.rental_rate, film.length, film.replacement_cost, film.rating, film.special_features, film_category.category_name,inventory.inventory_id, inventory.store_id
    )

    , transformations as (
        select
            row_number() over (order by film_id) as sk_film_id
            , *
        from join_actor_film
    )

select *
from transformations