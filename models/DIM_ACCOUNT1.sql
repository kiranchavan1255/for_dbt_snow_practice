
{{
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
        unique_key = 'ACCOUNT_ID',
        merge_update_columns = ['ACCOUNT_NAME','EMAIL','PHONE_NO','ADDRESS','COMPANY_NAME']
    )
}}

select 40000+row_number() OVER (ORDER BY ACCOUNT_ID) AS ACCOUNT_KEY ,* 
        from {{ source('snapshot_demo', 'ACCOUNT') }}
