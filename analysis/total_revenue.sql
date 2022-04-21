with payments as (
select * from {{ source('stripe','payment') }}
),

aggregated as (
select
sum(amount) as total_revenue
from payments
where status = 'success'
)

select * from aggregated