select
    id AS payment_id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,
    amount/100 AS amount_USD,
    created
from raw.stripe.payment