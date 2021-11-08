SELECT *
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3,4

SELECT *
FROM PortfolioProject..CovidVaccinations
ORDER BY 3,4

--Select Data that we are going to be using
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
ORDER BY 1,2

--Looking at Total Cases vs Total Deaths
--Shows the likelihood of dying if you contract COVID in your country
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage 
FROM PortfolioProject..CovidDeaths
WHERE location LIKE '%australia%'
ORDER BY 1,2

--Looking at the Total cases vs Population
--Shows the %age of population that contracted COVID
SELECT location, date, total_cases, population, (total_cases/population)*100 AS COVIDPercentage 
FROM PortfolioProject..CovidDeaths
WHERE location LIKE '%australia%'
ORDER BY 1,2

--Looking at countries with highest infection rate compared to population
SELECT location, population, MAX(total_cases) AS HighestInfectionCount, (MAX(total_cases)/population)*100 AS COVIDPercentage 
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%australia%'
GROUP BY location, population
ORDER BY COVIDPercentage DESC

--Breaking Death Data down by continent
SELECT continent, population, MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent, population
ORDER BY TotalDeathCount DESC

--Showing the countries with highest death counts per population
SELECT location, MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NULL
GROUP BY location
ORDER BY TotalDeathCount DESC

--Showing the continents with highest death count per population
SELECT continent, MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL 
GROUP BY continent
ORDER BY TotalDeathCount DESC

--Global numbers
SELECT SUM(new_cases) as total_cases, SUM(CAST(new_deaths AS INT)) as total_deaths, SUM(
cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
--GROUP BY date
ORDER BY 1,2

-- COVID Vaccinations exploration
SELECT *
FROM PortfolioProject..CovidVaccinations


-- JOINING DEATHS VS VACCINATIONS TABLES
-- looking at total population and vaccination/ CREATING A ROLLING OUT OF VACCINE
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(convert(bigint, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date)
AS rollingpeoplevaccinated
--paritioning by location is helping us to break the data about new vaccination by country and not the continent, this way
--sum will restart over new location.
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3

--USE CTE to find rolling people vaccinated/population (1ST OPTION)
WITH popvsvac (continent, location, date, population, new_vaccinations, rollingpeoplevaccinated)
AS
(
	SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(convert(bigint, vac.new_vaccinations))
	OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rollingpeoplevaccinated

	FROM PortfolioProject..CovidDeaths dea
	INNER JOIN PortfolioProject..CovidVaccinations vac
		ON dea.location = vac.location
		AND dea.date = vac.date
	WHERE dea.continent IS NOT NULL
)

SELECT *, (rollingpeoplevaccinated/population)*100
FROM popvsvac
WHERE location = 'albania'


-- TEMP TABLE
DROP TABLE IF EXISTS #percentagepopulationvaccinated
CREATE TABLE #percentagepopulationvaccinated
(continent nvarchar(255), location nvarchar(255), date datetime, population numeric,
new_vaccinations numeric, rollingpeoplevaccinated numeric)

INSERT INTO #percentagepopulationvaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(convert(bigint, vac.new_vaccinations))
OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rollingpeoplevaccinated

FROM PortfolioProject..CovidDeaths dea
INNER JOIN PortfolioProject..CovidVaccinations vac
		ON dea.location = vac.location
		AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT *, (rollingpeoplevaccinated/population)*100
FROM #percentagepopulationvaccinated
WHERE location = 'albania'

--CREATE VIEW TO STORE DATA FOR LATER VISUALIZATION

CREATE VIEW percentagepopulationvaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(convert(bigint, vac.new_vaccinations))
OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rollingpeoplevaccinated

FROM PortfolioProject..CovidDeaths dea
INNER JOIN PortfolioProject..CovidVaccinations vac
		ON dea.location = vac.location
		AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT*
FROM percentagepopulationvaccinated