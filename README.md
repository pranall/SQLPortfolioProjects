# SQLPortfolioProjects
Hello! This repository contains all the projects I did using SQL. 

**COVID-19 Data Exploration using SQL**

This project involved performing extensive SQL-based data analysis on COVID-19 datasets to uncover global and country-level insights about cases, deaths, and vaccinations. The work demonstrates data cleaning, transformation, and analytical querying using advanced SQL operations such as **aggregations, window functions, CTEs, temporary tables, and views**. Two CSV files were used namely CovidDeaths.csv and CovidVaccinations.csv which are uploaded along with the query file. SQL server management studio is used in this project

---

### **Implemented Queries (12 Total)**

1. **Initial Data Exploration**
   Extracted all non-null continental records to verify dataset integrity and exclude aggregated “World” or blank entries.
   *Key concept:* Filtering and ordering data for preliminary inspection.

2. **Selecting Core Analytical Columns**
   Chose essential fields `location`, `date`, `total_cases`, `new_cases`, `total_deaths`, and `population` — to form a working dataset.
   *Key concept:* Column selection and dataset preparation for time-series analysis.

3. **Total Cases vs Total Deaths (Country-level Mortality Rate)**
   Computed the death percentage per day for a selected country (India).
   *Key concept:* Arithmetic operations with type conversion and division safety using `NULLIF()`.

4. **Total Cases vs Population (Infection Percentage)**
   Calculated the proportion of population infected over time by dividing total cases by population.
   *Key concept:* Normalization of data to enable fair cross-country comparisons.

5. **Highest Infection Rate per Population (By Country)**
   Determined which countries had the largest infection rates relative to population size.
   *Key concept:* Aggregation with `MAX()` and grouping logic.

6. **Highest Death Count (By Country)**
   Identified countries with the highest total deaths due to COVID-19.
   *Key concept:* Grouped aggregation and sorting for top-level summaries.

7. **Global Numbers (Over Time)**
   Summed up total global cases and deaths per date, then calculated global death percentage.
   *Key concept:* Summation with grouped daily trends for global insight.

8. **Population vs Vaccinations (Rolling Sum)**
   Joined death and vaccination datasets to compute cumulative vaccination counts for each country.
   *Key concept:* Window functions (`SUM() OVER(PARTITION BY ...)`) and multi-table joins.

9. **CTE for Percent Vaccinated**
   Used a Common Table Expression to compute rolling vaccinations and percent vaccinated per country.
   *Key concept:* CTE for structured stepwise computation and readability.

10. **Temporary Table for Vaccination Calculations**
    Replicated the CTE logic using a temporary table to persist intermediate results.
    *Key concept:* Temporary storage for reusability and modular analysis.

11. **View Creation for Visualization**
    Created a reusable SQL View (`PercentPopulationVaccinated`) for direct integration with visualization tools.
    *Key concept:* Encapsulation of analytical logic into a view for external querying.

12. **Final Data Retrieval**
    Queried the created view to verify stored data and prepare it for visualization platforms like Power BI or Tableau.
    *Key concept:* Validation and visualization readiness.

---

### **Failed Snippets and Debugging Insights**

**Failed Snippet 1 — Death Percentage Calculation Error**

```sql
Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Order by 1,2;
```

**Issue:** `total_cases` and `total_deaths` were stored as `VARCHAR`, preventing arithmetic operations.
**Fix:** Convert to numeric types using `CONVERT(float, ...)` and handle division by zero using `NULLIF()`.
**Lesson Learned:** Always validate data types before performing numeric calculations; conversions or schema updates may be necessary.

---

**Failed Snippet 2 — Incorrect Exclusion of Aggregate Rows**

```sql
Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is not null
Group by location
Order by TotalDeathCount desc;
```

**Issue:** Some aggregated rows (like “World” or “Asia”) had empty strings (`''`) instead of `NULL` in the `continent` field, causing them to pass the filter.
**Fix:** Exclude both null and empty strings with:

```sql
WHERE continent IS NOT NULL AND continent <> '';
```

**Lesson Learned:** Cleaning and verifying categorical data consistency is crucial for accurate grouping and filtering.

---

### **What Was Learned and Demonstrated**

* **Data Cleaning and Validation:** Identified and corrected issues with nulls, text types, and inconsistent entries.
* **SQL Joins and Aggregations:** Combined multiple datasets to derive insights across related attributes.
* **Analytical Computation:** Applied ratios, percentages, and rolling sums to understand trends and progressions.
* **Advanced SQL Constructs:** Used `CTE`, `TEMP TABLE`, and `VIEW` for modular, scalable query design.
* **Performance-Aware Query Design:** Avoided repeated computation by leveraging cumulative windows and reusability through views.
* **Visualization Preparation:** Created clean, ready-to-use data structures for BI tools.

---

**Overall Summary:**
The project delivers a complete end-to-end SQL-based exploration of global COVID-19 data. It transitions from raw data inspection to advanced analytical modeling and storage optimization. Through debugging, data type handling, and query design, this project showcases proficiency in **data analysis, query optimization, and database engineering fundamentals**, forming a strong analytical foundation for any data-driven role.

