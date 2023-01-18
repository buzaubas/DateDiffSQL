select max(p.UnitPrice) as Price, p.ProductName from Products p group by p.ProductName

select * from Products p order by UnitPrice desc

select * from Products where UnitPrice = (select max(p.UnitPrice) from Products p)

select * from [Order Details]
select * from Customers
select * from Orders
select * from Categories

--select c.CompanyName from Customers as c inner join orders 

select * from Orders o 
join Customers c on o.CustomerID = c.CustomerID
join [Order Details] od on od.OrderID = o.OrderID
join Products p on od.ProductID = p.ProductID
where od.UnitPrice = (select max(d.UnitPrice) from [Order Details] d) --клинет который сделал самый дорогой заказ



create view ProductCategory select p.ProductName, c.CategoryName from Products p join Categories c on p.CategoryID = c.CategoryID -- вьюшка(view) где хранятся название продукта и названия категории

--alter table Products add isDeleted int

CREATE TRIGGER Products_DELETED
ON Products
INSTEAD OF DELETE
AS
UPDATE Products
SET isDeleted = 1
WHERE ProductID = (SELECT ProductID FROM deleted)

delete from Products where ProductID = 1


select * from Products
select * from Categories
select * from [Order Details]

select CategoryName as Category, count(ProductName) 
from Products p join Categories c on p.CategoryID = c.CategoryID
where p.CategoryID = c.CategoryID
group by CategoryName

-- summa zakazov 

select od.UnitPrice * od.Quantity as Total from [Order Details] od
join Products p on p.ProductID = od.ProductID;

select ProductName, CHARINDEX(' ', ProductName) from Products where ProductName like '%c%';

select ProductName, CHARINDEX(' ', ProductName), SUBSTRING(ProductName, 1, CHARINDEX(' ', ProductName)) from Products;

select * from Orders

select datediff(day, select min(getdate(OrderDate)) from Orders, select max(getdate(OrderDate)) from Orders)

select datediff(year, OrderDate, GETDATE()), OrderDate from Orders where CustomerID = 'VINET';

select datediff(year, min(OrderDate), max(OrderDate)) from Orders where CustomerID = 'VINET';
