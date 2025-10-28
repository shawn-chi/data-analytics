-- Make gwz_sales_margin

WITH gwz_sales_margin AS (
SELECT *
FROM `woven-invention-475010-a4.course14.gwz_sales` AS sales
LEFT JOIN `woven-invention-475010-a4.course14.gwz_product` AS product
USING (orders_id)
)
;
gwz_orders_operational AS (
SELECT 
  *
FROM `woven-invention-475010-a4.course14.gwz_orders` AS sales
LEFT JOIN `woven-invention-475010-a4.course14.gwz_ship` AS ship
USING (orders_id)
)
;


-- Cal operational_margin
SELECT 
  date_date,
  ROUND(SUM(order_margin + shipping_fee - log_cost - ship_cost),2) AS ops_daily_margin 
FROM `woven-invention-475010-a4.course14.gwz_orders_operational` 
GROUP BY date_date
ORDER BY date_date ASC
;

-- margin
SELECT 
  *,
  ROUND (qty * purchase_price, 1) AS purchase_cost,
  ROUND (turnover - (qty * purchase_price), 0) AS margin,
FROM `woven-invention-475010-a4.course14.gwz_sales_margin`
;

