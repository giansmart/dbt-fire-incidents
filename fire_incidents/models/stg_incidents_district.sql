
with stg_incidents as (
    select * from {{ ref("stg_incidents") }}
)

select 
	district
	,count(incident_id) times_happened
	,to_char(min(time_period), 'yyyy/mm/dd') as first_fire
	,to_char(max(time_period), 'yyyy/mm/dd') as last_fire
from stg_incidents
group by district