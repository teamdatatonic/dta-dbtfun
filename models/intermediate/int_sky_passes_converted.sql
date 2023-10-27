with converted as (
    select
        *,
        {{<NAME OF MACRO>(<COST IN POUNDS VALUE>, <EURO PARAM VALUE>)}} as EURO,
        {{<NAME OF MACRO>(<COST IN POUNDS VALUE>, <JPY PARAM VALUE>)}} as JPY,
        {{<NAME OF MACRO>(<COST IN POUNDS VALUE>, <USD PARAM VALUE>)}} as USD,
    from
        {{ref("stg_sky_passes")}}
)

select * from converted