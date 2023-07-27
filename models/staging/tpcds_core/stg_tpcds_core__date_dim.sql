with 

source as (

    select * from {{ source('tpcds_core', 'date_dim') }}

),

renamed as (

    select
        d_date_sk as date_sk,
        d_date_id as date_id,
        d_date as date,
        d_month_seq as month_seq,
        d_week_seq as week_seq,
        d_quarter_seq as quarter_seq,
        d_year as year,
        d_dow as dow,
        d_moy as moy,
        d_dom as dom,
        d_qoy as qoy,
        d_fy_year as fy_year,
        d_fy_quarter_seq as fy_quarter_seq,
        d_fy_week_seq as fy_week_seq,
        d_day_name as day_name,
        d_quarter_name as quarter_name,
        d_holiday as holiday,
        d_weekend as weekend,
        d_following_holiday as following_holiday,
        d_first_dom as first_dom,
        d_last_dom as last_dom,
        d_same_day_ly as same_day_ly,
        d_same_day_lq as same_day_lq,
        d_current_day as current_day,
        d_current_week as current_week,
        d_current_month as current_month,
        d_current_quarter as current_quarter,
        d_current_year as current_year

    from source

)

select * from renamed
