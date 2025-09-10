// https://leetcode.com/problems/employees-earning-more-than-their-managers/
// Self Join Problem

SELECT e.Name AS Employee
FROM Employees e
JOIN Employees m ON e.ManagerId = m.Id
WHERE e.Salary > m.Salary;


