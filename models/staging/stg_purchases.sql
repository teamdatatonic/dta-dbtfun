with <TMP_TABLE_NAME> as (
    select 
        purchase_id as <NEW PURCHASE ID ALIAS>,
        customer_id as <NEW CUSTOMER ID ALIAS>,
        sky_pass_id as <NEW SKY PASS ID ALIAS>,
        purchase_date as <NEW PURCHASE DATE ALIAS>,
        purchase_type as <NEW PURCHASE TYPE ALIAS>,
        _etl_loaded_at as <NEW ETL LOADED AT ALIAS>,
        quantity
    from
        <DATABASE OR PROJECT ID>.<SCHEMA OR DATASET>.<TABLE NAME>
)

select * from <TMP_TABLE_NAME>