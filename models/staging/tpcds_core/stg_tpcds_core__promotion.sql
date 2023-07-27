with 

source as (

    select * from {{ source('tpcds_core', 'promotion') }}

),

renamed as (

    select
        p_promo_sk as promotion_sk,
        p_promo_id as promotion_id,
        p_start_date_sk as start_date_sk,
        p_end_date_sk as end_date_sk,
        p_item_sk as item_sk,
        p_cost as cost,
        p_response_target as response_target,
        p_promo_name as promo_name,
        p_channel_dmail as channel_dmail,
        p_channel_email as channel_email,
        p_channel_catalog as channel_catalog,
        p_channel_tv as channel_tv,
        p_channel_radio as channel_radio,
        p_channel_press as channel_press,
        p_channel_event as channel_event,
        p_channel_demo as channel_demo,
        p_channel_details as channel_details,
        p_purpose as purpose,
        p_discount_active as discount_active

    from source

)

select * from renamed
