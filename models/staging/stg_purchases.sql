with purchases as (
    select 
        purchase_id as purchaseid,
        customer_id as customerid,
        sky_pass_id as skypassid,
        purchase_date as purchasedate,
        purchase_type as purchasetype,
        _etl_loaded_at as insertat,
        quantity
    from
        <SOURCE FUNCTION THAT INCLUDES SOURCE NAME AND RAW TABLE NAME>
)

select * from purchases