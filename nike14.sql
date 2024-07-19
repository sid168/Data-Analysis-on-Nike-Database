-- What is the number of total order items that have been returned in June 2023 
--for the Nike Official and Nike Vintage business units combined?This question is required.*


-- SELECT SUM(returned_count) as total_count FROM (

-- SELECT COUNT(order_item_id) AS returned_count
-- from order_items
-- where extract(year from returned_at)=2023 and extract(month from returned_at)=6


-- UNION 


-- SELECT COUNT(order_item_id) AS returned_count
-- from order_items_vintage
-- where extract(year from returned_at)=2023 and extract(month from returned_at)=6
-- ) AS temp_table




----------------


-- What is the average sales price generated per order item from the Nike Official and Nike Vintage business combined?

-- Round the answer in 2 decimals.This question is required.*
-- The order items of the Nike Official business are stored in the table order_items and for Nike Vintage in the order_items_vintage

-- SELECT AVG(avg_price) FROM (

-- SELECT AVG(o.sale_price) AS avg_price
-- FROM order_items o 
-- GROUP BY order_item_id

-- UNION ALL

-- SELECT AVG(ov.sale_price) AS avg_price
-- FROM order_items_vintage ov
-- GROUP BY order_item_id

-- ) AS new_table

-----------------------

-- How many unique customers have purchased more than 1 order item 
-- from the Nike Official and Nike Vintage business combined?

-- Only include orders with a status equal to Complete

SELECT COUNT(users_count) FROM (

SELECT COUNT(o.user_id) as users_count, COUNT(o.order_item_id) as items_count
FROM orders ord
join order_items o
on o.order_id=ord.order_id
WHERE ord.status='Complete' 
GROUP BY o.user_id
HAVING COUNT(o.order_item_id)>=1
UNION ALL 

SELECT COUNT(ov.user_id) as users_count ,COUNT(ov.order_item_id) as items_count
FROM orders ord
join order_items_vintage ov
on ov.order_id=ord.order_id
WHERE ord.status='Complete' 
GROUP BY ov.user_id
HAVING COUNT(ov.order_item_id)>=1
) as temp_table
-- GROUP BY ord.user_id
-- HAVING SUM(items_count)>1





