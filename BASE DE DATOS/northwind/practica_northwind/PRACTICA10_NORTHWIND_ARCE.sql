use Northwind;

--ARCE ARCE DANIEL - BD COMPLEXIVO - 10SB
-- CONSULTAS GENERALES DE LAS TABLAS
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM [Order Details];
SELECT * FROM Categories;
SELECT * FROM Customers;
SELECT * FROM Employees;

--1. Presente los productos que tengan categoría 2, 4 y 6
SELECT * FROM Products 
WHERE CategoryID = 2 OR CategoryID = 4 OR CategoryID = 6;

--2. Obtener todos los productos, cuyo nombre comienzan con la letra P y tienen un precio unitario comprendido entre 10 y 120:
SELECT * FROM Products 
WHERE (UnitPrice >10 AND UnitPrice < 120) AND ProductName like 'P%';

--3. Obtener todos los productos descontinuados y sin stock, que pertenecen a la categoría 1, 3, 4 y 7.
SELECT * FROM Products 
WHERE CategoryID = 1 OR CategoryID = 3 OR CategoryID = 4 OR CategoryID = 7 AND (Discontinued = 0 AND UnitsInStock = 0);

--4. Obtener todas las órdenes hechas por el empleado con código: 2, 5 y 7 en el año 1996
SELECT * FROM Orders o, Employees e 
WHERE (o.EmployeeID = 2 OR o.EmployeeID = 5 OR o.EmployeeID = 7) AND YEAR(OrderDate) = '1996' AND (o.EmployeeID = e.EmployeeID);

--5. Seleccionar todos los clientes que cuenten con Fax
SELECT * FROM Customers WHERE Fax IS NOT NULL;

--6. Seleccionar todos los nombres de los empleados y los nombres de sus jefes.

--7. Seleccionar todos los campos de los productos descontinuados, que pertenezcan a los proveedores con códigos: 1, 3, 7, 8 y 9, que tengan stock en almacén, y al mismo tiempo que sus precios unitarios estén entre 39 y 190, ordenados por código de proveedores y precio unitario de manera ascendente.
SELECT * FROM Products 
WHERE (SupplierID = 1 OR SupplierID = 3 OR SupplierID = 4 OR SupplierID = 7 OR SupplierID = 8 OR SupplierID = 9) AND Discontinued = 1 ORDER BY UnitPrice ASC; 

--8. Seleccionar los 7 productos con precio más caro, que cuenten con stock en almacén.
SELECT TOP 7 * FROM Products WHERE UnitsInStock > 0 ORDER BY UnitPrice DESC;

--9. Seleccionar los 9 productos, con menos stock en almacén, que pertenezcan la categoria 3, 5 y 8.
SELECT TOP 10 * FROM Products WHERE UnitsInStock < 20 AND (CategoryID = 3 OR CategoryID = 5 OR CategoryID = 8);

--10. Seleccionar las órdenes de compra, realizadas por el empleado con código entre el 2 y 5, además de los clientes con código que comienzan con las letras de la A hasta la G, del 31 de julio de cualquier año.
SELECT * FROM Orders WHERE (EmployeeID = 2 OR EmployeeID = 5) AND CustomerID LIKE 'A%';

--11. Seleccionar las órdenes de compra, realizadas por el empleado con código 3,de cualquier año pero solo de los úlimos 5 meses (agosto-Diciembre)

--12. MOSTRAR EL NUMERO, MAXIMO Y MININO POR CATEGORIA DE LOS PRECIOS

--13. MOSTRAR AL EMPLEADO Y EL NUMERO DE ORDENES QUE HA REALIZADO

--14. MOSTRAR: CUANTAS ORDENES A REALIZADO CADA EMPLEADO(MOSTRAR EL NOMBRE, APELLIDOS Y NUMERO DE PEDIDOS) QUE SEAN MAYORES A 100

--15. MOSTRAR CUANTOS PRODUCTOS A COMPRADO CADA UNO DE LOS CLIENTES (MOSTRAR EL NOMBRE DEL CLIENTE)

--16. MOSTAR EL TOTAL PAGADO POR CADA ORDEN DE COMPRAS SOLO DEL MES DE ENERO DEL 1996