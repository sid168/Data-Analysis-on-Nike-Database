-- What is the total revenue generated (aggregate of sales price) for the product Nike Pro Tights in the state New York?

-- Round the answer to 1 decimalThis question is required.*


--  products, dc, P006
SELECT * FROM products p
JOIN order_items o
ON p.product_id=o.product_id
JOIN distribution_centers d
ON p.distribution_center_id=d.distribution_center_id
WHERE p.product_name='Nike Pro Tights'


----------------


-- What is the total revenue generated from Nike Official products sold over 600 times?

-- Make sure to exclude orders with the status Cancelled.

-- Round the answer to a full numberThis question is required.*


SELECT SUM(o.sale_price) as total_revenue FROM order_items o 
JOIN orders ord
ON o.order_id=ord.order_id
WHERE ord.status != 'Cancelled' AND (
  SELECT COUNT(o.order_item_id) FROM order_items o JOIN orders ord 
  ON ord.order_id=o.order_id) > 600 


----------------

-- How many order items from Nike Official either do not have a matching product_id 
-- from the product table or customer_id from the customer table?This question is required.*


SELECT COUNT(DISTINCT o.order_item_id)
FROM order_items o 
FULL JOIN products p 
ON o.product_id=p.product_id
FULL JOIN customers c 
ON c.customer_id=o.user_id
WHERE p.product_id IS NULL AND (c.customer_id IS NULL OR o.user_id IS NULL) AND o.order_item_id IS NOT NULL




---------------

-- What is the average discount (retail price - sales price) given across the Nike Official and Nike Vintage combined?

-- Only include order items that have a product ID.
-- Round your answer to 1 decimal.This question is required.*


