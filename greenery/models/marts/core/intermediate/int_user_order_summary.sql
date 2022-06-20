{{
    config(
        materialized = 'table'
    )
}}

SELECT
  user_id,
  COUNT(DISTINCT order_id) AS num_orders_per_user,
  SUM(order_cost) AS total_order_cost_per_user
FROM 
    {{ ref('stg_orders') }}
GROUP BY 
    1