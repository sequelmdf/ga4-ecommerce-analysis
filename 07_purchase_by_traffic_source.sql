SELECT
  traffic_source.source AS source,
  traffic_source.medium AS medium,
  traffic_source.name AS campaign_name,
  COUNT(DISTINCT user_pseudo_id) AS purchasing_users,
  COUNT(*) AS purchase_events
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase'
GROUP BY source, medium, campaign_name
ORDER BY purchasing_users DESC;