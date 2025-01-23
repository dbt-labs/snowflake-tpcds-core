WITH stg_tpcds_core__customer_demographics AS (
  SELECT
    *
  FROM {{ ref('stg_tpcds_core__customer_demographics') }}
), stg_tpcds_core__customer AS (
  SELECT
    *
  FROM {{ ref('stg_tpcds_core__customer') }}
), stg_tpcds_core__customer_address AS (
  SELECT
    *
  FROM {{ ref('stg_tpcds_core__customer_address') }}
), join_1 AS (
  SELECT
    stg_tpcds_core__customer.CUSTOMER_SK,
    stg_tpcds_core__customer.CUSTOMER_ID,
    stg_tpcds_core__customer.CUSTOMER_DEMOGRAPHICS_SK,
    stg_tpcds_core__customer.FIRST_NAME,
    stg_tpcds_core__customer.LAST_NAME,
    stg_tpcds_core__customer_demographics.GENDER,
    stg_tpcds_core__customer_demographics.MARITAL_STATUS,
    stg_tpcds_core__customer.CURRENT_ADDRESS_SK
  FROM stg_tpcds_core__customer
  LEFT JOIN stg_tpcds_core__customer_demographics
    ON stg_tpcds_core__customer.CUSTOMER_DEMOGRAPHICS_SK = stg_tpcds_core__customer_demographics.CUSTOMER_DEMOGRAPHICS_SK
), join_2 AS (
  SELECT
    join_1.CUSTOMER_SK,
    join_1.CUSTOMER_ID,
    join_1.CUSTOMER_DEMOGRAPHICS_SK,
    join_1.FIRST_NAME,
    join_1.LAST_NAME,
    join_1.GENDER,
    join_1.MARITAL_STATUS,
    stg_tpcds_core__customer_address.STREET_NUMBER,
    stg_tpcds_core__customer_address.STREET_NAME,
    stg_tpcds_core__customer_address.STATE,
    stg_tpcds_core__customer_address.CITY,
    join_1.CURRENT_ADDRESS_SK,
    stg_tpcds_core__customer_address.CUSTOMER_ADDRESS_SK
  FROM join_1
  LEFT JOIN stg_tpcds_core__customer_address
    ON join_1.CURRENT_ADDRESS_SK = stg_tpcds_core__customer_address.CUSTOMER_ADDRESS_SK
)
SELECT
  *
FROM join_2