-- Make gwz_sales_margin

SELECT *
FROM `woven-invention-475010-a4.course14.gwz_sales` AS sales
LEFT JOIN `woven-invention-475010-a4.course14.gwz_product` AS product
USING (orders_id)
;

-- Make gwz_orders_operational

SELECT 
  *
FROM `woven-invention-475010-a4.course14.gwz_orders` AS sales
LEFT JOIN `woven-invention-475010-a4.course14.gwz_ship` AS ship
USING (orders_id)
;


-- Cal operational_margin
SELECT 
  date_date,
  ROUND(SUM(order_margin + shipping_fee - log_cost - ship_cost),2) AS ops_daily_margin 
FROM `woven-invention-475010-a4.course14.gwz_orders_operational` 
GROUP BY date_date
ORDER BY date_date ASC
;




-- Test
SELECT
  orders_id,
  COUNT(*) AS `count`,
FROM `woven-invention-475010-a4.course14.gwz_orders_operational`
GROUP BY orders_id
HAVING `count` > 1
;

SELECT orders_id
FROM `woven-invention-475010-a4.course14.gwz_orders_operational`
WHERE orders_id IS NULL
;

SELECT
  sales.products_id,
  product.products_id
FROM `woven-invention-475010-a4.course14.gwz_sales` AS sales
RIGHT JOIN `woven-invention-475010-a4.course14.gwz_product` AS product
ON sales.products_id = product.products_id
;

SELECT 
  COUNT(*) AS missing_price_rows,
FROM `woven-invention-475010-a4.course14.gwz_sales_margin`
WHERE purchase_price IS NULL
;



-- margin
SELECT 
  *,
  ROUND (qty * purchase_price, 1) AS purchase_cost,
  ROUND (turnover - (qty * purchase_price), 0) AS margin,
FROM `woven-invention-475010-a4.course14.gwz_sales_margin`
;

-- join
