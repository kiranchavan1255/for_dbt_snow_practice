{{
    config(
        materialized='table',
        transient =true,
        alias='CUST_ORDER_TOTAL_PRICE_STG',
        schema='stg'
    )
}}

select O_CUSTKEY, 
        sum(O_TOTALPRICE) as TOTALPRICE
        FROM {{ source('snowflake_sample', 'orders') }}
        GROUP BY O_CUSTKEY