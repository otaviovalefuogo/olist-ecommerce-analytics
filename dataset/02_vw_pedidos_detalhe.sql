CREATE OR REPLACE VIEW vw_pedidos_detalhe AS
SELECT 
  o.order_id,
  i.product_id,
  i.seller_id,
  CONCAT('Vendedor ', SUBSTRING(i.seller_id, 1, 6)) AS nome_vendedor,
  DATE(o.order_purchase_timestamp) AS data_compra,
  DATE(o.order_delivered_customer_date) AS data_entrega,
  DATE(o.order_estimated_delivery_date) AS data_estimada,
  c.customer_state AS estado_cliente,
  COALESCE(REPLACE(pr.product_category_name, '_', ' '), 'Outros') AS categoria,
  i.price AS valor_produto,
  i.freight_value AS valor_frete,
  pr.product_weight_g AS peso_gramas,
  s.seller_state AS estado_vendedor,
  r.review_score AS avaliacao,
  CASE 
    WHEN o.order_status = 'delivered' AND o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Atrasado'
    WHEN o.order_status = 'delivered' AND o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 'No Prazo'
    ELSE o.order_status
  END AS status_sla
FROM olist_orders_dataset o
JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
JOIN olist_order_items_dataset i ON o.order_id = i.order_id
JOIN olist_products_dataset pr ON i.product_id = pr.product_id
JOIN olist_sellers_dataset s ON i.seller_id = s.seller_id
LEFT JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id;