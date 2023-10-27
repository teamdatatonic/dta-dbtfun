{{
    config (
        materialized="incremental",
        unique_key="<PURCHASE ID PRIMARY KEY IN OBT TABLE>"
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
where insertat > (select <BIGQUERY TIMESTAMP SUB FUNCTION>(max(insertat), interval <N OF DAYS> day) from {{this}}) 
{%endif%}

/*
Use the following query in BigQuery to insert two records into the source table. Use for testing purpose

INSERT INTO `<YOUR GC PROJECT ID>.<RAW DATASET ID>.purchases` (_etl_loaded_at, customer_id, purchase_date, purchase_id, purchase_type, quantity, sky_pass_id) 
VALUES (CURRENT_TIMESTAMP(), 1, CURRENT_TIMESTAMP(), <NEW PURCHASE ID>, 'credit_card', 1, 3);

INSERT INTO `<YOUR GC PROJECT ID>.<RAW DATASET ID>.purchases` (_etl_loaded_at, customer_id, purchase_date, purchase_id, purchase_type, quantity, sky_pass_id) 
VALUES (TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 DAY), 1, CURRENT_TIMESTAMP(), <NEW PURCHASE ID>, 'credit_card', 1, 3)
*/