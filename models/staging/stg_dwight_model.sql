SELECT *, EXTRACT(DAY FROM CURRENT_DATE - DATE(date_joined)) AS days_with_company
FROM `dbt_azhubekov.stg_dwight_upd`