with 

source as (

    select * from {{ source('tpcds_core', 'customer_address') }}
    limit 10000

),

renamed as (

    select
        ca_address_id as customer_address_id,
        ca_address_sk as customer_address_sk,        
        ca_street_number as street_number,
        ca_street_name as street_name,
        ca_street_type as street_type,
        ca_suite_number as suite_number,
        ca_city as city,
        ca_county as county,
        ca_state as state,
        ca_zip as zip,
        ca_country as country,
        ca_gmt_offset as gmt_offset,
        ca_location_type as location_type

    from source

)

select * from renamed
