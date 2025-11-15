----Extract the 2nd height number or sales or salary whatever the table we can do it in multiple ways ---

---Using simple and normal way---
create database Test
create table Employees(
Emp_Id int,
Salary float
);
insert into Employees(Emp_Id,Salary)
values(2344,10000);
insert into Employees(Emp_Id,Salary)
values(2539,20000);
insert into Employees(Emp_Id,Salary)
values(2534,30000);

select* from Employees

----Write a solution to find the second highest distinct salary from the Employee table.
---Simple and normal way--
select distinct Salary from Employees
order by Salary desc
offset 1 rows fetch next 1 rows only;---|Here Offset and rows fetch next 1 rows only is uded to extract the 2nd highest value |

----Using Window Functions----
select Salary
from (
	select distinct Salary,
		Row_number() Over(order by Salary Desc) as rn
	  from Employees
	  )t
where rn = 2; ---Returns the 2nd highest value
-------Using subquery----
Select max(Salary) as second_highest_salary
from Employees
where Salary<(Select max(Salary) from Employees);

----how to write by using one more window function Dense_rank()...?---
SELECT Salary
FROM (
  SELECT DISTINCT Salary,
         DENSE_RANK() OVER (ORDER BY Salary DESC) AS dr
  FROM Employees
) t
WHERE dr = 2;
