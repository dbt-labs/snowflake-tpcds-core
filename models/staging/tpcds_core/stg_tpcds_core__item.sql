with 

source as (

    select * from {{ source('tpcds_core', 'item') }}

),

renamed as (

    select
        i_item_sk as item_sk,
        i_item_id as item_id,
        i_rec_start_date as rec_start_date,
        i_rec_end_date as rec_end_date,
        i_item_desc as item_desc,
        i_current_price as current_price,
        i_wholesale_cost as wholesale_cost,
        i_brand_id as brand_id,
        i_brand as brand,
        i_class_id as class_id,
        i_class as class,
        i_category_id as category_id,
        i_category as category,
        i_manufact_id as manufact_id,
        i_manufact as manufact,
        i_size as size,
        i_formulation as formulation,
        i_color as color,
        i_units as units,
        i_container as container,
        i_manager_id as manager_id,
        i_product_name as product_name

    from source

)

select * from renamed
