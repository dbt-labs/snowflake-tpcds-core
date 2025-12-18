with 

call_centers as (

    select * from {{ ref('stg_tpcds_core__call_center') }}
    
),

date_dim as (
    
    select * from {{ ref('stg_tpcds_core__date_dim') }}

),

final as (

    select 
        call_center_sk,
        call_center_id,
        rec_start_date,
        rec_end_date,
        name,
        class,
        employees,
        sq_ft,
        hours,
        manager,
        mkt_id,
        mkt_class,
        mkt_desc,
        market_manager,
        division,
        division_name,
        company,
        company_name,
        street_number,
        street_name,
        street_type,
        suite_number,
        city,
        county,
        state,
        zip,
        country,
        cast(gmt_offset as number(5,2)) as gmt_offset,
        cast(tax_percentage as number(5,2)) as tax_percentage,
        opened.date as call_center_opened_date,
        closed.date as call_center_closed_date
    
    from call_centers
    left join date_dim as opened
        on call_centers.open_date_sk = opened.date_sk
    left join date_dim as closed
        on call_centers.closed_date_sk = closed.date_sk

)

select * from final