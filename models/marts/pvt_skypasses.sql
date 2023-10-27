with skypassed as (
    select * from <REF TO STG_SKY_PASSES MODEL>
),

pivoted_table as (
    select * from <REF TO INT_PIVOT_PURCHASE_TYPES MODEL>
),

final as (
    select
        *
    from skypassed
    left join pivoted_table using(skypassid)
)

select * from final