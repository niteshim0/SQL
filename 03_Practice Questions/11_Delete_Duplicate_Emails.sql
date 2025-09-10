Delete p1
FROM Person p1
JOIN Person p2
ON p1.email  = p2.email
AND p1.id > p2.id


-- Users u1 and Users u2 are two copies of the same table (aliases).
-- ON u1.email = u2.email → matches rows that have the same email.
-- AND u1.id > u2.id → ensures we only pick the duplicate with the higher id (so we keep the lowest id as the original).
-- DELETE u1 → deletes the duplicate row.