with 

source as (

    select * from {{ source('tpcds_core', 'web_site') }}

),

renamed as (

    select
        web_site_sk,
        web_site_id as web_site_id,
        web_rec_start_date as web_rec_start_date,
        web_rec_end_date as web_rec_end_date,
        web_name as web_name,
        web_open_date_sk as web_open_date_sk,
        web_close_date_sk as web_close_date_sk,
        web_class as web_class,
        web_manager as web_manager,
        web_mkt_id as web_mkt_id,
        web_mkt_class as web_mkt_class,
        web_mkt_desc as web_mkt_desc,
        web_market_manager as web_market_manager,
        web_company_id as web_company_id,
        web_company_name as web_company_name,
        web_street_number as web_street_number,
        web_street_name as web_street_name,
        web_street_type as web_street_type,
        web_suite_number as web_suite_number,
        web_city as web_city,
        web_county as web_county,
        web_state as web_state,
        web_zip as web_zip,
        web_country as web_country,
        web_gmt_offset as web_gmt_offset,
        web_tax_percentage as web_tax_percentage

    from source

)

select * from renamed
