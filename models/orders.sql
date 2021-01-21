select
    stg_orders.order_id,
    stg_orders.customer_id,
    stg_orders.order_date,
    stg_orders.order_status,
    SUM(amount_usd) as amount_usd
from analytics.dbt_dheres.stg_orders stg_orders
left join analytics.dbt_dheres.stg_payments stg_payments
on stg_orders.order_id = stg_payments.order_id
where stg_payments.payment_status = 'success'
group by
    stg_orders.order_id,
    stg_orders.customer_id,
    stg_orders.order_date,
    stg_orders.order_status
