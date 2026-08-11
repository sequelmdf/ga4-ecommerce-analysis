SELECT
   COUNT(*) AS total_events,
   COUNT(DISTINCT user_pseudo_id) AS total_users
   FROM
   `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`;