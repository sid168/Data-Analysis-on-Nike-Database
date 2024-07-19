-- Which products are distributed by which distribution centers? 
-- Write a query that shows the product name, product ID, and distribution center name for each product.

-- SELECT products.product_name,products.product_id,distribution_centers.name AS DIST_NAME
-- FROM products
-- JOIN distribution_centers
-- ON products.distribution_center_id=distribution_centers.distribution_center_id

-- How many products are distributed by each distribution center? 
-- Ensure to include the name of all distribution centers even if they don’t distribute any products.

-- SELECT d.name as distribution_center_name, COUNT(p.product_id)
-- FROM products p
-- RIGHT JOIN distribution_centers d
-- ON p.distribution_center_id=d.distribution_center_id
-- GROUP BY d.distribution_center_id
-- ORDER BY d.name


-- How many products have a distribution center ID not available in the table distribution_centers?
-- SELECT COUNT(p.product_id)
-- FROM products p
-- LEFT JOIN distribution_centers d
-- ON p.distribution_center_id=d.distribution_center_id
-- WHERE d.distribution_center_id IS NULL

-- SELECT 
-- order_item_id,
-- order_id,
-- user_id,
-- product_id,
-- created_at,
-- shipped_at,
-- delivered_at,
-- returned_at,
-- sale_price
-- FROM order_items
-- WHERE created_at > '2023-02-01'
-- UNION ALL 
-- SELECT 
-- order_item_id,
-- order_id,
-- user_id,
-- product_id,
-- created_at,
-- shipped_at,
-- delivered_at,
-- returned_at,
-- sale_price
-- FROM order_items_vintage
-- WHERE created_at > '2023-02-01'





-- SELECT 

-- user_id

-- FROM order_items
-- WHERE returned_at IS NOT NULL
-- UNION DISTINCT 
-- SELECT 

-- user_id

-- FROM order_items_vintage
-- WHERE returned_at IS NOT NULL






-- SELECT o.order_id,o.order_item_id,p.product_name,o.sale_price
-- FROM order_items o
-- join products p
-- on o.product_id=p.product_id

-- SELECT p.product_id,p.product_name
-- FROM products p
-- JOIN distribution_centers d
-- ON d.distribution_center_id=p.distribution_center_id
-- WHERE d.name='Los Angeles CA'


-- SELECT
--     COUNT(DISTINCT o.order_item_id) AS count,
--     CASE
--         WHEN ord.returned_at IS NOT NULL THEN 'Returned'
--         WHEN ord.status = 'Cancelled' THEN 'Cancelled'
--     END AS status_1
-- FROM
--     order_items o
--     JOIN orders ord
--     ON o.order_id=ord.order_id
-- GROUP BY status_1



-- SELECT
--     COUNT(DISTINCT o.order_item_id) AS count,p.product_name
    
-- FROM
--     order_items o
--     RIGHT JOIN products p
--     ON o.product_id=p.product_id
--     WHERE o.order_id IS NULL
-- GROUP BY p.product_name


-- SELECT  o.product_id
-- FROM order_items o
-- UNION DISTINCT
-- SELECT  ov.product_id
-- FROM order_items_vintage ov


-- SELECT o.order_item_id,p.product_name,p.retail_price,o.sale_price,p.retail_price-o.sale_price as discount
-- FROM order_items o
-- LEFT JOIN products p
-- ON p.product_id=o.product_id
-- WHERE p.retail_price-o.sale_price>0
-- ORDER BY p.retail_price-o.sale_price DESC



-- SELECT COUNT(o.order_item_id) as count_order_items,
-- CASE WHEN p.retail_price-o.sale_price>0 then 'actual sales'
-- WHEN p.retail_price-o.sale_price=0 then 'retail same sale'
-- else 'other'
-- end as discount_applied
-- FROM order_items o
-- RIGHT JOIN products p
-- ON p.product_id=o.product_id
-- GROUP BY discount_applied


-- SELECT SUM(p.retail_price-o.sale_price) as discount_total
-- FROM order_items o
-- LEFT JOIN products p
-- ON p.product_id=o.product_id

-- ORDER BY discount_total DESC

-- SELECT COUNT(o.order_item_id) as nike_off, count(ov.order_item_id) as nike_vint
-- FROM order_items o
-- FULL JOIN order_items_vintage ov
-- on o.order_item_id=ov.order_item_id


-- SELECT 
--     COUNT(o.order_item_id) AS num_items,
--     'Nike Official' AS business_unit,
--     SUM(o.sale_price)
-- FROM 
--     order_items o
-- FULL JOIN 
--     products p ON o.product_id = p.product_id
-- WHERE p.retail_price>o.sale_price
-- GROUP BY 
--     business_unit

-- UNION ALL

-- SELECT 
--     COUNT(ov.order_item_id) AS num_items,
--     'Nike Vintage' AS business_unit,
--     SUM(ov.sale_price)
-- FROM 
--     order_items_vintage ov
-- FULL JOIN 
--     products p ON ov.product_id = p.product_id
-- WHERE p.retail_price>ov.sale_price
-- GROUP BY 
--     business_unit;





-- SELECT 
--     p.product_name,
--     'Nike Official' AS business_unit,
--     AVG(p.retail_price-o.sale_price)
-- FROM 
--     order_items o
-- FULL JOIN 
--     products p ON o.product_id = p.product_id
-- WHERE p.retail_price>o.sale_price
-- GROUP BY 
--     business_unit,p.product_name

-- UNION ALL

-- SELECT 
--     p.product_name,
--     'Nike Vintage' AS business_unit,
--     AVG(p.retail_price-ov.sale_price)
-- FROM 
--     order_items_vintage ov
-- FULL JOIN 
--     products p ON ov.product_id = p.product_id
-- WHERE p.retail_price>ov.sale_price
-- GROUP BY 
--     business_unit,p.product_name;





-- SELECT 
--     p.product_name,
--     'Nike Vintage' AS business_unit,
--     AVG(ov.sale_price-p.cost)
-- FROM 
--     order_items_vintage ov
-- FULL JOIN 
--     products p ON ov.product_id = p.product_id
-- WHERE ov.sale_price>p.cost
-- GROUP BY 
--     business_unit,p.product_name;



-- SELECT 
--     p.product_name,
--     'Nike Vintage' AS business_unit,
--     sum(ov.sale_price-p.cost) as cum_profit
    
-- FROM 
--     order_items_vintage ov
-- FULL JOIN 
--     products p ON ov.product_id = p.product_id
-- WHERE ov.sale_price>p.cost AND ov.created_at between '2021-12-31' and '2023-01-01'
-- GROUP BY 
--     p.product_name
-- ORDER BY cum_profit DESC
-- LIMIT 1


SELECT COUNT(o.order_item_id), 
SUM(o.sale_price)
FROM order_items o
FULL JOIN orders ord
ON o.order_id=ord.order_id
WHERE o.returned_at IS NOT NULL or ord.status='Cancelled'

UNION ALL 

SELECT COUNT(ov.order_item_id), 
SUM(ov.sale_price)
FROM order_items_vintage ov
FULL JOIN orders ord
ON ov.order_id=ord.order_id
WHERE ov.returned_at IS NOT NULL or ord.status='Cancelled'

















