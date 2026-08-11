# GA4 E-Commerce Marketing Analysis

This project analyzes GA4 e-commerce data using SQL and Tableau to evaluate customer behavior, conversion performance, traffic sources, device performance, campaigns, and product activity.

## Tools Used
- SQL
- BigQuery
- Tableau
- GA4 e-commerce data

## Business Questions
- Which devices have the strongest conversion performance?
- Which traffic sources generate the most users and purchases?
- Where do users drop off in the conversion funnel?
- How does conversion performance change over time?
- Which products generate the most purchase activity?
- Which countries and campaigns perform best?

## Analysis
The project uses a series of SQL queries to examine:

- Total users and events
- Event types
- Traffic-source performance
- Conversion funnel activity
- Funnel conversion rates
- Purchases by traffic source
- Conversion rate by traffic source
- Conversion rate by device
- Daily conversion trends
- Top products by purchase events
- Product purchase rates

The SQL files used for the analysis are included in this repository.

## Key Findings

- The dataset included 270,154 total users and 4,295,584 total events.
- The conversion funnel showed the largest drop-off between product views and add-to-cart. Of 61,252 product viewers, 12,545 added an item to cart, 9,719 began checkout, and 4,419 completed a purchase. That corresponds to 20.48%, 15.86%, and 7.21% of product viewers, respectively.
- Mobile had the highest user conversion rate at 1.70%, followed by desktop at 1.60% and tablet at 1.55%.
- Desktop generated the most total purchase activity because it had the largest user base, even though mobile converted slightly more efficiently.
- Traffic-source performance varied considerably. Google and shop.googlemerchandisestore had similar conversion rates, while direct traffic had the lowest conversion rate among the named sources. The highest overall rate came from an anonymized “data deleted” source and should be interpreted cautiously.
- Daily conversion performance fluctuated over time, with the strongest spikes appearing around late November and mid-December, which may reflect Cyber Monday and holiday-season shopping behavior.
- Super G Unisex Joggers generated the most purchase events, while smaller items such as the Google Emoji Magnet Set, Google Keychain, and Google SF Campus Tote had the highest view-to-purchase rates.
- The products with the highest purchase volume were not always the same products with the strongest conversion efficiency.

## Dashboard

A Tableau dashboard was created to visualize the main KPIs and findings from the analysis.

The dashboard PDF is included in this repository.

## Project Goal

The goal of this project was to turn raw e-commerce event data into actionable marketing insights and demonstrate an end-to-end analytics workflow using SQL for data analysis and Tableau for visualization.
