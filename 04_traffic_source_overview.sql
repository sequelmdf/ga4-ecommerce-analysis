SELECT
  traffic_source.source AS source,
  traffic_source.medium AS medium,
  traffic_source.name AS campaign_name,
  COUNT(*) AS total_events,
  COUNT(DISTINCT user_pseudo_id) AS total_users
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY source, medium, campaign_name
ORDER BY total_users DESC;