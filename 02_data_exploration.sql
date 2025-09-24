-- These queries help us get a first look at our data.

-- View the first 10 rows of the 'L' station data
SELECT *
FROM cta_l_station_entries
LIMIT 10;

-- View the first 10 rows of the bus route data
SELECT *
FROM cta_bus_routes
LIMIT 10;

-- Check the total number of records in each table
SELECT COUNT(*) AS total_l_records 
FROM cta_l_station_entries; 

SELECT COUNT(*) AS total_bus_records 
FROM cta_bus_routes;

-- Find the date range of the dataset for 'L' stations
SELECT
    MIN(date) AS start_date,
    MAX(date) AS end_date
FROM cta_l_station_entries;

-- List all unique "daytypes" for the 'L' station data
SELECT DISTINCT daytype
FROM cta_l_station_entries;

-- Find the busiest day on record for the entire 'L' system
SELECT
    date,
    SUM(rides) AS total_rides
FROM cta_l_station_entries
GROUP BY date
ORDER BY total_rides ASC
LIMIT 1;