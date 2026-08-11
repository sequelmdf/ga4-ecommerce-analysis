WITH source_users AS (
  SELECT
    traffic_source.source AS source,
    traffic_source.medium AS medium,
    traffic_source.name AS campaign_name,
    COUNT(DISTINCT user_pseudo_id) AS total_users
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY source, medium, campaign_name
),

source_purchases AS (
  SELECT
    traffic_source.source AS source,
    traffic_source.medium AS medium,
    traffic_source.name AS campaign_name,
    COUNT(DISTINCT user_pseudo_id) AS purchasing_users,
    COUNT(*) AS purchase_events
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name = 'purchase'
  GROUP BY source, medium, campaign_name
)

SELECT
  u.source,
  u.medium,
  u.campaign_name,
  u.total_users,
  COALESCE(p.purchasing_users, 0) AS purchasing_users,
  COALESCE(p.purchase_events, 0) AS purchase_events,
  ROUND(COALESCE(p.purchasing_users, 0) / u.total_users * 100, 2) AS user_conversion_rate
FROM source_users u
LEFT JOIN source_purchases p
  ON u.source = p.source
  AND u.medium = p.medium
  AND u.campaign_name = p.campaign_name
WHERE u.total_users >= 100
ORDER BY user_conversion_rate DESC;