
-- “ Show me a breakdown across the entire business of how many customers have ordered
-- how many items 



WITH entire_business AS 
(
  SELECT user_id FROM order_items
  UNION ALL 
  SELECT user_id FROM order_items_vintage
  
),

customer_breakdown AS 
(
  SELECT user_id, COUNT(*) AS total_orders_items
  FROM entire_business
  GROUP BY 1
)


SELECT total_orders_items as number_of_users, COUNT(total_orders_items) number_of_items_ordered
FROM customer_breakdown
GROUP BY number_of_users