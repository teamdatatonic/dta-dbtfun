{% test <NAME OF CUSTOM GENERIC TEST>(model, column_name) %}
with validation as (
    select
        <COLUMN NAME VALUE>
    from
        <MODEL VALUE>
    where 
        not regexp_contains(<COLUMN NAME VALUE>, r'@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+')
)

select * from validation
{% endtest %}