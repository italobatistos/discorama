
with
    film as (
        select  							
            cast(film_id as int) as film_id
            , cast(title as string) as title
            , cast(description as string) as description
            , cast(release_year as int) as release_year
            , cast(language_id as int) as language_id
            , cast(rental_duration as int) as rental_duration
            , cast(rental_rate as numeric) as rental_rate
            , cast(length as int) as length
            , cast(replacement_cost as numeric) as replacement_cost
            , cast(rating as string) as rating
            , cast(last_update as datetime) as last_update
            , cast(special_features as string) as special_features
            , cast(fulltext as string) as fulltext
        from {{ source('discorama','film') }}
    )
    
select *
from film