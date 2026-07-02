with Funnel_with_bonus as (
    SELECT
        bonus_flag,
        count(DISTINCT case when event ='Browse' then user_id end) as browse_users,
        count(DISTINCT case when event ='Purchase' then user_id end) as purchase_users
    from funnel_analysis
    group by bonus_flag
)
SELECT
    bonus_flag,
    browse_users,
    purchase_users,
    Round(purchase_users * 100.0 / NULLIF(browse_users, 0), 2) as conversion
from Funnel_with_bonus
ORDER BY bonus_flag;
