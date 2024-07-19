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

