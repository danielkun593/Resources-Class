use Northwind

--EXPLICACION
--PROCEDIMIENTO NO ALMACENADO
create procedure [Ejemplo1] as select * from Products  -- procedimiento que NO recibe parametro
execute [Ejemplo1]  -- comadno para ejecutar procedimientos almacenados
alter procedure [Ejemplo1] as select * from Products

--PROCEDIMIENTO ALMACENADO
create procedure [Ejemplo2] -- procedimiento que SI recibe parametro
@nom_product varchar(30) as select * from Products where name = @nom_product
execute [Ejemplo1]  -- comadno para ejecutar procedimientos almacenados

--EJERCICIOS

--1. Crear un procedimiento que permita consultar a los empleados que son de USA
create procedure [Empleados USA] 
@pais varchar(5)
as 
select * from Employees where Country = @pais;

execute [Empleados USA] 'USA';

--2. Ingrese por parámetro el país y devuelva todos los clientes con sus pedidos de ese respectivo “Pais” ingresado
create procedure [Clientes Pedidos] 
@pais varchar(20)
as 
select c.CustomerID, c.CompanyName, o.OrderID, o.ShipCountry from Customers c, Orders o 
where c.CustomerID = o.CustomerID and c.Country = @pais;

execute [Clientes Pedidos] 'Mexico';

-- 3. Todos los productos que inicien con un carácter (o varios) en especial
create procedure [Producto Caracter]
@caracter varchar(5) as 
select * from Products where ProductName like @caracter+'%';

execute [Producto Caracter] 'Pav'

--4. Realizar un procedimiento almacenado que devuelva los clientes (Customers) según el país (Country) que se ingrese.
create procedure [Clientes Pais] 
@pais varchar(20)
as 
select * from Customers 
where Country = @pais;

execute [Clientes Pais] 'Mexico';

--5. Crear un procedimiento que determine la cantidad de clientes cuyo identificador (o sea el código) inicia con un determinado carácter.
create procedure [Cantidad Clientes]
@cantidad varchar(5) as 
select COUNT(CustomerID) as Cantidad, CustomerID from Customers where CustomerID like @cantidad+'%' group by CustomerID;

execute [Cantidad Clientes] 'P'

--6.  Realizar un procedimiento que determine la cantidad de registros que un cliente tiene en la tabla ORDERS. Ingrese el id del cliente. 
create procedure [Cantidad Registro Ordenes]
@id varchar(15) as
select c.CustomerID, COUNT(o.CustomerID) as CantOrders 
from Customers c, Orders o
where c.CustomerID = o.CustomerID and c.CustomerID = @id group by c.CustomerID;

execute [Cantidad Registro Ordenes] 'ALFKI'

--7. Realizar un procedimiento que seleccione todos los registros de tabla Productos dependiendo de la Categoría ingresada.
select * from Categories

create procedure [Categoria producto]
@categoria varchar(30) as
select p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock, c.CategoryName 
from Products p, Categories c where p.CategoryID = c.CategoryID and c.CategoryName = @categoria

execute [Categoria producto] 'Condiments'

--8. Realizar un procedimiento que seleccione todos los productos que no corresponde a la categoría bebidas (1)
select * from Categories

create procedure [Diferente bebida] as
select p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock, c.CategoryName 
from Products p, Categories c where p.CategoryID = c.CategoryID and c.CategoryID != 1

execute [Diferente bebida]

--9. Realizar un procedimiento que seleccione todos los campos de los registros que no corresponden a categoría mariscos de la tabla productos.
select * from Categories

create procedure [Diferente mariscos] as
select p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock, c.CategoryName 
from Products p, Categories c where p.CategoryID = c.CategoryID and c.CategoryID != 8

execute [Diferente mariscos]

--10. Realizar un procedimiento que obtenga la cantidad de productos granos y cereales.
select * from Products
select * from Categories

create procedure [Cantidad Grano Cereal] as
select c.CategoryName, COUNT(p.ProductID) as CantName 
from Categories c, Products p where c.CategoryID = p.CategoryID and c.CategoryID = 5 group by c.CategoryName;

exec [Cantidad Grano Cereal]

--11. Realizar un procedimiento que seleccionar los campos nombre del producto y precio (únicamente) de los quesos y productos cárnicos.
select * from Categories

create procedure [Queso Lacteo] as
select p.ProductName, p.UnitPrice from Products p, Categories c 
where p.CategoryID = c.CategoryID and c.CategoryID = 6

execute [Queso Lacteo]

--12. Realizar un procedimiento que seleccionar los campos nombre del producto, precio y stock (únicamente) de las frutas secas y mariscos.
select * from Categories

create procedure [Fruto Seco Marisco] as
select p.ProductName, p.UnitPrice, p.UnitsInStock from Products p, Categories c 
where p.CategoryID = c.CategoryID and c.CategoryID = 6 or c.CategoryID = 8;

execute [Fruto Seco Marisco]

--13. Realizar un procedimiento que seleccionar el promedio de los precios de los confites(dulces).
select * from Categories

create procedure [Confites promedio] as
select AVG(p.UnitPrice) as PromConfities from Products p, Categories c 
where p.CategoryID = c.CategoryID and c.CategoryID = 3;

execute [Confites promedio]