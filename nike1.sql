SELECT COUNT(customer_count) FROM 
(
SELECT COUNT(c.customer_id) as customer_count
FROM customers c
JOIN orders ord
ON  c.customer_id=ord.user_id
join order_items o
on o.order_id=ord.order_id
WHERE ord.status='Complete' 
GROUP BY c.customer_id
HAVING COUNT(o.order_item_id)>1

UNION ALL 

SELECT COUNT(c.customer_id) as customer_count
FROM customers c
JOIN orders ord
on  c.customer_id=ord.user_id
join order_items_vintage ov
ON ov.order_id=ord.order_id
WHERE ord.status='Complete' 
GROUP BY c.customer_id
HAVING COUNT(ov.order_item_id)>1
) as temp_table





