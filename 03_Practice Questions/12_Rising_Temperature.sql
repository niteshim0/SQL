Select t.id
From Weather as t , Weather as y
Where DateDiff(t.recordDate,y.recordDate) = 1
And t.temperature > y.temperature



-- FROM Weather AS t, Weather AS y
-- This is the old implicit join syntax (cross join).
-- It pairs every row in t with every row in y.
-- DATEDIFF(t.recordDate, y.recordDate) = 1
-- Ensures that t.recordDate is exactly 1 day after y.recordDate.
-- So each row compares only with the previous day’s row.
-- t.temperature > y.temperature
-- Keeps only those rows where today’s temp (t.temperature) is higher than yesterday’s (y.temperature).
-- SELECT t.id
-- Returns the id of the day when the temperature rose compared to the previous day.

-- Solution - 2

Select t.id
From Weather t
Join Weather y
On DateDiff(t.recordDate,y.recordDate) = 1
And t.temperature > y.temperature


-- FROM Weather t JOIN Weather y
-- This creates pairs of rows (t, y) from the same table.
-- We’re going to compare a row t (today) with another row y (yesterday).
-- DATEDIFF(t.recordDate, y.recordDate) = 1
-- DATEDIFF(a, b) = number of days between a and b.
-- If t.recordDate is exactly 1 day after y.recordDate, the condition is true.
-- This ensures that t is today and y is yesterday.
-- t.temperature > y.temperature
-- Ensures today’s temperature (t.temperature) is higher than yesterday’s (y.temperature).
-- This captures the "rising temperature" condition.
-- SELECT t.id
-- Finally, we only return the id of the row representing today (t), i.e., the day with a rising temperature.