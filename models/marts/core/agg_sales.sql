-- returns aggregated table that joins all the tables from business models
WITH 
    andy AS (
        SELECT * FROM {{ ref("bus_andy")}}
    ),

    dwight AS (
        SELECT * FROM {{ ref("bus_dwight")}}
    ),

    jim AS (
        SELECT * FROM {{ ref("bus_jim")}}
    ),

    phyllis AS (
        SELECT * FROM {{ ref("bus_phyllis")}}
    ),

    stanley AS (
        SELECT * FROM {{ ref("bus_stanley")}}
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