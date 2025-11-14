--Query 1
SELECT * 
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 3,4
/* 
This query retrieves all columns (`*`) from the table `CovidDeaths` in the `PortfolioProject` database.
It filters out rows where the `continent` field is `NULL`, ensuring only records representing actual countries or regions are included (since global or aggregate entries often have null continents).
Finally, it orders the results by the 3rd and 4th columns, which are likely `location` and `date`, so the data appears chronologically by country.
Used as an initial data exploration step to inspect raw COVID-19 death data while excluding global or irrelevant summary rows. It sets up a clean base for later analysis and visualization.
*/

-- Query 2: Select data which we're going to use
SELECT location, date, total_cases,new_cases,total_deaths,population
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 1,2
/*
This query selects key analytical columns `location`, `date`, `total_cases`, `new_cases`, `total_deaths`, and `population` from the `CovidDeaths` table.
The `WHERE continent IS NOT NULL` condition filters out summary rows (like “World” or “High income”).
The `ORDER BY 1,2` arranges results first by `location` and then by `date`, making trends over time for each country easy to observe.
This forms the foundational dataset for country-wise time-series analysis of COVID-19 impact, enabling further computations such as infection rates, death percentages, and comparative studies across populations.
*/

-- Query 3: Looking at total cases vs total deaths
SELECT location, date, total_cases,total_deaths,
(CONVERT(float, total_deaths) / NULLIF(CONVERT(float, total_cases), 0)) * 100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location like '%India%' and continent is not null
ORDER BY 1,2
/*
This query calculates the death percentage for COVID-19 in India.
It selects `location`, `date`, `total_cases`, and `total_deaths`, then computes the ratio of deaths to cases multiplied by 100.
`CONVERT(float, …)` ensures accurate division, and `NULLIF(total_cases, 0)` prevents division by zero errors.
The `WHERE location LIKE '%India%'` filter isolates India’s data, and `ORDER BY 1,2` arranges it chronologically.
This analysis highlights how deadly COVID-19 was in a given country over time, offering insight into public health outcomes, healthcare capacity, and the effectiveness of interventions like lockdowns and vaccination drives.
*/

-- Query 4: Total Cases vs Population
SELECT location, date, total_cases,population,
(CONVERT(float, total_cases) / NULLIF(CONVERT(float, population), 0)) * 100 AS PercentageOfPopulationInfected
FROM PortfolioProject..CovidDeaths
--Where location like '%India%' and continent is not null
ORDER BY 1,2
/*
This query computes what percentage of each country’s population was infected with COVID-19 over time.
It retrieves `location`, `date`, `total_cases`, and `population`, then divides `total_cases` by `population`, multiplying by 100 for a percentage.
`CONVERT(float, …)` ensures numeric precision, and `NULLIF(population, 0)` avoids division by zero errors.
`ORDER BY 1,2` sorts by country and date.
This identifies infection spread across populations, revealing which countries faced the highest relative case burdens. It provides a normalized view of COVID-19 spread rather than raw case counts, supporting fair comparisons between nations of different sizes.
*/

-- Query 5: Countries with Highest Infection Rate compared to Population
SELECT location,population,MAX(total_cases) AS HighestInfectionCount,
MAX((CONVERT(float, total_cases) / NULLIF(CONVERT(float, population), 0))) * 100 AS PercentageOfPopulationInfected
FROM PortfolioProject..CovidDeaths
--Where location like '%India%' and continent is not null
GROUP BY location,population
ORDER BY PercentageOfPopulationInfected desc
/*
This query identifies countries with the highest COVID-19 infection rates relative to their populations.
It groups data by `location` and `population`, then finds:
* `MAX(total_cases)` as the peak number of cases each country recorded.
* The maximum infection percentage (`total_cases / population * 100`).
  `CONVERT(float, …)` ensures accurate division, and the result is ordered by infection percentage in descending order.
This step compares countries on how extensively COVID-19 spread within their populations, highlighting those most affected proportionally. It is key for ranking and visualizing global infection intensity.
*/

-- Query 6: Countries with Highest Death Count per Population
SELECT 
  location, 
  MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL 
  AND continent <> ''
GROUP BY location
ORDER BY TotalDeathCount DESC;
/*
This query lists countries with the highest total number of COVID-19 deaths.
It selects `location` and the maximum value of `total_deaths` (converted to integer for consistency).
`WHERE continent IS NOT NULL AND continent <> ''` filters out non-country entries like “World” or “Europe.”
Data is grouped by country and ordered by total deaths in descending order.
This helps identify which nations experienced the highest absolute death tolls, offering a global mortality comparison and supporting visualizations of the pandemic’s human impact.
*/

-- Query 7: Showing contintents with the highest death count per population
SELECT 
  continent,
  SUM(CAST(new_deaths AS INT)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL 
  AND continent <> ''
GROUP BY continent
ORDER BY TotalDeathCount DESC;
/*
new_deaths records deaths per day, so summing them gives the total.
Using total_deaths with SUM() would double-count, since it’s cumulative.
Using MAX(total_deaths) only takes the largest single value per continent (wrong for totals).
*/

--Query 8: Global numbers
SELECT 
  SUM(CAST(new_cases AS INT)) AS total_cases,
  SUM(CAST(new_deaths AS INT)) AS total_deaths,
  (SUM(CAST(new_deaths AS FLOAT)) / NULLIF(SUM(CAST(new_cases AS FLOAT)), 0)) * 100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
Group by date
ORDER BY 1, 2;
/*
This query calculates global COVID-19 statistics aggregated by date.
It sums `new_cases` and `new_deaths` across all countries for each day, then computes the overall daily death percentage as `(total deaths ÷ total cases) × 100`.
`CAST` ensures numeric accuracy, and `NULLIF(..., 0)` prevents division by zero.
Filtering by `continent IS NOT NULL` removes regional or global summary rows already present in the dataset.
This produces a timeline of worldwide COVID-19 trends, showing how total infections and deaths evolved daily and how fatality rates changed over time. It supports high-level visual insights into the pandemic’s global trajectory.
*/

-- Query 9: Total Population vs Vaccinations
SELECT dea.continent, dea.location, dea.date,dea.population,vac.new_vaccinations,
SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.date) AS RollingPeopleVaccinated
-- (RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3
/*
This query links COVID-19 death and vaccination data to analyze vaccination progress relative to population.
It joins `CovidDeaths` (`dea`) and `CovidVaccinations` (`vac`) on matching `location` and `date`.
The `SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date)` computes a running total of people vaccinated over time for each country.
The comment `(RollingPeopleVaccinated/population)*100` indicates a later step to calculate the vaccination percentage.
Filtering by `dea.continent IS NOT NULL` ensures country-level data only.
This establishes the foundation for tracking cumulative vaccination rollout by country and time. It enables insights into how quickly populations were vaccinated and how that correlated with case and death trends.
*/

-- Query 10: Using CTE to perform Calculation on Partition By in previous query
WITH PopvsVac AS (
  SELECT 
      dea.continent,
      dea.location,
      dea.date,
      CAST(dea.population AS BIGINT) AS population,
      CAST(vac.new_vaccinations AS BIGINT) AS new_vaccinations,
      SUM(CAST(vac.new_vaccinations AS BIGINT))
        OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated
  FROM PortfolioProject..CovidDeaths dea
  JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
   AND dea.date = vac.date
  WHERE dea.continent IS NOT NULL
)
SELECT 
    continent,
    location,
    date,
    population,
    new_vaccinations,
    RollingPeopleVaccinated,
    CASE 
      WHEN population > 0 
      THEN (CAST(RollingPeopleVaccinated AS FLOAT) / population) * 100 
      ELSE NULL 
    END AS PercentVaccinated
FROM PopvsVac
ORDER BY location, date;
/*
This query refines the vaccination analysis by using a **CTE (Common Table Expression)** called `PopvsVac`.
Within the CTE:
* Death and vaccination tables are joined by `location` and `date`.
* Each country’s cumulative vaccinations are computed using a window function with `SUM(...) OVER (PARTITION BY dea.location ORDER BY dea.date)`.
* Data types are explicitly cast to `BIGINT` for accuracy with large values.
In the main query, the cumulative vaccination count is compared to the population to calculate `PercentVaccinated`, representing the proportion of the population vaccinated over time. The conditional `CASE` prevents invalid division when population is zero.
This step converts raw vaccination data into a meaningful indicator of progress—percentage of population vaccinated—enabling temporal and cross-country comparisons of vaccine rollout efficiency.
*/

-- Query 11: Using Temp Table to perform Calculation on Partition By in previous query
DROP TABLE IF EXISTS #PercentPopulationVaccinated;

CREATE TABLE #PercentPopulationVaccinated (
  continent NVARCHAR(255),
  location NVARCHAR(255),
  date DATETIME,
  population FLOAT,
  new_vaccinations FLOAT,
  RollingPeopleVaccinated FLOAT
);

INSERT INTO #PercentPopulationVaccinated
SELECT 
    dea.continent,
    dea.location,
    dea.date,
    TRY_CAST(dea.population AS FLOAT),
    TRY_CAST(vac.new_vaccinations AS FLOAT),
    SUM(TRY_CAST(vac.new_vaccinations AS FLOAT)) 
      OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
  ON dea.location = vac.location
 AND dea.date = vac.date
WHERE dea.continent IS NOT NULL;

SELECT *,
       CASE 
         WHEN population > 0 THEN (RollingPeopleVaccinated / population) * 100 
         ELSE NULL 
       END AS PercentVaccinated
FROM #PercentPopulationVaccinated
ORDER BY location, date;
/*
This query replicates the CTE logic using a **temporary table** (`#PercentPopulationVaccinated`) to store intermediate vaccination data.
It first drops the table if it exists, then creates one with columns for region, population, vaccination counts, and rolling totals.
Data is inserted by joining death and vaccination tables, calculating cumulative vaccinations using a window function (`SUM(...) OVER (PARTITION BY dea.location ORDER BY dea.date)`), and casting values safely with `TRY_CAST`.
Finally, a `SELECT` computes `PercentVaccinated` as `(RollingPeopleVaccinated / population) * 100`, ordered by country and date.
This approach allows reuse of intermediate results for further analysis or visualization, improving performance and modularity. It shows practical SQL skills in handling cumulative metrics with temporary storage.
*/

-- Query 12:  Creating View to store data for later visualizations
CREATE VIEW PercentPopulationVaccinated as
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.date) AS RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT * 
FROM PercentPopulationVaccinated
/*
This query creates a **SQL View** named `PercentPopulationVaccinated` to store vaccination progress data for future visualizations.
It joins the deaths (`dea`) and vaccinations (`vac`) tables by `location` and `date`, filters out aggregate rows (`continent IS NOT NULL`), and computes cumulative vaccinations per country using a window function.
The commented line `(RollingPeopleVaccinated/population)*100` indicates the potential for extending the view to include vaccination percentage directly.
After creation, the `SELECT *` statement retrieves the data from the view.
The view provides a reusable dataset for dashboards and analysis tools like Tableau or Power BI, enabling consistent visualization of vaccination trends without re-running complex joins or calculations.
*/