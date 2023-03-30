{% snapshot STG_USER %}
{{
    config(
      target_database='FACT_DIM_FOR_SALESFORCE_DB',
      target_schema='snapshot',
      unique_key='ID',
      strategy='check',
      check_cols=["USERNAME","COMPANYNAME","CITY","PHONE"]
    )
}}
select ID,USERNAME,COMPANYNAME,PHONE,EMAIL,CITY
 from {{ source('FACT_DIM_STG', 'STG_USER') }}
{% endsnapshot %}






	