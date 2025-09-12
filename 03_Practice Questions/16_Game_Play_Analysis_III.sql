SELECT t1.player_id, t1.event_date,SUM(t2.games_played) as games_played_so_far
FROM Activity t1
JOIN Activity t2
ON t1.player_id = t2.player_id
AND t2.event_date >= t1.event_date
GROUP BY t1.player_id, t1.event_date


-- Self Join (Activity t1 with Activity t2)
-- You’re joining the table with itself on player_id.
-- Condition: t2.event_date >= t1.event_date.
-- This means: for each row t1, you grab all rows of the same player (t2) that happened on or after that date.
-- Example:
-- If t1 = (player 1, 2016-03-01), then t2 will include (2016-03-01, 2016-05-02, …).
-- Aggregation (SUM(t2.games_played))
-- For each (t1.player_id, t1.event_date) pair, you sum up the games_played of all t2 rows that matched.
-- Effectively → cumulative total of games played from that date forward.
-- GROUP BY t1.player_id, t1.event_date
-- Ensures you get one row per (player, date) in the original table t1.