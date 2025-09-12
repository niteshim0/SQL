Select t1.id as ID , t1.company as Company, t1.salary as Salary
FROM Employee t1
JOIN Employee t2
ON t1.company = t2.company
GROUP BY t1.id
HAVING abs(sum(CASE 
            WHEN t2.salary < t1.salary THEN 1 
            WHEN t2.salary > t1.salary THEN -1 
            ELSE 0 
        END)) <= 1

ORDER BY t1.id,t1.company,t1.salary;


-- You self-join within the same company, so every salary is compared against all others in that company.
-- The CASE block counts how many salaries are below vs. above the candidate salary.
-- For the true median:
-- If the company has an odd number of employees → the middle salary will have #below = #above, so the sum = 0.
-- If the company has an even number of employees → the two middle salaries will differ by exactly one, so sum = ±1.
-- The HAVING ABS(SUM(...)) <= 1 condition filters out only those rows.
-- The GROUP BY t1.id ensures each employee row is reduced to a single check.