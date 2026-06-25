-- Emissions Per State Query
-- Purpose: Aggregate total emissions by state (top 10)
-- Used in: Top 10 states bar chart

select
  state_abbr,
  SUM(cast(REPLACE(`GHG emissions mtons CO2e`, ',', '') as double)) as TotalEmissionByState
from
  emissions.default.emissions_data
group by
  state_abbr
order by
  TotalEmissionByState desc
limit 10
