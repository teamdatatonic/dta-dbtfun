{{
    config (
        materialized="table"
    )
}}

with <TMP OBT TABLE NAME> as (
    select
        *
    from
        {{ref("stg_customers")}}
        left join <REF TO INT_CUSTOMERS_USERNAMES MODEL> using(customerid)
        left join {{ref("stg_sky_passes")}} using(skypassid)
)

select * from <TMP OBT TABLE NAME>