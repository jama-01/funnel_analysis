with analysis_by_device as (
    SELECT
    event,
    count(DISTINCT user_id) as nb_users,
    device,
    case 
    when event = 'Browse' then 1
    when event = 'Add to Cart' then 2
    when event = 'Checkout' then 3
    when event = 'Purchase' then 4  
    end as funnel_step
    from funnel_analysis
    GROUP BY device, event
),

funnel_with_previous as (
    SELECT
        event,
        device,
        nb_users,
        funnel_step,
        lag(nb_users) over (PARTITION BY device ORDER BY funnel_step) as previous_users
    FROM analysis_by_device
)

SELECT
event,
device,
nb_users,
previous_users,
    case 
        WHEN previous_users is null then null
        ELSE Round(nb_users *100.0 / previous_users, 2) 
end as convertion
FROM funnel_with_previous
ORDER BY  device, funnel_step ;