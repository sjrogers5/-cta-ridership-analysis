-- This query uses a CTE and subquery to derive deeper insights.

-- Query 1: Use a CTE to rank bus routes by profitability.
WITH RouteProfit AS (
    SELECT
        bus.route,
        (SUM(bus.rides) * fin.average_fare) - (COUNT(DISTINCT bus.date) * fin.operational_cost_per_day) AS profit
    FROM
        cta_bus_routes AS bus
    INNER JOIN
        route_financials AS fin ON bus.route = fin.route
    GROUP BY
        bus.route, fin.average_fare, fin.operational_cost_per_day
)
SELECT
    route,
    profit,
    RANK() OVER (ORDER BY profit DESC) as profitability_rank
FROM
    RouteProfit;