WITH 
    andy AS (
        SELECT * FROM {{ ref("stg_andy_model")}}
    ),

    dwight AS (
        SELECT * FROM {{ ref("stg_dwight_model")}}
    ),

    jim AS (
        SELECT * FROM {{ ref("stg_jim_model")}}
    ),

    phyllis AS (
        SELECT * FROM {{ ref("stg_phyllis_model")}}
    ),

    stanley AS (
        SELECT * FROM {{ ref("stg_stanley_model")}}
    ),

    final AS (
        SELECT * FROM andy
        UNION ALL
        SELECT * FROM dwight
        UNION ALL
        SELECT * FROM jim
        UNION ALL
        SELECT * FROM phyllis
        UNION ALL
        SELECT * FROM stanley
    )

SELECT *
FROM final
LIMIT 30000
