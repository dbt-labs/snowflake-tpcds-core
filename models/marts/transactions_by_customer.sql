with 

transactions as (

    select * from {{ ref('snowflake_tpcds_sales_spoke', 'transactions') }}

),

customers as (

    select * from {{ ref('customers') }}

),

final as (

    select 
        customers.customer_sk,
        customers.first_name,
        customers.last_name,
        count(*)
    from customers 
    left join transactions
        on customers.customer_sk = transactions.customer_sk
    
    group by 1, 2, 3


)

select * from final