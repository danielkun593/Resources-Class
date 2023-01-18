use Northwind

-- class 18/01/2023

--1. Realizar un procedimiento almacenado que devuelva los clientes (Customers) según el país (Country).
create procedure [Empleados Pais] 
@pais varchar(5)
as 
select * from Employees where Country = @pais;

execute [Empleados USA] 'USA';

--2. Crear un procedimiento que determine la cantidad de clientes cuyo identificador (o sea el código) inicia con un determinado carácter. REVISAR
create procedure [Cantidad Customer]
@cantidad varchar(5) as 
select COUNT(CustomerID) as Cantidad, CustomerID from Customers where CustomerID like @cantidad+'%' group by CustomerID;

execute [Cantidad Clientes] 'P'


--3. Realizar un procedimiento que determine la cantidad de registros que un cliente está en la tabla ORDERS. 
create procedure [Cantidad Registro_Ordenes] as
select c.CustomerID, COUNT(o.CustomerID) as CantOrders 
from Customers c, Orders o
where c.CustomerID = o.CustomerID group by c.CustomerID;

execute [Cantidad Registro_Ordenes]


--4. Realizar un procedimiento que seleccione todos los registros de tabla Productos y Categorías a la vez.
select * from Categories
select * from Products

create procedure [Categoria_producto]
as
select *  from Products p inner join Categories c on p.CategoryID = c.CategoryID 

execute [Categoria_producto]

--5. Realizar un procedimiento que obtenga la cantidad de registros que no corresponde a condimentos
select * from Categories

create procedure [Diferente Condimentos] as
select p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock, c.CategoryName 
from Products p, Categories c where p.CategoryID = c.CategoryID and c.CategoryID != 2

execute [Diferente Condimentos]


--6. Realizar un procedimiento que seleccionar los campos nombre del producto y precio (únicamente) de los productos diferentes a cárnicos.
select * from Categories

create procedure [No Queso Carne] as
select p.ProductName, p.UnitPrice from Products p, Categories c 
where p.CategoryID = c.CategoryID and c.CategoryID != 6

execute [No Queso Carne]

--7. Muestre la cantidad de envíos realizados por las empresas de cargas en un año determinado
select * from Shippers
select * from Orders

create procedure [Envio cargadores]
@year int as
select s.CompanyName, COUNT(o.CustomerID) as CantOrders 
from Shippers s, Orders o
where s.ShipperID = o.ShipVia  and  DATEPART(YEAR, o.ShippedDate) = @year group by s.CompanyName;

exec [Envio cargadores] 1997


--8. Presente la cantidad de envíos realizados a un país determinado un año determinado(2parámetros)
select * from Shippers
select * from Orders

create procedure [Envio Pais]
@year int,
@country varchar (10)
as
select s.CompanyName, COUNT(o.CustomerID) as CantOrders 
from Shippers s, Orders o
where s.ShipperID = o.ShipVia  and  DATEPART(YEAR, o.ShippedDate) = @year and o.ShipCountry = @country group by s.CompanyName;

exec [Envio Pais] 1998, France