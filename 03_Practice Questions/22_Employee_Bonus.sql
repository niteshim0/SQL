Select name,bonus
From Employee E
Left Join Bonus B
On E.empId = B.empId
Where bonus is NULL or bonus<1000;