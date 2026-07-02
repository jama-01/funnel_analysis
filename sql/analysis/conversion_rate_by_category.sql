with analysis_by_categorie as (
    SELECT
    event,
    count(DISTINCT user_id) as nb_users,
    product_category,
    case
    when event ='Browse' then 1
    when event ='Purchase' then 2
    end as funnel_step
    from funnel_analysis
    where event IN('Browse','Purchase')
    group by product_category,event
),
funnel_with_previous as (
    SELECT
        event,
        product_category,
        nb_users,
        funnel_step,
        lag(nb_users) over (PARTITION BY product_category ORDER BY funnel_step) as previous_users
    FROM analysis_by_categorie
)
SELECT
event,
product_category,
nb_users,
previous_users,
    case 
        WHEN previous_users is null then null
        ELSE Round(nb_users *100.0 / previous_users, 2) 
end as convertion
FROM funnel_with_previous
ORDER BY  product_category, funnel_step ;