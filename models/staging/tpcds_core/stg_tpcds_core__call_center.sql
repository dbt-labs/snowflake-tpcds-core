with 

source as (

    select * from {{ source('tpcds_core', 'call_center') }}
    limit 100

),

renamed as (

    select
        cc_call_center_sk as call_center_sk,
        cc_call_center_id as call_center_id,
        cc_rec_start_date as rec_start_date,
        cc_rec_end_date as rec_end_date,
        cc_closed_date_sk as closed_date_sk,
        cc_open_date_sk as open_date_sk,
        cc_name as name,
        cc_class as class,
        cc_employees as employees,
        cc_sq_ft as sq_ft,
        cc_hours as hours,
        cc_manager as manager,
        cc_mkt_id as mkt_id,
        cc_mkt_class as mkt_class,
        cc_mkt_desc as mkt_desc,
        cc_market_manager as market_manager,
        cc_division as division,
        cc_division_name as division_name,
        cc_company as company,
        cc_company_name as company_name,
        cc_street_number as street_number,
        cc_street_name as street_name,
        cc_street_type as street_type,
        cc_suite_number as suite_number,
        cc_city as city,
        cc_county as county,
        cc_state as state,
        cc_zip as zip,
        cc_country as country,
        cc_gmt_offset as gmt_offset,
        cc_tax_percentage as tax_percentage

    from source

)

select * from renamed
