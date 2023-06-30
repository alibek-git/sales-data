SELECT
    salesperson,
    SUM(CASE WHEN activity_type = 'Won' THEN 1 ELSE 0 END) AS total_won,
    ROUND(
        100.0 * SUM(CASE WHEN activity_type = 'Discovery call booked' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN activity_type = 'Registration' THEN 1 ELSE 0 END), 0),
        1
    ) AS registration_to_booked,

    ROUND(
        100.0 * SUM(CASE WHEN activity_type = 'Discovery call completed' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN activity_type = 'Discovery call booked' THEN 1 ELSE 0 END), 0),
        1
    ) AS booked_to_completed,

    ROUND(
        100.0 * SUM(CASE WHEN activity_type = 'Proposal' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN activity_type = 'Discovery call completed' THEN 1 ELSE 0 END), 0),
        1
    ) AS completed_to_proposal,

    ROUND(
        100.0 * SUM(CASE WHEN activity_type = 'Won' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN activity_type = 'Proposal' THEN 1 ELSE 0 END), 0),
        1
    ) AS proposal_to_won,

    ROUND(
        100.0 * SUM(CASE WHEN activity_type = 'Won' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN activity_type = 'Registration' THEN 1 ELSE 0 END), 0), 2
    ) AS total_conversion,

    ROUND(
        SUM(CASE WHEN activity_type = 'Won' THEN 1 ELSE 0 END)
        / NULLIF(AVG(days_with_company), 0) * 7,
        2
    ) AS deals_closed_per_week,

    NULLIF(AVG(days_with_company), 0) AS days_with_company,

    SUM(CASE WHEN activity_type = 'Registration' THEN 1 ELSE 0 END) AS total_leads_received

FROM
    {{ ref("agg_sales")}}
GROUP BY
    salesperson