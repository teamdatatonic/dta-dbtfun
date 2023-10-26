{{
    config (
        materialized="<MATERIALIZATION TYPE>"
    )
}}

with <TMP OBT TABLE NAME> as (
    select
        *
    from
        <REF TO STG_PURCHASES MODEL>
        left join <REF TO STG_CUSTOMERS MODEL> using(customerid)
        left join <REF TO STG_SKY_PASSES MODEL> using(skypassid)
)

select * from <TMP OBT TABLE NAME>