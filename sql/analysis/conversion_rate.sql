WITH funnel AS (
    SELECT
        event,
        COUNT(DISTINCT user_id) AS nb_users
    FROM funnel_analysis
    GROUP BY event
)

SELECT
    event,
    nb_users,
    ROUND(
        nb_users * 100.0 /
        (SELECT nb_users FROM funnel WHERE event = 'Browse'),
        2
    ) AS conversion_rate
FROM funnel
ORDER BY nb_users DESC;