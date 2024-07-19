-- What is the total revenue (aggregate sales price) generated 
-- for users that purchased more than one unique product from the Nike Official and Nike Vintage businesses combined?

-- Round the answer to 1 decimal.
-- The order items of the Nike Official business 
-- are stored in the table order_items and for Nike Vintage in the order_items_vintage


WITH combined_orders AS (
  SELECT user_id, sale_price,product_id
    FROM order_items 
    UNION ALL 
    SELECT user_id, sale_price, product_id
    FROM order_items_vintage
  ),


combined_revenue AS (
  SELECT user_id, SUM(sale_price) AS total_sales
  FROM  combined_orders
  GROUP BY user_id
  HAVING COUNT(DISTINCT product_id) > 1
)

SELECT SUM(total_sales) AS total_revenue 
FROM combined;




