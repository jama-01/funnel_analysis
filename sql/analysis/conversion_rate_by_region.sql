with analysis_by_region as (SELECT
    event,
    region,
    count(DISTINCT user_id) as nb_users,
    CASE 
        WHEN event='Browse' THEN 1
        WHEN event='Purchase' then 2
    END as funnel_step
    from funnel_analysis
    where event IN('Browse','Purchase')
    GROUP BY region,event
),
funnel_with_previous_users as (SELECT
    event,
    region,
    nb_users,
    funnel_step,
    lag(nb_users)over (PARTITION BY region order by funnel_step) as previous_users
    from analysis_by_region
)
select 
    event,
    region,
    nb_users,
    previous_users,
    CASE 
        WHEN previous_users is NULL THEN  NULL
        ELSE  Round(nb_users * 100 /previous_users , 2)
    END as convertion
    from funnel_with_previous_users
    order by region;