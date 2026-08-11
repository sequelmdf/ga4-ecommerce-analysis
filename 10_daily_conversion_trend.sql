SELECT
  PARSE_DATE('%Y%m%d', event_date) AS date,
  COUNT(DISTINCT user_pseudo_id) AS users,
  COUNTIF(event_name = 'purchase') AS purchase_events,
  COUNT(DISTINCT IF(event_name = 'purchase', user_pseudo_id, NULL)) AS purchasing_users,
  ROUND(
    COUNT(DISTINCT IF(event_name = 'purchase', user_pseudo_id, NULL))
    / COUNT(DISTINCT user_pseudo_id) * 100,
    2
  ) AS daily_user_conversion_rate
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY date
ORDER BY date;