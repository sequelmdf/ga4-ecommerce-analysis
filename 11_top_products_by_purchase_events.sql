SELECT
  item.item_name,
  COUNTIF(event_name = 'view_item') AS item_views,
  COUNTIF(event_name = 'add_to_cart') AS add_to_cart_events,
  COUNTIF(event_name = 'purchase') AS purchase_events
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
UNNEST(items) AS item
GROUP BY item.item_name
HAVING item_views > 0
ORDER BY purchase_events DESC
LIMIT 20;