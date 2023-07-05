SELECT *, 
    EXTRACT(DAY FROM CURRENT_DATE - DATE(date_joined)) AS days_with_company, -- number of days a salesperson has been with the company
    TIMESTAMP_DIFF(timestamp, TIMESTAMP(date_joined), DAY) AS time_diff_event_and_joined -- number of days between when the event happening and when the salesperon joined the company
FROM {{ ref("stg_phyllis_model")}}