-- SELECT COUNT(order_item_id),orders.user_id FROM order_items
--     JOIN orders 
--     ON orders.order_id=order_items.order_id
--     WHERE orders.status='Complete'
--     group by orders.user_id
--     HAVING COUNT(order_item_id)>1
   



SELECT COUNT(order_item_id),orders.user_id FROM order_items_vintage
    JOIN orders 
    ON orders.order_id=order_items_vintage.order_id
    WHERE orders.status='Complete'
    group by orders.user_id
    HAVING COUNT(order_item_id)>1





