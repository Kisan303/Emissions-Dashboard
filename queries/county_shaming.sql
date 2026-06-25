-- County Shaming Query
-- Purpose: Identify counties with highest total emissions (top 10)
-- Used in: Top 10 counties bar chart

select 
    county_state_name,
    population,
    cast(replace(`GHG emissions mtons CO2e`, ',', '') as double) as Total_Emissions
from emissions.default.emissions_data
order by Total_Emissions desc
limit 10
