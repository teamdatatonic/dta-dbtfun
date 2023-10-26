with customers as (
    select 
        customer_id as customerid,
        first_name as firstname,
        last_name as lastname,
        email,
        phone_number as phonenumber,
        address,
        city,
        state,
        zip_code as zipcode,
        country,
        dob
    from
        <SOURCE FUNCTION THAT INCLUDES SOURCE NAME AND RAW TABLE NAME>
)

select * from customers