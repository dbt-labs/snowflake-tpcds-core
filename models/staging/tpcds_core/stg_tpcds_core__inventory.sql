with 

source as (

    select * from {{ source('tpcds_core', 'inventory') }}
    limit 100000

),

renamed as (

    select
        {{
            dbt_utils.generate_surrogate_key(
                [
                    'inv_date_sk',
                    'inv_item_sk',
                    'inv_warehouse_sk'
                ]
            )
        }} as inventory_sk, 
        inv_date_sk as date_sk,
        inv_item_sk as item_sk,
        inv_warehouse_sk as warehouse_sk,
        inv_quantity_on_hand as quantity_on_hand

    from source

)

select * from renamed
