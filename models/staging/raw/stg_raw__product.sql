with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
        products_id,
        purchSE_PRICE as purchase_price,

    from source

)

select * from renamed
