{{
    config(
        materialized = 'table'
    )
}}

SELECT
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,
  u.phone_number,
  u.user_created_at,
  u.user_updated_at,
  u.address_id,
  uos.num_orders_per_user,
  uos.total_order_cost_per_user
FROM 
    {{ ref('stg_users') }} AS u
JOIN
    {{ ref ('int_user_order_summary') }} AS uos
USING
    (user_id)