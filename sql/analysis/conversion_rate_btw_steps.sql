with funnel as (
    select
    event,
    count(DISTINCT user_id) as nb_users, 
    case 
    when event = 'Browse' then 1
    when event = 'Add to Cart' then 2
    when event = 'Checkout' then 3
    when event = 'Purchase' then 4  
    end as funnel_step
    from funnel_analysis
    GROUP BY EVENT
),
funnel_with_previous as (
    SELECT
        event,
        nb_users,
        funnel_step,
        lag(nb_users) over (ORDER BY funnel_step) as previous_users
    FROM funnel
)

SELECT
event,
nb_users,
previous_users,
    case 
        WHEN previous_users is null then null
        ELSE Round(nb_users *100.0 / previous_users, 2) 
end as convertion
FROM funnel_with_previous
ORDER BY funnel_step ASC;