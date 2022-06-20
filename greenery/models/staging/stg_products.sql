{{
  config(
    materialized='table'
  )
}}
SELECT
    product_id, 
    name AS product_name, 
    price AS product_price, 
    inventory AS product_inventory
FROM {{ source('greenery', 'products') }}