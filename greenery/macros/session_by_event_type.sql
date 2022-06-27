
{% macro session_by_event_type(input_event_type) %}

{% set event_types=dbt_utils.get_query_results_as_dict(
    "SELECT DISTINCT event_type FROM" ~ ref('stg_events')) %}


{% for event_type in event_types['event_type'] %}
    , MAX(CASE WHEN {{ input_event_type }}='{{event_type}}' THEN 1 ELSE 0 END) AS {{event_type}}_present
{% endfor %}
 
{% endmacro %}