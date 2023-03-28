{% snapshot mock_orders1 %}

{{
    config(
      target_database='analytics',
      target_schema='analytics_dbt_schema_snapshot',
      unique_key='order_id',
      strategy='check',
      check_cols=["status","updated_at"]
    )
}}

select * from {{ source('snapshot_demo', 'mock_orders1') }}

{% endsnapshot %}





	