

{{
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
        unique_key = 'ACCOUNT_ID',
        merge_update_columns = ['ACCOUNT_NAME','EMAIL','PHONE_NO','ADDRESS','COMPANY_NAME']
    )
}}
select * from {{ source('snapshot_demo', 'ACCOUNT') }}