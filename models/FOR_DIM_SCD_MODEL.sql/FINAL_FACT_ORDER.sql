{{
    config(
        materialized='table'
    )
}}

WITH FACT_ORDER AS
(
    SELECT * FROM {{ ref('FACT_ORDER') }}
)

SELECT ACCOUNT_KEY,SUM(TOTAL_AMOUNT) AS TOTAL_AMOUNT
FROM FACT_ORDER 
GROUP BY 1
ORDER BY 1
