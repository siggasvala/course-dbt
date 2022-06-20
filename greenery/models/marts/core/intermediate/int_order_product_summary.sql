{{
    config(
        materialized = 'table'
    )
}}

SELECT
  order_id,
  SUM(quantity) AS total_num_product_items,
  COUNT(DISTINCT product_id) AS num_distinct_products,
  ARRAY_AGG(product_id) as list_of_product_ids
FROM 
    {{ ref('stg_order_items') }}
GROUP BY 
    1

