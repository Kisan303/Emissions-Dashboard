-- Emissions Per Person Query
-- Purpose: Calculate per capita emissions by county
-- Used in: Per capita emissions comparison bar chart
-- Note: Handles comma-separated numbers and division by zero

select
    county_state_name,
    population,
    cast(REPLACE(`GHG emissions mtons CO2e`, ',', '') as double) / NULLIF(cast(population as double), 0) as EmissionsPerPerson
from emissions.default.emissions_data
order by emissionsperperson desc
