-- Location Data Query
-- Purpose: Visualize emissions by geographic coordinates
-- Used in: Geographic map visualization

select 
    latitude,
    longitude,
    `GHG emissions mtons CO2e` as emissions
from emissions.default.emissions_data
