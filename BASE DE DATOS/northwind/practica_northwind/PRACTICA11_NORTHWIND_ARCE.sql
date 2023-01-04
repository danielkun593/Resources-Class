--REALICE VISTAS DE LAS SIGUIENTES CONSULTAS
use Northwind;
select*from Suppliers;
select*from Products;
select*from Territories;
select*from Customers;
select*from Employees;
select*from Region; 
select*from Products;
select*from Categories;
select*from Orders;
select*from EmployeeTerritories;

--1. Mostrar los proveedores con los productos que ofrecen
create view [Prove Products] as
select s.CompanyName, p.ProductName from Suppliers s, Products p
where s.SupplierID = p.SupplierID;

--2. Mostrar el listado de los empleados con el territorio y la región a la que pertenecen
create view [Empleado Region] as
select e.FirstName+' '+e.LastName as NamesEmployee, t.TerritoryDescription, r.RegionDescription 
from Employees e, Territories t, Region r, EmployeeTerritories et
where e.EmployeeID = et.EmployeeID and t.TerritoryID = et.TerritoryID and t.RegionID = r.RegionID

--3. Mostrar los clientes con el nombre de la compañía, el nombre del contacto y el número telefónico
create view [Compania Clientes] as
select CompanyName, ContactName, Phone from Customers 

--4. Muestre las categorías de los productos existentes con su código respectivo
create view [ProductosCategoria] as
select p.ProductID, p.ProductName, c.CategoryName, c.CategoryID from Products p, Categories c
where p.CategoryID = c.CategoryID

--5. Muestre los empleados con sus jefes superiores
create view [Empleados jefe] as
select*from Employees

--6. Crear una vista que muestre los datos de los proveedores con los productos q ofrecen y las categorías a las que pertenecen
create view [Proveedor Cat Prod] as
select p.ProductID, p.ProductName, s.CompanyName, c.CategoryName from Products p, Suppliers s, Categories c
where p.SupplierID = s.SupplierID  and p.CategoryID = c.CategoryID

--7. Mostrar la cantidad de ordenes realizadas por los empleados
create view [Cant order employee] as
select e.FirstName, COUNT(OrderID) as CantOrders from Orders o, Employees e
where o.EmployeeID = e.EmployeeID group by e.FirstName

--8. Presentar las compañías de envió y la cantidad de órdenes que han realizados
create view [Company cant orders] as
select c.CompanyName, COUNT(OrderID) as CantOrders from Orders o, Customers c
where o.CustomerID = c.CustomerID group by c.CompanyName

--9. Crear una vista que contenga el número de orden la fecha y el total de cada orden
create view [Order cant details] as
select o.OrderID, o.OrderDate, od.UnitPrice*od.Quantity as Total from Orders o, [Order Details] od 
where o.OrderID = od.OrderID

--10. Mostrar el listado de los empleados el título que tienen el teléfono y el nombre de su jefe.
create view [Empleados jj] as
select e.FirstName, e.Title, e.HomePhone, j.FirstName from Employees e, Employees j where j.EmployeeID = e.ReportsTo and e.ReportsTo is not null;