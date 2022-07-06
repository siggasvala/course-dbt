{{
    config(
        materialized='incremental',
        unique_key='timestamp_run'
    )
}}


WITH fact_session_order AS (
    SELECT * FROM {{ref('fact_session_order')}}
),

count_per_event_type AS (
    SELECT
        CAST(COUNT(session_id) AS FLOAT) AS num_sessions,
        CAST(SUM(page_view_present) AS FLOAT) AS num_sessions_page_view,
        CAST(SUM(add_to_cart_present) AS FLOAT) AS num_sessions_add_to_cart,
        CAST(SUM(checkout_present) AS FLOAT) AS num_sessions_checkout
    FROM 
        fact_session_order
)

SELECT
    CURRENT_TIMESTAMP AS timestamp_run,
    num_sessions,
    num_sessions_page_view,
    num_sessions_add_to_cart,
    num_sessions_checkout,
    (num_sessions_page_view/num_sessions)*100 as perc_page_views,
    (num_sessions_add_to_cart/num_sessions)*100 as perc_add_to_cart,
    (num_sessions_checkout/num_sessions)*100 as perc_checkout
FROM 
    count_per_event_type