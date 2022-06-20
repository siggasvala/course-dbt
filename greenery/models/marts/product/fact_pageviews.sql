{{
    config(
        materialized = 'table'
    )
}}

SELECT
    event_id, 
    session_id, 
    user_id, 
    page_url,
    event_created_at,
    order_id,
    product_id
FROM 
    {{ ref('stg_events') }} 
WHERE 
    event_type = 'page_view'