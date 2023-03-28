{{
    config(
        materialized='incremental',
        transient=true,
        incremental_strategy='delete+insert',
        pre_hook='delete from {{this}}',
        alias='customer_total_trunc_load'
    )
}}

select *,
current_date() as AS_OF_DT
FROM {{ ref('scd1_demo')}}