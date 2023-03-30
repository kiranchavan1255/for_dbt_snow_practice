{% snapshot STG_PAYMENT %}
{{
    config(
      target_database='FACT_DIM_FOR_SALESFORCE_DB',
      target_schema='snapshot',
      unique_key='PAYMENT_ID',
      strategy='check',
      check_cols=["STATUS","AMOUNT"]
    )
}}
select ID AS PAYMENT_ID,ACCOUNTID AS ACCOUNT_ID,STATUS,AMOUNT
 from {{ source('FACT_DIM_STG', 'STG_PAYMENT') }}
{% endsnapshot %}

AMOUNT,ACCOUNTID,STATUS,ID




	