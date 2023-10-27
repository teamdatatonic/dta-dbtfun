{% set purchase_types = dbt_utils.get_column_values(table=<REF TO STG_PURCHASES MODEL>, column='<PURCHASE TYPE COLUMN>')%}
with purchases as (
    select * from {{ref("stg_purchases")}}
),

pivoted as (
    select
      skypassid,
      {%<FOR LOOP CONTROL STATEMENT. ITERATE OVER PURCHASE_TYPES> %}
        sum(case when purchasetype = <VALUE OF PURCHASE> then quantity else 0 end) as <VALUE OF PURCHASE>_quantity,  
      {%<TERMINATE FOOR LOOP STATEMENT>%}
    from 
      purchases
    group by
      1
)

select * from pivoted