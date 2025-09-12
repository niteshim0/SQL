SELECT m.name
FROM Employee m
JOIN Employee e
  ON m.id = e.managerId
GROUP BY m.id, m.name
HAVING COUNT(e.id) >= 5;

-- Self join
-- Employee m = potential managers.
-- Employee e = their direct reports.
-- m.id = e.managerId links manager to report.
-- Group by manager
-- Count how many employees (e.id) each manager directly manages.
-- Filter with HAVING
-- Keep only those with >= 5.


Select name 
From Employee
Where id in(
    Select managerId
    From Employee
    Group By managerId
    Having COUNT(*)>=5
)