-- https://leetcode.com/problems/department-highest-salary/
-- Join + Group By + IN

Select Department.Name as Department , Employee.Name as Employee , Salary
From Employee
Join Department
ON Employee.DepartmentId = Department.id
WHERE(DepartmentId,Salary) IN(
    Select DepartmentId , MAX(Salary) as Salary
    From Employee
    Group By DepartmentId
)

-- Step 1: Find maximum salary per department
-- We first need to know the highest salary inside each department:
SELECT DepartmentId, MAX(Salary) AS MaxSalary
FROM Employee
GROUP BY DepartmentId;

-- Step 2: Match employees with that maximum salary
-- Now we take the (DepartmentId, Salary) pairs from Employee and check if they match (DepartmentId, MaxSalary) we just found.
WHERE (e.DepartmentId, e.Salary) IN (
    SELECT DepartmentId, MAX(Salary)
    FROM Employee
    GROUP BY DepartmentId
);


-- Step 3: Join with Department to show names
-- Finally, we join with the Department table to replace DepartmentId with the actual department name:

JOIN Department d
    ON e.DepartmentId = d.Id
