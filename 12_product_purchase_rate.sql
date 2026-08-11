SELECT
  item.item_name,
  COUNTIF(event_name = 'view_item') AS item_views,
  COUNTIF(event_name = 'add_to_cart') AS add_to_cart_events,
  COUNTIF(event_name = 'purchase') AS purchase_events,
  ROUND(
    COUNTIF(event_name = 'purchase') / COUNTIF(event_name = 'view_item') * 100,
    2
  ) AS product_purchase_rate
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
UNNEST(items) AS item
WHERE item.item_name IS NOT NULL
  AND item.item_name != '(not set)'
GROUP BY item.item_name
HAVING item_views >= 100
ORDER BY product_purchase_rate DESC
LIMIT 20;