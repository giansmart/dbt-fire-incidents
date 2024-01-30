
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

-- {{ config(materialized='table') }}

with incidents as (
    select * from {{ ref("fire_incidents_custom") }}
)

select 
    id as incident_id
    ,address
    ,battalion
    ,incident_date as time_period
    ,neighborhood_district as district
    ,point
from incidents

