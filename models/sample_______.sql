
SELECT * from {{ source('FACT_DIM_STG', 'STG_PRODUCT') }}
