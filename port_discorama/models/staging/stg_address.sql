
with
    address as (
        select  							
            cast(address.address_id as INT64) as address_id
            , cast(city_id as int) as city_id
            , cast(address.address as string) as address
            , cast(address.address2 as string) as address_additional
            , cast(district as string) as district
            , cast(postal_code as int) as postal_code
            , cast(phone as int) as phone
            , cast(last_update as datetime) as last_update
        from {{ source('discorama','address') }}
    )
    
select *
from address