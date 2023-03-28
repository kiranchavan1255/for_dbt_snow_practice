{% snapshot mock_orders2 %}

{{
    config(
      target_database='analytics',
      target_schema='analytics_dbt_schema_snapshot',
      unique_key='order_id',
      strategy='check',
      check_cols=["status","updated_at"]
    )
}}


WITH ORDERS_TABLE AS(
select ORDER_ID,STATUS,CREATED_AT,UPDATED_AT,DBT_VALID_TO from {{ source('snapshot_target', 'mock_orders2') }}
 ) ,

ORDERS_TABLE_STATUS AS (
    SELECT ORDER_ID,STATUS,CREATED_AT,UPDATED_AT, (CASE WHEN OT.DBT_VALID_TO IS NULL THEN 'TRUE' ELSE 'FALSE' END) AS STATUS_3 FROM ORDERS_TABLE OT
),

SOURCE_ORDER_TABLE AS(
    SELECT ORDER_ID,STATUS,CREATED_AT,UPDATED_AT, NULL as STATUS_3  FROM {{ source('snapshot_demo', 'mock_orders2') }}
)
,


FINAL_SELECT_TABLE AS(
SELECT DISTINCT(ST.ORDER_ID),ST.STATUS,ST.CREATED_AT,ST.UPDATED_AT,OT.STATUS_3 FROM ORDERS_TABLE_STATUS OT
RIGHT JOIN SOURCE_ORDER_TABLE ST
ON OT.ORDER_ID=ST.ORDER_ID
),

SELECT_WITH_NULL_STATUS_TABLE AS (
    SELECT ORDER_ID,STATUS, CREATED_AT,UPDATED_AT ,'TRUE' AS STATUS_3 FROM FINAL_SELECT_TABLE
    WHERE STATUS_3 IS NULL
),

SELECT_WITHOUT_NULL_STATUS_TABLE AS (
    SELECT * FROM FINAL_SELECT_TABLE 
    WHERE STATUS_3 IS NOT NULL
),

FINAL_UNION_TABLE AS (
    SELECT * FROM SELECT_WITH_NULL_STATUS_TABLE
    UNION ALL
    SELECT * FROM SELECT_WITHOUT_NULL_STATUS_TABLE
)

SELECT * FROM FINAL_UNION_TABLE

{% endsnapshot %}

