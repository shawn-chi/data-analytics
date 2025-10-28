-- margin
WITH gwz_sales_margin AS (
SELECT *
FROM `woven-invention-475010-a4.course14.gwz_sales` AS sales
LEFT JOIN `woven-invention-475010-a4.course14.gwz_product` AS product
USING (orders_id)
)

SELECT 
  *
  ,qty * purchase_price AS purchase_cost,
  ,turnover - (qty * purchase_price) AS margin,
FROM `woven-invention-475010-a4.course14.gwz_sales_margin`
;

-- daily margin

WITH gwz_orders_operational AS (
SELECT 
  *
FROM `woven-invention-475010-a4.course14.gwz_orders` AS sales
LEFT JOIN `woven-invention-475010-a4.course14.gwz_ship` AS ship
USING (orders_id)
)
SELECT 
  date_date,
  SUM(order_margin + shipping_fee - log_cost - ship_cost) AS ops_daily_margin 
FROM gwz_orders_operational
GROUP BY date_date
ORDER BY date_date ASC
;



