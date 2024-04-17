select
    o.orders_id,
    o.date_date,
    round(
        CAST(o.margin AS FLOAT64) + CAST(s.shipping_fee AS FLOAT64) - (CAST(s.logcost AS FLOAT64) + CAST(s.ship_cost AS FLOAT64)), 2
    ) as operational_margin,
    o.quantity,
    o.revenue,
    o.purchase_cost,
    o.margin,
    s.shipping_fee,
    s.logcost,
    s.ship_cost
from {{ ref("int_orders_margin") }} o
left join {{ ref("stg_raw__ship") }} s using (orders_id)
order by orders_id desc
