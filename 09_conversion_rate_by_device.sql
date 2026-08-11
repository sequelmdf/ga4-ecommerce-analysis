WITH device_users AS (
  SELECT
    device.category AS device_category,
    COUNT(DISTINCT user_pseudo_id) AS total_users
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY device_category
),

device_purchases AS (
  SELECT
    device.category AS device_category,
    COUNT(DISTINCT user_pseudo_id) AS purchasing_users,
    COUNT(*) AS purchase_events
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name = 'purchase'
  GROUP BY device_category
)

SELECT
  u.device_category,
  u.total_users,
  COALESCE(p.purchasing_users, 0) AS purchasing_users,
  COALESCE(p.purchase_events, 0) AS purchase_events,
  ROUND(COALESCE(p.purchasing_users, 0) / u.total_users * 100, 2) AS user_conversion_rate
FROM device_users u
LEFT JOIN device_purchases p
  ON u.device_category = p.device_category
ORDER BY user_conversion_rate DESC;