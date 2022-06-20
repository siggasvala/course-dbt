{{
  config(
    materialized='table'
  )
}}
SELECT
    order_id, 
    product_id, 
    quantity
FROM {{ source('src_greenery', 'order_items') }}