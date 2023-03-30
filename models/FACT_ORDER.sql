WITH DIM_DATE AS(
SELECT * FROM {{ source('raw_database_source', 'DIM_DATE') }}
),
DIM_ACCOUNT AS(
SELECT * FROM {{ source('raw_database_source', 'DIM_ACCOUNT') }}
),
DIM_USER AS(
SELECT * FROM {{ source('raw_database_source', 'DIM_USER') }}
) ,
ORDERS AS (
SELECT * FROM {{ source('raw_database_source', 'ORDERS') }}
),
FACT_ORDER AS (
    SELECT U.USER_KEY,
           A.ACCOUNT_KEY,
            D.DATE_KEY AS CREATED_DATE_KEY,
            O.ORDER_ID,
            O.TOTALAMOUNT AS TOTAL_AMOUNT

    FROM DIM_USER U,DIM_ACCOUNT A,DIM_DATE D,ORDERS O

    WHERE O.OWNERID = U.USER_ID 
     AND     O.ACCOUNTID = A.ACCOUNT_ID
      AND    O.DATE_KEY =D.DATE_KEY
    )
SELECT * FROM FACT_ORDER