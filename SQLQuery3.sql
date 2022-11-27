
----------Lesson 4----------

--1
select TblP.ProductID, TblP.CategoryID, TblC.CategoryName
from Products TblP
inner join Categories TblC
on TblP.CategoryID = TblC.CategoryID;

--2
select TblP.ProductID, TblP.ProductName, TblC.CategoryName from Products TblP 
inner join Categories TblC
on TblP.CategoryID = TblC.CategoryID
where TblP.ProductID > 100;

--3
select * from Products
select * from Suppliers

select TblP.ProductName, TblS.CompanyName from Products TblP
inner join Suppliers TblS
on TblP.SupplierID = TblS.SupplierID;

--4
select TblP.ProductName, TblS.CompanyName, TblS.Country from Products TblP
inner join Suppliers TblS
on TblP.SupplierID = TblS.SupplierID
where TblS.Country = 'USA';

--5
select TblP.ProductName, TblS.CompanyName, TblS.Country from Products TblP
inner join Suppliers TblS
on TblP.SupplierID = TblS.SupplierID
where TblS.Country <> 'Germany';

--6
select * from Suppliers 
where Suppliers.HomePage is not NULL

--7
select TblP.ProductName, TblS.HomePage from Products TblP
inner join Suppliers TblS
on TblP.SupplierID = TblS.SupplierID
where TblS.HomePage is not NULL;

--8
select * from Orders

select OrderDate, OrderID from Orders
where OrderID = 10408;

--9
select TblO.OrderID, TblP.ProductName from Orders TblO
inner join  Suppliers TblS on TblO.ShipCountry = TblS.Country
inner join Products TblP on TblP.SupplierID = TblS.SupplierID
where TblO.OrderID = 10408;

--10
select TblOD.OrderID, TblS.CompanyName from [Order Details] TblOD
inner join Products TblP on TblP.ProductID = TblOD.ProductID
inner join Suppliers TblS on TblS.SupplierID = TblP.SupplierID 
where TblOD.OrderID = 10408;


----------Lesson 5----------

--1
create table newTable (productNumber int not null, productName nvarchar(max) not null);

insert into newTable(productNumber, productName)
select P.ProductID, P.ProductName from Orders O
inner join [Order Details] OD on OD.OrderID = O.OrderID
inner join Products P on P.ProductID = OD.ProductID
where O.ShipVia = 1;

select top 10 * from newTable;

drop table newTable;

--2
select O.*, P.ProductName into Order2 from Orders O
inner join [Order Details] OD on OD.OrderID = O.OrderID
inner join Products P on P.ProductID = OD.ProductID
where O.ShipVia = 2;

delete from Order2
where Order2.ShipCity like 'E%' or  Order2.ShipCity like '%e%' or Order2.ShipCity like '%e';

select distinct Order2.ProductName from Order2;

drop table Order2;

--3
select O.OrderID, O.CustomerID, S.CompanyName into OrderA from Orders O
inner join [Order Details] OD on OD.OrderID = O.OrderID
inner join Products P on P.ProductID = OD.ProductID
inner join Suppliers S on S.SupplierID = P.SupplierID
where O.CustomerID like '%A%' or  O.CustomerID like '%A%' or O.CustomerID like '%A';

select distinct OrderA.CompanyName from OrderA
select OrderA.CustomerID from OrderA

drop table OrderA

--4
select C.ContactName, P.ProductName from Products P
inner join [Order Details] OD on OD.ProductID = P.ProductID
inner join Orders O on O.OrderID = OD.OrderID
inner join Customers C on C.CustomerID = O.CustomerID
where P.ProductName like 'L%'

