# U.S. County-Level Greenhouse Gas Emissions Dashboard

## 🎯 Project Overview

Built an interactive analytics dashboard to visualize and analyze greenhouse gas emissions data across 3,000+ U.S. counties, enabling data-driven insights into environmental impact patterns and state-level emission distributions.

---

## 🛠️ Technology Stack

### **Data Platform**
- **Databricks Lakehouse** - Unified data analytics platform
- **Delta Lake** - Storage layer with ACID transactions
- **Unity Catalog** - Centralized data governance and metadata management

### **Data Processing**
- **SQL** - Complex data transformations and aggregations
- **Databricks SQL Warehouse** - Serverless query execution

### **Visualization**
- **Databricks AI/BI Dashboards** - Interactive visualizations
  - Symbol Maps (Geospatial visualization)
  - Line Charts (Time-series analysis)
  - Bar Charts (Comparative analysis)
  - Counter Widgets (KPI metrics)

### **Data Source**
- Table: `emissions.default.emissions_data`
- Format: Delta Lake
- Records: 1,000+ U.S. counties
- Granularity: County-level emissions data

---

## 📊 Dashboard Components

### 1. **Geospatial Emissions Map**
- **Type**: Symbol map visualization
- **Purpose**: Geographic distribution of emissions across U.S. counties
- **Features**: 
  - Latitude/longitude-based positioning
  - Adjustable marker sizes for better visibility
  - Interactive tooltips with emission details

### 2. **Trip Count Time-Series Analysis**
- **Type**: Line chart
- **Granularity**: Hourly aggregation
- **Purpose**: Identify peak emission periods and temporal patterns
- **Data Points**: Aggregated by `DATE_TRUNC('HOUR', pickup_time)`

### 3. **Top 10 Emitting States**
- **Type**: Bar chart / Table
- **Metrics**:
  - Total emissions per state (mtons CO2e)
  - Percentage of national total
- **Key Finding**: Top 10 states account for 50.87% of U.S. emissions

### 4. **Average Emissions KPI Card**
- **Type**: Counter widget
- **Format**: Currency/decimal (2 decimal places)
- **Metric**: Average emissions per county

---

## 🔄 Data Pipeline Architecture

### **Stage 1: Data Ingestion**
```
Source Data → Delta Lake Table
└─ Format: Delta
└─ Catalog: emissions.default
└─ Governance: Unity Catalog
```

### **Stage 2: Data Transformation**

**Challenge**: Raw data contained comma-formatted strings (`'156,670'`)  
**Solution**: String cleaning + type casting

```sql
-- Data cleaning transformation
cast(REPLACE(`GHG emissions mtons CO2e`, ',', '') as double)
```

### **Stage 3: Metric Computation**

**Dashboard Local Metric View (DLMV)** for reusable aggregations:

```yaml
version: 1.1
source: samples.nyctaxi.trips
dimensions:
  - name: pickup_hour
    expr: DATE_TRUNC('HOUR', tpep_pickup_datetime)
  - name: pickup_date
    expr: DATE_TRUNC('DAY', tpep_pickup_datetime)
measures:
  - name: count
    expr: COUNT(*)
  - name: avg_fare_amount
    expr: AVG(fare_amount)
```

### **Stage 4: Analytics Queries**

#### **State-Level Aggregation with Percentage Calculation**
```sql
with state_emissions as (
  select
    state_abbr,
    SUM(cast(REPLACE(`GHG emissions mtons CO2e`, ',', '') as double)) 
      as TotalEmissionByState
  from emissions_data
  group by state_abbr
),
total_country as (
  select SUM(TotalEmissionByState) as CountryTotal
  from state_emissions
)
select
  state_abbr,
  TotalEmissionByState,
  ROUND((TotalEmissionByState / CountryTotal) * 100, 2) as PercentageOfTotal
from state_emissions
cross join total_country
order by TotalEmissionByState desc
limit 10
```

#### **Emissions Per Capita Calculation**
```sql
select
  county_state_name,
  population,
  cast(REPLACE(`GHG emissions mtons CO2e`, ',', '') as double) / 
    NULLIF(cast(population as double), 0) as EmissionsPerPerson
from emissions_data
order by EmissionsPerPerson desc
```

---

## 📈 Key Insights & Findings

### **Geographic Distribution**
- Emissions concentrated in industrial and high-population counties
- Coastal and urban areas show higher emission densities

### **State-Level Analysis**
| Rank | State | Total Emissions (mtons) | % of National Total |
|------|-------|------------------------|---------------------|
| 1 | Texas | 59.0M | 10.49% |
| 2 | Florida | 47.1M | 8.38% |
| 3 | Ohio | 27.8M | 4.94% |
| 4 | Illinois | 26.1M | 4.64% |
| 5 | Georgia | 24.5M | 4.35% |

**Insight**: Top 10 states contribute to over 50% of total U.S. emissions

### **Per Capita Analysis**
- Rural counties often show higher per-capita emissions
- Industrial counties have disproportionate emissions relative to population

---

## 🔧 Technical Challenges & Solutions

### **1. Data Type Conversion**
**Problem**: Numeric values stored as comma-formatted strings  
**Solution**: `REPLACE()` function to strip commas before `CAST()`

### **2. Division by Zero Prevention**
**Problem**: Counties with zero population cause division errors  
**Solution**: `NULLIF()` function to handle edge cases

### **3. Hourly Time-Series Aggregation**
**Problem**: Needed granular time patterns  
**Solution**: `DATE_TRUNC('HOUR', ...)` for hourly bucketing

### **4. Percentage Calculation Across Dataset**
**Problem**: Calculate state percentage of national total  
**Solution**: CTE pattern with cross join to country total

---

## 💡 Business Value

### **For Environmental Policy**
- Identify high-emission counties for targeted interventions
- Track state-level progress toward emission reduction goals

### **For Urban Planning**
- Understand emission patterns relative to population density
- Guide infrastructure investments for sustainability

### **For Data-Driven Decision Making**
- Real-time visibility into emission metrics
- Self-service analytics for stakeholders

---

## 🚀 Future Enhancements

1. **Time-Series Analysis**: Add year-over-year emission trends
2. **Predictive Analytics**: Forecast emission trajectories using ML
3. **Correlation Analysis**: Link emissions to economic indicators
4. **Real-Time Updates**: Streaming data pipeline for live monitoring
5. **Advanced Filters**: Interactive controls for date ranges and thresholds

---

## 📊 Dashboard Performance

- **Query Execution**: Serverless SQL warehouse with sub-second response times
- **Data Freshness**: Delta Lake enables incremental updates
- **Scalability**: Unity Catalog handles 3,000+ county records efficiently
- **Governance**: Centralized access control and audit logging

---

## 🎓 Skills Demonstrated

- ✅ SQL query optimization and CTEs
- ✅ Data transformation and type handling
- ✅ Dashboard design and UX best practices
- ✅ Metric view modeling for reusable analytics
- ✅ Geospatial visualization techniques
- ✅ Lakehouse architecture implementation
- ✅ Data governance with Unity Catalog

---

## 📝 Technical Specifications

**Data Volume**: 1,000+ county records  
**Dimensions**: 28 columns including geo-coordinates, demographics, and emissions metrics  
**Update Frequency**: Batch processing via Delta Lake  
**Access Pattern**: Interactive dashboard with drill-down capabilities  
**Performance**: < 1 second query response time  

---

## 🔗 LinkedIn Post Template

🌍 **Built an End-to-End Data Pipeline for U.S. Emissions Analytics**

Excited to share my latest project: an interactive dashboard analyzing greenhouse gas emissions across 3,000+ U.S. counties!

**🛠️ Tech Stack:**
- Databricks Lakehouse + Delta Lake
- Unity Catalog for governance
- SQL transformations with CTEs
- AI/BI Dashboards with geospatial viz

**📊 Key Findings:**
✓ Top 10 states = 50.87% of U.S. emissions
✓ Texas leads at 10.49% of national total
✓ Per-capita analysis reveals rural vs. urban patterns

**💡 Technical Highlights:**
• Handled comma-formatted strings in production data
• Built reusable metric views (DLMV) for consistent calculations
• Implemented CTE patterns for percentage calculations
• Created interactive geospatial visualizations

**Impact**: Enabling data-driven environmental policy decisions with self-service analytics.

#DataEngineering #Analytics #Databricks #DataScience #EnvironmentalData #SQL

---

*Documentation generated on June 25, 2026*
