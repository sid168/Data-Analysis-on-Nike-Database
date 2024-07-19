-- How many order items of both business units (Nike Official and Nike Vintage) 
-- have been returned or cancelled, and what is the total sales price in $ that has been impacted by it?

SELECT COUNT(o.order_item_id) AS count_items_returned_cancelled, SUM(o.sale_price) AS total_sales_price_impacted,
'NikeOfficial' AS business_unit
FROM order_items o
JOIN orders ord
ON o.order_id=ord.order_id
WHERE o.returned_at IS NOT NULL OR ord.status='Cancelled'

UNION 

SELECT COUNT(ov.order_item_id) AS count_items_returned_cancelled, SUM(ov.sale_price) AS total_sales_price_impacted,
'NikeVintage' AS business_unit
FROM order_items_vintage ov
JOIN orders ord
ON ov.order_id=ord.order_id
WHERE ov.returned_at IS NOT NULL OR ord.status='Cancelled'







