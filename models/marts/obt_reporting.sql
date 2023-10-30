{{
    config (
        materialized="incremental",
        unique_key="purchaseid",
        partition_by={"field":"<PARTITION FIELD>", "data_type":"<FIELD DATA TYPE>"},
        incremental_strategy="<INCREMENTAL STRATEGY NAME>"
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

select 
    * 
from 
    <TMP OBT TABLE NAME>
{%if is_incremental()%}
where insertat > (select timestamp_sub(max(insertat), interval 3 day) from {{this}}) 
{%endif%}

/*
Use the following query in BigQuery to insert one records into the source table. Use for testing purpose

INSERT INTO `<YOUR GC PROJECT ID>.<RAW DATASET ID>.purchases` (_etl_loaded_at, customer_id, purchase_date, purchase_id, purchase_type, quantity, sky_pass_id) 
VALUES (CURRENT_TIMESTAMP(), 1, CURRENT_TIMESTAMP(), <NEW PURCHASE ID>, 'credit_card', 1, 3);

*/