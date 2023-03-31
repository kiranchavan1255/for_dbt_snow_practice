{% snapshot STG_PRODUCT %}
{{
    config(
      target_database='FACT_DIM_FOR_SALESFORCE_DB',
      target_schema='snapshot',
      unique_key='PRODUCT_ID',
      strategy='check',
      check_cols=["PRODUCT_NAME","PRODUCT_CLASS","PRODUCT_CODE"]
    )
}}
select ID AS PRODUCT_ID,PRODUCTCODE AS PRODUCT_CODE,NAME AS PRODUCT_NAME,PRODUCTCLASS AS PRODUCT_CLASS
 from {{ source('FACT_DIM_STG', 'STG_PRODUCT') }}
{% endsnapshot %}

-- AMOUNT,ACCOUNTID,STATUS,ID




	