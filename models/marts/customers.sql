with 

customers as (

    select * from {{ ref('stg_tpcds_core__customer') }}

),

customer_demographics as (

    select * from {{ ref('stg_tpcds_core__customer_demographics') }}

),

customer_address as (

    select * from {{ ref('stg_tpcds_core__customer_address') }}

),

household_demographics as (

    select * from {{ ref('stg_tpcds_core__household_demographics') }}

),

income_band as (

    select * from {{ ref('stg_tpcds_core__income_band') }}

),

final as (

    select
        customers.customer_sk
        , customers.salutation
        , customers.first_name
        , customers.last_name
        , customer_address.city
        , customer_address.state
        , customer_address.country
        , customers.email_address
        , customers.is_preferred_customer
        , customer_demographics.gender
        , customer_demographics.marital_status
        , customer_demographics.credit_rating
        , household_demographics.vehicle_count
        , income_band.income_band_lower_bound
        , income_band.income_band_upper_bound
    
    from customers 
    left join customer_address
        on customers.current_address_sk = customer_address.customer_address_sk
    left join customer_demographics
        on customers.customer_demographics_sk = customer_demographics.customer_demographics_sk
    left join household_demographics
        on customers.household_demographics_sk = household_demographics.household_demographics_sk
    left join income_band
        on household_demographics.income_band_sk = income_band.income_band_sk


)

select * from final