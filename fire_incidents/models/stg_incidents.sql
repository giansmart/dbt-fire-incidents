
-- {{ config(materialized='table') }}

with incidents as (
    select * from {{ ref("fire_incidents_raw") }}
)

select 
    id as incident_id
    ,address
    ,battalion
    ,incident_date as time_period
    ,neighborhood_district as district
    ,point
from incidents

