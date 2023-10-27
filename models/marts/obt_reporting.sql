{{
    config (
        materialized="<INCREMENTAL MATERIALIZATION TYPE>"
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
{%if <IS INCREMENTAL MACRO>%}
where insertat > (<NESTED QUERY THAT SELECTS THE MAX INSERTAT FROM THIS MODEL>) 
{%endif%}

/*
Use the following query in BigQuery to insert a new record into the source table. Use for testing purpose

INSERT INTO `<YOUR GC PROJECT ID>.<YOUR BIGQUERY RAW DATASET ID>.purchases` 
(_etl_loaded_at, customer_id, purchase_date, purchase_id, purchase_type, quantity, sky_pass_id) 
VALUES (CURRENT_TIMESTAMP(), 1, CURRENT_TIMESTAMP(), <UNIQUE PURCHASE ID NUMBER>, 'credit_card', 1, 2)
*/