use Northwind;

alter authorization on database :: Northwind to sa;

--CONSULTAS APLICANDO INNER JOIN A LA BASE DE DATOS DE NORTHWIND
--CONSULTAS SELECT FROM NORMAL
select * from Products;
select * from Suppliers;
select * from Orders;
select * from [Order Details];
select * from Customers;
select * from CustomerCustomerDemo;
select * from CustomerDemographics;
select * from Employees;
select * from EmployeeTerritories;
select * from Categories;
select * from Region;
select * from Territories;
select * from Shippers;



--1) Seleccionar por cada producto el nombre de cada producto y el nombre de cada proveedor.
select Products.SupplierID, Products.ProductName, Suppliers.CompanyName from Products inner join Suppliers on Products.SupplierID=Suppliers.SupplierID;

--2) Seleccionar por cada pedido el id del pedido, la fecha del pedido, el nombre del cliente.
select Orders.OrderID, Orders.OrderDate, Orders.CustomerID from Orders inner join Customers on Orders.CustomerID = Customers.CustomerID;

--3) Seleccionar por cada pedido el id del pedido, la fecha del pedido, el nombre del cliente y el nombre del empleado.
select Orders.OrderID, Orders.OrderDate, Customers.CompanyName, Employees.FirstName+' '+Employees.LastName as Employees from Orders 
inner join Customers on Orders.CustomerID = Customers.CustomerID 
inner join Employees on Orders.EmployeeID = Employees.EmployeeID;

--4) Seleccionar por cada pedido el id del pedido, la fecha del pedido y siempre que tengan la fecha de envío.
select Orders.OrderID, Orders.OrderDate, Orders.ShippedDate from Orders

--5) Seleccionar por cada pedido el id del pedido, la fecha del pedido y la fecha de factura.
select Orders.OrderID, Orders.OrderDate, Orders.RequiredDate from Orders

--6) Seleccionar por cada cliente el total de pedidos realizados por cada uno, 
--todos los clientes seleccionados tienen que tener por lo menos un pedido.

select Customers.CompanyName, COUNT(Orders.OrderID) as Count_Orderss from Customers 
inner join Orders on (Orders.CustomerID = Customers.CustomerID) group by Customers.CustomerID;

--7) Seleccionar por cada cliente el total de pedidos realizados por cada uno en caso de que tengan más de 2 pedidos.