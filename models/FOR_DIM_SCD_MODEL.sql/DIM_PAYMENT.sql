{{
    config(
        materialized='table'
    )
}}

WITH SNAPSHOT_TABLE AS (
SELECT  50000+row_number() OVER (ORDER BY PAYMENT_ID) AS PAYMENT_KEY ,* FROM {{ ref('STG_PAYMENT') }}
)
SELECT PAYMENT_KEY,ACCOUNT_ID,STATUS AS PAYMENT_STATUS,AMOUNT,DBT_VALID_FROM
         AS EFFECTIVE_FROM ,DBT_VALID_TO AS EFFECTIVE_TO,
         (CASE WHEN ST.DBT_VALID_TO IS NULL THEN 'TRUE' ELSE 'FALSE' END) AS STATUS
          FROM SNAPSHOT_TABLE ST

-- SELECT * FROM {{ ref('STG_PAYMENT') }}
-- PAYMENT_ID
-- ACCOUNT_ID
-- STATUS
-- AMOUNT
-- DBT_SCD_ID
-- DBT_UPDATED_AT
-- DBT_VALID_FROM
-- DBT_VALID_TO