SELECT
  event_date,
  event_name,
  traffic_source.source,
  traffic_source.medium,
  traffic_source.name
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
LIMIT 10;