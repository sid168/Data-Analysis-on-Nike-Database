SELECT
  COUNT(order_item_id),
  'Nike_Official' as business_unit
from
  order_items
GROUP BY
  business_unit
UNION
SELECT
  COUNT(order_item_id),
  'Nike_Vintage' as business_unit
from
  order_items_vintage
Group by
  business_unit