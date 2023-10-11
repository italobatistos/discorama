
with
    category as (
        select  							
            cast(category_id as int) as category_id
            , cast(name as string) as category_name
            , cast(last_update as datetime) as last_update
        from {{ source('discorama','category') }}
    )
    
select *
from category