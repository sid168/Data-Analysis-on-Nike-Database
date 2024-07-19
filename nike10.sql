SELECT COUNT(order_item_id) AS total_order_items, SUM(o.sale_price) AS total_revenue_from_discount,
'Nike_Official' as business_unit

FROM order_items o
JOIN products p
ON o.product_id=p.product_id
WHERE o.sale_price<p.retail_price

UNION 

SELECT COUNT(order_item_id) AS total_order_items, SUM(ov.sale_price) AS total_revenue_from_discount,
'Nike_Vintage' as business_unit

FROM order_items_vintage ov
JOIN products p
ON ov.product_id=p.product_id
WHERE ov.sale_price<p.retail_price







