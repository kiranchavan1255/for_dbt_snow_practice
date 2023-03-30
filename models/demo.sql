
{{
    config(
        materialized='table',
        target_database='FACT_DIM_FOR_SALESFORCE_DB',
        target_schema='DIMENSION'
    )
}}



select ID,USERNAME,COMPANYNAME,PHONE,EMAIL,CITY
 from {{ source('FACT_DIM_STG', 'STG_USER') }}


 






	