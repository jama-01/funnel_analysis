 with channel_funnel as (
    SELECT
        channel,
        count(DISTINCT case when event ='Browse' then user_id end) as browse_users,
        count(DISTINCT case when event ='Purchase' then user_id end) as purchase_users
    from funnel_analysis
    GROUP BY channel
 )
    SELECT
        channel,
        browse_users,
        purchase_users,
        Round(purchase_users *100.0 / browse_users, 2) as conversion
    from channel_funnel
    ORDER BY channel ASC;
    
