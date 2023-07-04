SELECT *, 
        EXTRACT(DAY FROM CURRENT_DATE - DATE(date_joined)) AS days_with_company,
        TIMESTAMP_DIFF(timestamp, TIMESTAMP(date_joined), DAY) AS time_diff_event_and_joined
FROM `dbt_azhubekov.stg_jim_upd`