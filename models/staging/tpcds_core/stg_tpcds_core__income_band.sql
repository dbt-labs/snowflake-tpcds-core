with 

source as (

    select * from {{ source('tpcds_core', 'income_band') }}

),

renamed as (

    select
        ib_income_band_sk as income_band_sk,
        ib_lower_bound as income_band_lower_bound,
        ib_upper_bound as income_band_upper_bound

    from source

)

select * from renamed
