with sky_passes as (
    select 
        sky_pass_id as skypassid,
        sky_pass_type as skypasstype,
        sky_pass_description as skypassdesc,
        cost
    from
        <SOURCE FUNCTION THAT INCLUDES SOURCE NAME AND RAW TABLE NAME>
)

select * from sky_passes