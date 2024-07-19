-- What is the number of total order items that have been returned in June 2023 
--for the Nike Official and Nike Vintage business units combined?This question is required.*


SELECT SUM(returned_count) as total_count FROM (

SELECT COUNT(order_item_id) AS returned_count
from order_items
where extract(year from returned_at)=2023 and extract(month from returned_at)=6


UNION 


SELECT COUNT(order_item_id) AS returned_count
from order_items_vintage
where extract(year from returned_at)=2023 and extract(month from returned_at)=6
) AS temp_table