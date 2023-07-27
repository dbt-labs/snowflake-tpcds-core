with 

source as (

    select * from {{ source('tpcds_core', 'store') }}

),

renamed as (

    select
        s_store_sk as store_sk,
        s_store_id as store_id,
        s_rec_start_date as rec_start_date,
        s_rec_end_date as rec_end_date,
        s_closed_date_sk as closed_date_sk,
        s_store_name as store_name,
        s_number_employees as number_employees,
        s_floor_space as floor_space,
        s_hours as hours,
        s_manager as manager,
        s_market_id as market_id,
        s_geography_class as geography_class,
        s_market_desc as market_desc,
        s_market_manager as market_manager,
        s_division_id as division_id,
        s_division_name as division_name,
        s_company_id as company_id,
        s_company_name as company_name,
        s_street_number as street_number,
        s_street_name as street_name,
        s_street_type as street_type,
        s_suite_number as suite_number,
        s_city as city,
        s_county as county,
        s_state as state,
        s_zip as zip,
        s_country as country,
        s_gmt_offset as gmt_offset,
        s_tax_precentage as tax_precentage

    from source

)

select * from renamed
