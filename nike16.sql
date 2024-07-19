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
  
)










