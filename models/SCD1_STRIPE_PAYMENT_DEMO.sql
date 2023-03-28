{{
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
        unique_key = 'ID',
        merge_update_columns = ['STATUS','PAYMENTMETHOD']
    )
}}

SELECT *,CURRENT_TIMESTAMP() AS LAST_UPDATED_TIME FROM {{ source('stripe', 'payment') }}