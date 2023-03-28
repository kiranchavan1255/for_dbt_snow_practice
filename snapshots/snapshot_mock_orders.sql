{% snapshot mock_orders %}

{{
    config(
      target_database='analytics',
      target_schema='analytics_dbt_schema_snapshot',
      unique_key='order_id',
      strategy='timestamp',
      updated_at='updated_at'
    )
}}

select * from {{ source('snapshot_demo', 'mock_orders') }}

{% endsnapshot %}





	