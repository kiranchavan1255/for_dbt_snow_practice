

{{
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
        unique_key = 'ACCOUNT_ID',
        merge_update_columns = ['ACCOUNT_NAME','EMAIL','PHONE_NO','ADDRESS','COMPANY_NAME']
    )
}}
select * from {{ source('snapshot_demo', 'ACCOUNT') }}

-- SELECT ACCOUNT_ID 
-- ,ACCOUNT_NAME
-- ,EMAIL
-- ,PHONE_NO
-- ,ADDRESS
-- ,COMPANY_NAME FROM {{ source('snapshot_demo', 'ACCOUNT') }}


-- select * from {{ source('FACT_DIM_STG', 'STG_PAYMENT') }}