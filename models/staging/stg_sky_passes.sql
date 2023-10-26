with <TMP_TABLE_NAME> as (
    select 
        sky_pass_id as <NEW SKY PASS ID ALIAS>,
        sky_pass_type as <NEW SKY PASS TYPE ALIAS>,
        sky_pass_description as <NEW SKY PASS DESC ALIAS>,
        cost
    from
        <DATABASE OR PROJECT ID>.<SCHEMA OR DATASET>.<TABLE NAME>
)

select * from <TMP_TABLE_NAME>