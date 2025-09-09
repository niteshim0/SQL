-- https://leetcode.com/problems/customers-who-never-order/
-- Left Join Problem

Select Name as Customers
From Customers
Left Join Orders
On Customers.id = Orders.customerId
Where CustomerId is NULL

-- Why this works:
-- LEFT JOIN returns all records from Customers and matched records from Orders.
-- The WHERE clause filters out customers who have placed orders (i.e., those with a non-NULL CustomerId in Orders).
-- This leaves only customers who have never placed an order. 
-- The result is a list of customers who have never made any orders.

-- Solution 2: Using NOT IN
Select Name as Customers
From Customers
Where id NOT IN (Select customerId From Orders)
