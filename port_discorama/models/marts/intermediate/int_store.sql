
with
    
    staff as (
        select *
        from{{ ref('stg_staff')}}
    )

    , store as (
        select *
        from{{ ref('stg_store')}}
    )

    , join_store as (
        select
           staff.staff_id
           , store.store_id
           , store.manager_staff_id
           , store.address_id as manager_staff_address_id
           , staff.address_id as staff_address_id
           , staff.staff_name
           , staff.email
           , staff.active
        from store
        left join staff on store.store_id = staff.store_id
    )

    , transformations as (
        select
            row_number() over (order by staff_id) as sk_staff
            , *
        from join_store
    )

select *
from transformations
