-- These queries aggregate data to identify trends over time and by location.

-- Query 1: Calculate total yearly ridership for the 'L' system
SELECT
    EXTRACT(YEAR FROM date) AS ride_year,
    SUM(rides) AS total_yearly_rides
FROM cta_l_station_entries 
GROUP BY ride_year
ORDER BY ride_year;

-- Query 2: Calculate total monthly ridership for a specific year (e.g., 2022)
SELECT
    EXTRACT(MONTH FROM date) AS ride_month,
    SUM(rides) AS total_monthly_rides
FROM cta_l_station_entries
WHERE EXTRACT(YEAR FROM date) = 2022
GROUP BY ride_month
ORDER BY ride_month;

-- Query 3: Find the top 10 busiest 'L' stations by total ridership
SELECT
    stationname, 
    SUM(rides) AS total_rides
FROM cta_l_station_entries
GROUP BY stationname 
ORDER BY total_rides DESC
LIMIT 10;

-- Query 4: Compare average ridership on weekdays vs. weekends for the bus system
SELECT
    daytype,
    AVG(rides) AS average_rides_per_route
FROM cta_bus_routes
WHERE daytype IN ('W', 'A', 'U')
GROUP BY daytype
ORDER BY average_rides_per_route DESC;

-- Query 5: Find the top 10 busiest bus routes
SELECT
    route,
    SUM(rides) as total_rides
FROM cta_bus_routes
GROUP BY route
ORDER BY total_rides DESC
LIMIT 10;