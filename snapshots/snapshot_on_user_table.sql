{% snapshot USER %}

{{
    config(
      target_database='analytics',
      target_schema='analytics_dbt_schema_snapshot',
      unique_key='USER_ID',
      strategy='check',
      check_cols=["EMP_ID","USER_NAME","EMAIL","PHONE_NO","COMPANY_NAME","ADDRESS"]
    )
}}

select * from {{ source('snapshot_demo', 'USER') }}

{% endsnapshot %}





	