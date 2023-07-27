with 

source as (

    select * from {{ source('tpcds_core', 'warehouse') }}

),

renamed as (

    select
        w_warehouse_sk as warehouse_sk,
        w_warehouse_id as warehouse_id,
        w_warehouse_name as warehouse_name,
        w_warehouse_sq_ft as warehouse_sq_ft,
        w_street_number as street_number,
        w_street_name as street_name,
        w_street_type as street_type,
        w_suite_number as suite_number,
        w_city as city,
        w_county as county,
        w_state as state,
        w_zip as zip,
        w_country as country,
        w_gmt_offset as gmt_offset

    from source

)

select * from renamed
