SELECT player_id,
       MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;


-- MIN(event_date) → gives the earliest login date for each player.
-- GROUP BY player_id → ensures we compute this separately for each player.
-- Result shows each player with their first login date
