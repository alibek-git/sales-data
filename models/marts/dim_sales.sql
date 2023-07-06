-- model with metrics relevant for building dashboards, grouped by salesperson
SELECT
    salesperson,
    SUM(CASE WHEN activity_type = 'Won' THEN 1 ELSE 0 END) AS total_won,
    ROUND(
        100.0 * SUM(CASE WHEN activity_type = 'Discovery call booked' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN activity_type = 'Registration' THEN 1 ELSE 0 END), 0),
        1
    ) AS registration_to_booked, -- Calculate the conversion rate between the Registration step to Discovery call booked step. 
    ROUND(
        100.0 * SUM(CASE WHEN activity_type = 'Discovery call completed' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN activity_type = 'Discovery call booked' THEN 1 ELSE 0 END), 0),
        1
    ) AS booked_to_completed, -- Calculate the conversion rate between the Discovery call booked step to Discovery call completed step. 
    ROUND(
        100.0 * SUM(CASE WHEN activity_type = 'Proposal' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN activity_type = 'Discovery call completed' THEN 1 ELSE 0 END), 0),
        1
    ) AS completed_to_proposal, -- Calculate the conversion rate between the Discovery call completed step to Proposal step.
    ROUND(
        100.0 * SUM(CASE WHEN activity_type = 'Won' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN activity_type = 'Proposal' THEN 1 ELSE 0 END), 0),
        1
    ) AS proposal_to_won, -- Calculate the conversion rate between the Proposal step to Won step.
    ROUND(
        100.0 * SUM(CASE WHEN activity_type = 'Won' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN activity_type = 'Registration' THEN 1 ELSE 0 END), 0),
        2
    ) AS total_conversion, -- Calculate total conversion: sum of leads with WON status divided by total leads (Registrations)
    ROUND(
        SUM(CASE WHEN activity_type = 'Won' THEN 1 ELSE 0 END)
        / NULLIF(AVG(days_with_company), 0) * 7,
        2
    ) AS deals_closed_per_week, -- How many deals per week does a salesperson closes (wins)

    NULLIF(AVG(days_with_company), 0) AS days_with_company, -- How many days since the salesperson joined the company

    SUM(CASE WHEN activity_type = 'Registration' THEN 1 ELSE 0 END) AS total_leads_received, -- Sum of leads a salesperson received throughout his time at the company

    ROUND(
        AVG(CASE WHEN activity_type = 'Won' THEN time_diff_event_and_joined ELSE NULL END), 2
        ) AS avg_days_won -- How many days does it take for a salesperson to close (win) the deal
        
FROM
    {{ ref("bus_sales_data")}}
GROUP BY
    salesperson
