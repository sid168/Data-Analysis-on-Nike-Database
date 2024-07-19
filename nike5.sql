-- What is the total revenue generated (aggregate of sales price) for the product Nike Pro Tights in the state New York?

-- Round the answer to 1 decimalThis question is required.*


--  products, dc, P006
SELECT * FROM products p
JOIN order_items o
ON p.product_id=o.product_id
JOIN distribution_centers d
ON p.distribution_center_id=d.distribution_center_id
WHERE p.product_name='Nike Pro Tights'






