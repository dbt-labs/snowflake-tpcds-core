with 

stores as (
    select * from {{ ref('stg_tpcds_core__store') }}
),

date_dim as (
    
    select * from {{ ref('stg_tpcds_core__date_dim') }}

),

final as (

    select 
        stores.*, 
        date_dim.date as store_closed_date
    
    from stores
    left join date_dim
        on stores.closed_date_sk = date_dim.date_sk

)

select * from final