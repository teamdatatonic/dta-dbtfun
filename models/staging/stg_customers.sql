with <TMP_TABLE_NAME> as (
    select 
        customer_id as <NEW CUSTOMER ID ALIAS>,
        first_name as <NEW FIRSTNAME ALIAS>,
        last_name as <NEW LASTNAME ID ALIAS>,
        email,
        phone_number as <NEW PHONE NUMBER ALIAS>,
        address,
        city,
        state,
        zip_code as <NEW ZIP CODE ALIAS>,
        country,
        dob
    from
        <DATABASE OR PROJECT ID>.<SCHEMA OR DATASET>.<TABLE NAME>
)

select * from <TMP_TABLE_NAME>