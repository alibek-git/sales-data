SELECT
    salesperson,
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
        / COUNT(*), 2
    ) AS total_conversion

FROM
    {{ ref("agg_sales")}}
GROUP BY
    salesperson;
