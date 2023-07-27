with 

source as (

    select * from {{ source('tpcds_core', 'time_dim') }}

),

renamed as (

    select
        t_time_sk as time_sk,
        t_time_id as time_id,
        t_time as time,
        t_hour as hour,
        t_minute as minute,
        t_second as second,
        t_am_pm as am_pm,
        t_shift as shift,
        t_sub_shift as sub_shift,
        t_meal_time as meal_time

    from source

)

select * from renamed
