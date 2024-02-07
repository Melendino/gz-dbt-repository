SELECT
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    CAST(purchse_price AS FLOAT64) AS purchse_price,
    ROUND(s.quantity*CAST(p.purchse_price AS FLOAT64),2) AS purchse_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchse_price AS FLOAT64),2) AS margin
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p
        ON s.(product_id) = p.(products_id)