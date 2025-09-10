SELECT 
    t.Request_at AS Day,
    ROUND(
        SUM(CASE WHEN t.Status LIKE 'cancelled%' THEN 1 ELSE 0 END) / COUNT(*), 
        2
    ) AS "Cancellation Rate"
FROM Trips t
JOIN Users c ON t.Client_Id = c.Id AND c.Banned = 'No'
JOIN Users d ON t.Driver_Id = d.Id AND d.Banned = 'No'
GROUP BY t.Request_at
ORDER BY t.Request_at;


-- Filter out banned users
-- Only join trips where both client & driver are not banned.
-- This is done by joining Users twice:
-- Once for Client_Id (c).
-- Once for Driver_Id (d).
-- Identify cancelled trips
-- CASE WHEN t.Status LIKE 'cancelled%' THEN 1 ELSE 0 END
-- This marks cancelled trips as 1, completed as 0.
-- Cancellation rate
-- SUM(cancelled) / COUNT(*) → ratio of cancelled trips to total trips.
-- ROUND(..., 2) → keep only 2 decimals.
-- Group by date
-- We want the rate per day (GROUP BY t.Request_at).
-- Order results
-- Output is sorted by Request_at.