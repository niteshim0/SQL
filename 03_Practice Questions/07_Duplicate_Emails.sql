// https://leetcode.com/problems/duplicate-emails/
Select email 
From PERSON
Group By Email
Having count(*)>1

-- Why this works:
-- GROUP BY aggregates by each unique email.
-- HAVING applies a condition after grouping.
-- This returns only emails that appear multiple times.