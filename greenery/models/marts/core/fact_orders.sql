{{
    config(
        materialized = 'table'
    )
}}

SELECT
  o.order_id,
  o.user_id,
  o.promo_id,
  o.address_id, 
  o.order_created_at,
  o.order_cost,
  o.shipping_cost, 
  o.order_total, 
  o.tracking_id, 
  o.shipping_service, 
  o.estimated_delivery_at, 
  o.delivered_at, 
  o.status, 
  oi.total_num_product_items,
  oi.num_distinct_products, 
  oi.list_of_product_ids
FROM 
    {{ ref('stg_orders') }} AS o
JOIN 
    {{ ref('int_order_product_summary') }} AS oi
USING 
    (order_id)