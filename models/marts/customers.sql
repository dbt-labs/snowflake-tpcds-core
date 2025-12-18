with 

customer_data as (

    select * from {{ ref('stg_tpcds_core__customer') }}

),

customer_demographics_data as (

    select * from {{ ref('stg_tpcds_core__customer_demographics') }}

),

customer_address_data as (

    select * from {{ ref('stg_tpcds_core__customer_address') }}

),

household_demographics_data as (

    select * from {{ ref('stg_tpcds_core__household_demographics') }}

),

income_band_data as (

    select * from {{ ref('stg_tpcds_core__income_band') }}

),

final as (

    select
        customer_data.customer_sk
        , customer_data.salutation
        , customer_data.first_name
        , customer_data.last_name
        , customer_address_data.city
        , customer_address_data.state
        , customer_address_data.country
        , customer_data.email_address
        , customer_data.is_preferred_customer
        , customer_demographics_data.gender
        , customer_demographics_data.marital_status
        , customer_demographics_data.credit_rating
        , household_demographics_data.vehicle_count
        , income_band_data.income_band_lower_bound
        , income_band_data.income_band_upper_bound
    
    from customer_data 
    left join customer_address_data
        on customer_data.current_address_sk = customer_address_data.customer_address_sk
    left join customer_demographics_data
        on customer_data.customer_demographics_sk = customer_demographics_data.customer_demographics_sk
    left join household_demographics_data
        on customer_data.household_demographics_sk = household_demographics_data.household_demographics_sk
    left join income_band_data
        on household_demographics_data.income_band_sk = income_band_data.income_band_sk


)

select * from final