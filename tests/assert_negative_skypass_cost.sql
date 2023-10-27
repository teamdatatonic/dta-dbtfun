select
    sky_pass_id
    cost
from
    {{source("<SOURCE NAME>", "sky_passes")}}
where
    <CONDITION TO ASSERT>