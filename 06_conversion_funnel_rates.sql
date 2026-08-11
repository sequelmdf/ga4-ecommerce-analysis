WITH funnel AS (
  SELECT
    event_name,
    COUNT(DISTINCT user_pseudo_id) AS users
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name IN ('view_item', 'add_to_cart', 'begin_checkout', 'purchase')
  GROUP BY event_name
)

SELECT
  event_name,
  users,
  ROUND(users / MAX(CASE WHEN event_name = 'view_item' THEN users END) OVER () * 100, 2) AS percent_of_view_item_users
FROM funnel
ORDER BY
  CASE event_name
    WHEN 'view_item' THEN 1
    WHEN 'add_to_cart' THEN 2
    WHEN 'begin_checkout' THEN 3
    WHEN 'purchase' THEN 4
  END;