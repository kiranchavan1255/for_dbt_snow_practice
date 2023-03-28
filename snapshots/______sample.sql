
WITH ORDERS_TABLE AS(
select ORDER_ID,STATUS,CREATED_AT,UPDATED_AT from {{ source('snapshot_target', 'mock_orders2') }}
 ) ,

ORDERS_TABLE_STATUS AS (
    SELECT *,(CASE WHEN OT.DBT_VALID_TO IS NULL THEN 'TRUE' ELSE 'FALSE' END) AS STATUS_3 FROM ORDERS_TABLE OT
)
SELECT * FROM ORDERS_TABLE_STATUS





	