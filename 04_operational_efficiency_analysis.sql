-- These queries join ridership data with our simulated financial data.

-- Query 1: Calculate total revenue and cost for specific bus routes
SELECT
    bus.route,
    SUM(bus.rides) AS total_rides,
    fin.average_fare,
    fin.operational_cost_per_day,
    SUM(bus.rides) * fin.average_fare AS total_revenue,
    COUNT(DISTINCT bus.date) * fin.operational_cost_per_day AS total_operational_cost
FROM
    cta_bus_routes AS bus
INNER JOIN
    route_financials AS fin ON bus.route = fin.route
GROUP BY
    bus.route, fin.average_fare, fin.operational_cost_per_day
ORDER BY
    total_revenue DESC;


-- Query 2: Calculate profitability and revenue per rider for each route
SELECT
    bus.route,
    SUM(bus.rides) AS total_rides,
    SUM(bus.rides) * fin.average_fare AS total_revenue,
    COUNT(DISTINCT bus.date) * fin.operational_cost_per_day AS total_operational_cost,
    (SUM(bus.rides) * fin.average_fare) - (COUNT(DISTINCT bus.date) * fin.operational_cost_per_day) AS profit,
    (SUM(bus.rides) * fin.average_fare) / SUM(bus.rides) AS revenue_per_rider
FROM
    cta_bus_routes AS bus
INNER JOIN
    route_financials AS fin ON bus.route = fin.route
GROUP BY
    bus.route, fin.average_fare, fin.operational_cost_per_day
ORDER BY
    profit DESC;