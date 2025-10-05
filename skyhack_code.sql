CREATE TEMP TABLE temp_passenger_counts AS
SELECT
    company_id,
    flight_number,
    scheduled_departure_date_local,
    SUM(total_pax) AS total_pax
FROM (
    SELECT DISTINCT
        record_locator,
        company_id,
        flight_number,
        scheduled_departure_date_local,
        total_pax
    FROM "pnr_flight_level_data"
) AS unique_bookings
GROUP BY
    company_id, flight_number, scheduled_departure_date_local;

CREATE TEMP TABLE temp_bag_counts AS
SELECT
    company_id,
    flight_number,
    scheduled_departure_date_local,
    COUNT(*) AS total_bags,
    SUM(CASE WHEN bag_type = 'Transfer' THEN 1 ELSE 0 END) AS transfer_bags,
    SUM(CASE WHEN bag_type = 'Origin' THEN 1 ELSE 0 END) AS checked_bags
FROM "bag_level_data_1"
GROUP BY
    company_id, flight_number, scheduled_departure_date_local;

CREATE TEMP TABLE temp_ssr_counts AS
SELECT
    pnr.company_id,
    pnr.flight_number,
    pnr.scheduled_departure_date_local,
    COUNT(remark.special_service_request) AS ssr_count
FROM "pnr_remark_level_data_2" AS remark
JOIN "pnr_flight_level_data" AS pnr ON remark.record_locator = pnr.record_locator
GROUP BY
    pnr.company_id, pnr.flight_number, pnr.scheduled_departure_date_local;

CREATE TEMP TABLE temp_combined_data AS
SELECT
    flt.company_id,
    flt.flight_number,
    flt.scheduled_departure_date_local,
    flt.scheduled_departure_station_code,
    flt.scheduled_arrival_station_code,
    flt.scheduled_departure_datetime_local,
    flt.scheduled_arrival_datetime_local,
    flt.total_seats,
    flt.scheduled_ground_time_minutes,
    COALESCE(pax.total_pax, 0) AS total_pax,
    COALESCE(bags.total_bags, 0) AS total_bags,
    COALESCE(bags.transfer_bags, 0) AS transfer_bags,
    COALESCE(bags.checked_bags, 0) AS checked_bags,
    COALESCE(ssr.ssr_count, 0) AS ssr_count,
    EXTRACT(EPOCH FROM (CAST(flt.actual_arrival_datetime_local AS timestamp) - CAST(flt.scheduled_arrival_datetime_local AS timestamp))) / 60 AS delay_minutes,
    CASE WHEN flt.total_seats > 0 THEN CAST(COALESCE(pax.total_pax, 0) AS REAL) / flt.total_seats ELSE 0 END AS load_factor,
    CASE WHEN COALESCE(pax.total_pax, 0) > 0 THEN CAST(COALESCE(bags.total_bags, 0) AS REAL) / COALESCE(pax.total_pax, 0) ELSE 0 END AS bags_per_pax,
    CASE WHEN COALESCE(bags.total_bags, 0) > 0 THEN CAST(COALESCE(bags.transfer_bags, 0) AS REAL) / COALESCE(bags.total_bags, 0) ELSE 0 END AS transfer_ratio,
    CASE WHEN COALESCE(pax.total_pax, 0) > 0 THEN CAST(COALESCE(ssr.ssr_count, 0) AS REAL) * 100 / COALESCE(pax.total_pax, 0) ELSE 0 END AS ssr_per_100pax
FROM "flight_level_data" AS flt
LEFT JOIN temp_passenger_counts AS pax ON flt.company_id = pax.company_id AND flt.flight_number = pax.flight_number AND flt.scheduled_departure_date_local = pax.scheduled_departure_date_local
LEFT JOIN temp_bag_counts AS bags ON flt.company_id = bags.company_id AND flt.flight_number = bags.flight_number AND flt.scheduled_departure_date_local = bags.scheduled_departure_date_local
LEFT JOIN temp_ssr_counts AS ssr ON flt.company_id = ssr.company_id AND flt.flight_number = ssr.flight_number AND flt.scheduled_departure_date_local = ssr.scheduled_departure_date_local;

CREATE TEMP TABLE temp_ranked_data AS
SELECT
    *,
    (load_factor * 1.5) + (transfer_ratio * 2.0) + (ssr_per_100pax * 0.1) - (COALESCE(delay_minutes, 0) * 0.01) AS difficulty_score,
    RANK() OVER (PARTITION BY scheduled_departure_date_local ORDER BY (load_factor * 1.5) + (transfer_ratio * 2.0) + (ssr_per_100pax * 0.1) - (COALESCE(delay_minutes, 0) * 0.01) DESC) AS daily_rank,
    PERCENT_RANK() OVER (PARTITION BY scheduled_departure_date_local ORDER BY (load_factor * 1.5) + (transfer_ratio * 2.0) + (ssr_per_100pax * 0.1) - (COALESCE(delay_minutes, 0) * 0.01)) AS daily_rank_pct
FROM temp_combined_data;

SELECT
    company_id,
    flight_number,
    scheduled_departure_date_local,
    scheduled_departure_station_code,
    scheduled_arrival_station_code,
    scheduled_departure_datetime_local,
    scheduled_arrival_datetime_local,
    total_seats,
    total_pax,
    load_factor,
    scheduled_ground_time_minutes AS scheduled_ground,
    total_bags,
    bags_per_pax,
    transfer_bags,
    checked_bags,
    transfer_ratio,
    ssr_count,
    ssr_per_100pax,
    delay_minutes,
    difficulty_score,
    daily_rank,
    daily_rank_pct,
    CASE
        WHEN daily_rank_pct >= 0.9 THEN 'Difficult'
        WHEN daily_rank_pct >= 0.6 THEN 'Medium'
        ELSE 'Easy'
    END AS difficulty_class
FROM temp_ranked_data
ORDER BY
    scheduled_departure_date_local, daily_rank;
