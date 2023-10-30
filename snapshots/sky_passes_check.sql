{% snapshot <NAME OF THE SNAPSHOT> %}
    {{
        config(
            target_schema='<TARGET SCHEMA/DATASET NAME IN YOUR DWH>',
            strategy='<USE CHECK STRATEGY>',
            unique_key='<PRIMARY KEY OF THE SOURCE TABLE>',
            check_cols=['<COLUMN NAME TO CHECK>']
        )
    }}

    select * from {{source("<NAME OF THE SOURCE>", "<NAME OF THE TABLE>")}}

{% endsnapshot %}

/*

Use this query to change a sky pass cost in your source table. This is for testing snapshots

UPDATE `<YOUR GC PROJECT ID>.<YOUR SOURCE RAW DATASET>.<YOUR SOURCE TABLE NAME>`
SET cost = <YOUR NEW VALUE>
WHERE sky_pass_id = <ONE OF YOUR SKY PASS IDs>

*/