{{
    config(
        materialized = 'table'
    )
}}


WITH events AS (
    SELECT * FROM {{ref('stg_events')}}
),

-- Use to fill in order_id if exist in order
order_ids AS (
    SELECT DISTINCT 
        user_id, 
        session_id,
        order_id AS order_id_fill
    FROM 
        events
    WHERE 
        order_id IS NOT NULL)

SELECT
    e.session_id,
    e.user_id,
    COALESCE(e.order_id,oi.order_id_fill) as order_id,
    MIN(event_created_at) AS session_started_at
    {{ session_by_event_type("event_type") }}
FROM
    events AS e
LEFT JOIN 
    order_ids AS oi
USING 
    (user_id, session_id)

GROUP BY 1,2,3
