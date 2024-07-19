-- -- -- -- -- What is the average sales price generated per order item from the Nike Official and Nike Vintage business combined?

-- -- -- -- -- Round the answer in 2 decimals.This question is required.*
-- -- -- -- -- The order items of the Nike Official business are stored in the table order_items and for Nike Vintage in the order_items_vintage


-- -- -- -- SELECT ROUND(AVG(o.sale_price)::Numeric,2)
-- -- -- -- FROM order_items o 


-- -- -- -- UNION ALL 

-- -- -- -- select ROUND(avg(ov.sale_price)::Numeric,2)
-- -- -- -- from order_items_vintage ov


-- -- -- -- How many unique customers have purchased more than 1 order item 
-- -- -- -- from the Nike Official and Nike Vintage business combined?

-- -- -- -- Only include orders with a status equal to Complete


-- -- -- SELECT COUNT(DISTINCT ord.user_id) 
-- -- -- FROM orders ord
-- -- -- join order_items o
-- -- -- on o.order_id=ord.order_id
-- -- -- join order_items_vintage ov 
-- -- -- on o.order_item_id=ov.order_item_id
-- -- -- WHERE ord.status='Complete' AND ((SELECT COUNT(order_item_id) FROM order_items)> 1)


-- -- -- union all 

-- -- -- SELECT COUNT(DISTINCT ord.user_id) 
-- -- -- FROM orders ord
-- -- -- join order_items_vintage ov
-- -- -- on ov.order_id=ord.order_id
-- -- -- WHERE ord.status='Complete' AND ((SELECT COUNT(ov.order_item_id) FROM order_items_vintage ov)> 1)


-- -- What is the percentage of the total revenue (aggregate of sales price) generated by the Nike Vintage business unit?

-- -- Round the answer to 1 decimal.This question is required.*
-- -- The order items of the Nike Vintage business are stored in the table order_items_vintage


-- -- SELECT SUM(sale_price) 	from order_items

-- -- union all

-- -- select sum(sale_price) from order_items_vintage


-- -- 461654,1905681793


-- -- SELECT SUM(sale_price)/461654,1905681793 FROM order_items_vintage



-- What is the total revenue (aggregate sales price) generated 
--for users that purchased more than one unique product from the Nike Official and Nike Vintage businesses combined?

-- Round the answer to 1 decimal.This question is required.*
-- The order items of the Nike Official business are stored in the table order_items 
--and for Nike Vintage in the order_items_vintage


-- (SELECT SUM(o.sale_price) 
-- FROM order_items o
-- union all
-- SELECT SUM(ov.sale_price) 
-- FROM order_items_vintage ov)


  
SELECT ROUND(SUM(total_revenue), 1) AS total_revenue
FROM (
    SELECT user_id, SUM(sale_price) AS total_revenue
    FROM (
        SELECT user_id, product_id, COUNT(*) AS num_products, SUM(sale_price) AS sale_price
        FROM (
            SELECT user_id, product_id, sale_price
            FROM order_items
            UNION ALL
            SELECT user_id, product_id, sale_price
            FROM order_items_vintage
        ) AS combined_orders
        GROUP BY user_id, product_id
    ) AS user_product_counts
    WHERE num_products > 1
    GROUP BY user_id
) AS revenue_by_user;

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  