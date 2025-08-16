--  https://leetcode.com/problems/second-highest-salary/description/

Solution 1 -->

SELECT MAX(salary) as secondHighestSalary
FROM Employee
WHERE salary < (Select Max(salary) FROM Employee)

Solution 2 -->

SELECT (
    SELECT DISTINCT Salary
    FROM Employee
    ORDER BY Salary DESC
    LIMIT 1 OFFSET 1
) AS secondHighestSalary;


Solution 3 -->
SELECT MAX(Salary) AS secondHighestSalary
FROM (
    SELECT Salary,
           DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk
    FROM Employee
) t
WHERE rnk = 2;
