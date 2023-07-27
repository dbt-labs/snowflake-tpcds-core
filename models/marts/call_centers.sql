with 

call_centers as (

    select * from {{ ref('stg_tpcds_core__call_center') }}
    
),

date_dim as (
    
    select * from {{ ref('stg_tpcds_core__date_dim') }}

),

final as (

    select 
        {{ 
            dbt_utils.star(
                from=ref('stg_tpcds_core__call_center'),
                except=['open_date_sk', 'closed_date_sk']
            )
        }},
        opened.date as call_center_opened_date,
        closed.date as call_center_closed_date
    
    from call_centers
    left join date_dim as opened
        on call_centers.open_date_sk = opened.date_sk
    left join date_dim as closed
        on call_centers.closed_date_sk = closed.date_sk

)

select * from final