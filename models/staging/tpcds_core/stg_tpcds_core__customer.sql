with 

source as (

    select * from {{ source('tpcds_core', 'customer') }}
    limit 10000

),

renamed as (

    select
        c_customer_sk as customer_sk,
        c_customer_id as customer_id,
        c_current_cdemo_sk as customer_demographics_sk,
        c_current_hdemo_sk as household_demographics_sk,
        c_current_addr_sk as current_address_sk,
        c_first_shipto_date_sk as first_shipto_date_sk,
        c_first_sales_date_sk as first_sales_date_sk,
        c_salutation as salutation,
        c_first_name as first_name,
        c_last_name as last_name,
        c_preferred_cust_flag as preferred_cust_flag,
        coalesce(preferred_cust_flag, 'N') = 'Y' as is_preferred_customer,
        c_birth_day as birth_day,
        c_birth_month as birth_month,
        c_birth_year as birth_year,
        c_birth_country as birth_country,
        c_login as login,
        c_email_address as email_address,
        c_last_review_date as last_review_date

    from source

)

select * from renamed
