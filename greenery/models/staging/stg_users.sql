{{
  config(
    materialized='table'
  )
}}
SELECT
    user_id, 
    first_name, 
    last_name, 
    email, 
    phone_number, 
    created_at AS user_created_at,
    updated_at AS user_updated_at,
    address_id
FROM {{ source('src_greenery', 'users') }}