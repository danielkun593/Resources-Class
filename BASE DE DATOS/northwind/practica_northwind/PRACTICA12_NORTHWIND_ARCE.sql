use Northwind

select * from Categories
select * from Products
--1. Crear una vista que seleccione todos los productos que corresponde a la categoría bebidas:
create view [Cat Bebidas] as
select * from Products where CategoryID = 1

--2. Crear una vista que cuente la cantidad de registros que corresponde a condimentos
create view [Cant registro Condiments] as
select COUNT(ProductID) as CantRegister, CategoryID from Products where CategoryID = 2 group by CategoryID;

--3. Crear una vista que seleccione todos los campos de los registros que corresponden a categoría mariscos de la tabla productos.
create view [Register Mariscos] as 
select * from Products where CategoryID = 8

--4. Crear una vista que seleccione los campos nombre del producto y precio (únicamente) de los granos y cereales.
create view [Producto Precio] as 
select ProductName, UnitPrice from Products where CategoryID = 5

--5. Crear una vista que cuente la cantidad de productos cárnicos.
create view [Carnicos] as 
select COUNT(ProductID) as CantProduct, CategoryID from Products where CategoryID = 6 group by CategoryID;

--6. Crear una vista que seleccione los campos nombre del producto y precio (únicamente) de los quesos.
create view [Producto Precio Queso] as 
select ProductName, UnitPrice from Products where CategoryID = 4

--7. Crear una vista que seleccione los campos nombre del producto, precio y stock (únicamente) de las frutas secas.
create view [Producto Precio FrutosSecos] as 
select ProductName, UnitPrice, UnitsInStock from Products where CategoryID = 5

--8. Crear una vista que seleccione el promedio de los precio de los confites
create view [Producto Confetis] as 
select AVG(UnitPrice) as PromPriceConfites from Products where CategoryID = 3