-- Standardize the names of Rafa & Emma Raducanu. 
-- Then, give me one output showing only the top three revenue generating 
-- product names per fanbase with the generated revenue.


WITH customers_cleaned AS 
( 
  
  SELECT fav_tennis_player, customer_id,
  CASE WHEN fav_tennis_player LIKE 'Rafa%' THEN 'Rafa'
   WHEN fav_tennis_player LIKE 'Emma%' THEN 'Emma'
  ELSE fav_tennis_player
  END AS rafa_or_emma
  FROM customers
  
),

vintage_table_cleaned AS 

(
  SELECT user_id, sale_price,
  CASE WHEN product_id IS NULL THEN 'P012'
  ELSE product_id
  END AS product_id_clean
  FROM order_items_vintage
  
),

order_items_cleaned AS 

(
  SELECT user_id, sale_price,
  CASE WHEN product_id IS NULL THEN 'P003'
  ELSE product_id
  END AS product_id_clean
  FROM order_items
  
),

entire_business AS 
(
  SELECT * FROM vintage_table_cleaned
  UNION ALL 
  SELECT * FROM order_items_cleaned
  
),

emma_top_sellers AS 
(
  SELECT rafa_or_emma, p.product_name, SUM(e.sale_price) as emma_revenue
  FROM entire_business e 
  JOIN customers_cleaned c 
  ON e.user_id=c.customer_id
  JOIN products p 
  ON p.product_id=e.product_id_clean
  WHERE rafa_or_emma = 'Emma'
  GROUP BY 1,2
  ORDER BY emma_revenue DESC
  LIMIT 3 
),

rafa_top_sellers AS 
(
  SELECT rafa_or_emma, p.product_name, SUM(e.sale_price) as rafa_revenue
  FROM entire_business e 
  JOIN customers_cleaned c 
  ON e.user_id=c.customer_id
  JOIN products p 
  ON p.product_id=e.product_id_clean
  WHERE rafa_or_emma = 'Rafa'
  GROUP BY 1,2
  ORDER BY rafa_revenue DESC
  LIMIT 3 
)

SELECT * FROM emma_top_sellers

UNION ALL 

SELECT * FROM rafa_top_sellers









