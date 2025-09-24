-- Table for CTA 'L' Station daily entries
CREATE TABLE cta_l_station_entries (
    station_id INTEGER,
    stationname VARCHAR(255),
    date DATE,
    daytype VARCHAR(50),
    rides INTEGER
);

-- Table for CTA Bus Route daily totals
CREATE TABLE cta_bus_routes (
    route VARCHAR(255),
    date DATE,
    daytype VARCHAR(50),
    rides INTEGER
);

ALTER TABLE cta_bus_routes ALTER COLUMN date TYPE TEXT;
ALTER TABLE cta_bus_routes ALTER COLUMN rides TYPE TEXT;

UPDATE cta_bus_routes SET rides = REPLACE(rides, ',', '');

ALTER TABLE cta_bus_routes ALTER COLUMN date TYPE DATE USING date::DATE;
ALTER TABLE cta_bus_routes ALTER COLUMN rides TYPE INTEGER USING rides::INTEGER;

ALTER TABLE cta_l_station_entries ALTER COLUMN date TYPE TEXT;
ALTER TABLE cta_l_station_entries ALTER COLUMN rides TYPE TEXT;

UPDATE cta_l_station_entries SET rides = REPLACE(rides, ',', '');

ALTER TABLE cta_l_station_entries ALTER COLUMN date TYPE DATE USING date::DATE;
ALTER TABLE cta_l_station_entries ALTER COLUMN rides TYPE INTEGER USING rides::INTEGER;

SELECT COUNT(*) FROM cta_l_station_entries;
SELECT COUNT(*) FROM cta_bus_routes;

-- Look at a sample from the 'L' station table
SELECT * FROM cta_l_station_entries LIMIT 10;

-- Look at a sample from the bus routes table
SELECT * FROM cta_bus_routes LIMIT 10;

CREATE TABLE route_financials (
    route VARCHAR(255) PRIMARY KEY,
    average_fare NUMERIC(4, 2),
    operational_cost_per_day NUMERIC(10, 2)
);

INSERT INTO route_financials (route, average_fare, operational_cost_per_day) VALUES
('77', 2.25, 4500.00),
('9', 2.50, 7000.00),
('X9', 2.50, 6500.00),
('4', 2.25, 8200.00),
('J14', 2.50, 5800.00),
('66', 2.25, 9500.00),
('22', 2.25, 6100.00),
('3', 2.25, 7800.00);