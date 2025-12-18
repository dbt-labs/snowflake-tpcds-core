with 

stores as (
    select * from {{ ref('stg_tpcds_core__store') }}
),

date_dim as (
    
    select * from {{ ref('stg_tpcds_core__date_dim') }}

),

final as (

    select 
        store_sk,
        store_id,
        rec_start_date,
        rec_end_date,
        closed_date_sk,
        store_name,
        number_employees,
        floor_space,
        hours,
        manager,
        market_id,
        geography_class,
        market_desc,
        market_manager,
        division_id,
        division_name,
        company_id,
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
        cast(tax_precentage as number(5,2)) as tax_precentage,
        date_dim.date as store_closed_date
    
    from stores
    left join date_dim
        on stores.closed_date_sk = date_dim.date_sk

)

select * from final