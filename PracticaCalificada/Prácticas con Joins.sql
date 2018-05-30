/* Poner en uso la base de datos */
USE AdventureWorks2016
GO

/* Listado de esquemas pertenecientes a esta base de datos */
SELECT Name
FROM sys.schemas
GO

/* Ver tablas de base de datos en uso */
SELECT Name
FROM sys.tables
GO

/* Ver estructura de una tablaespecífica */
EXEC sp_help 'HumanResources.Employee'
GO

/* Listado de departamentos de la empresa */
SELECT *
FROM HumanResources.Department
GO

/* Visualizar sólo los departamentos que pertenecen al grupo Marketing y Ventas */
SELECT *
FROM HumanResources.Department
WHERE HumanResources.Department.GroupName LIKE 'Sales and Marketing'
GO

/* Ver listado de todos los empleados cuyo estado civil es CASADO */
SELECT HumanResources.Employee.BusinessEntityID AS 'Código de empleado',
HumanResources.Employee.MaritalStatus AS 'Estado Civil'
FROM HumanResources.Employee
WHERE HumanResources.Employee.MaritalStatus like 'M'
GO

/* Ver listado el código de las órdenes de ventas y su respectivo mes del año 2013 */
SELECT Sales.SalesOrderHeader.SalesOrderID AS 'Código de Orden',
DATENAME(MONTH, Sales.SalesOrderHeader.OrderDate) AS 'Mes',
YEAR(Sales.SalesOrderHeader.OrderDate) AS 'Año'
FROM Sales.SalesOrderHeader
WHERE YEAR(Sales.SalesOrderHeader.OrderDate) = 2013
GO

/* Visualizar la cantidad de órdenes de venta del año 2011 */
SELECT YEAR(Sales.SalesOrderHeader.OrderDate) AS 'Año',
COUNT(Sales.SalesOrderHeader.SalesOrderID) AS 'Cantidad'
FROM Sales.SalesOrderHeader
WHERE YEAR(Sales.SalesOrderHeader.OrderDate) = 2011
GROUP BY YEAR(Sales.SalesOrderHeader.OrderDate)
GO

/* Visualizar la cantidad de ventas por mes del año 2011 */
SELECT YEAR(Sales.SalesOrderHeader.OrderDate) AS 'Año',
DATENAME(MONTH, Sales.SalesOrderHeader.OrderDate) AS 'Mes',
COUNT(Sales.SalesOrderHeader.SalesOrderID) AS 'Cantidad'
FROM Sales.SalesOrderHeader
WHERE YEAR(Sales.SalesOrderHeader.OrderDate) = 2011
GROUP BY YEAR(Sales.SalesOrderHeader.OrderDate),
DATENAME(MONTH, Sales.SalesOrderHeader.OrderDate)
GO

/* Cantidad de empleados por Cargo */
SELECT COUNT(HumanResources.Employee.BusinessEntityID) AS 'Total',
HumanResources.Employee.JobTitle AS 'Cargo'
FROM HumanResources.Employee
GROUP BY HumanResources.Employee.JobTitle
ORDER BY COUNT(HumanResources.Employee.BusinessEntityID) DESC
GO

/* Listado de empleados: Nombres, Apellidos y Departamento */
SELECT Person.FirstName AS Nombre, Person.LastName AS Apellido, HumanResources.Department.Name AS Departamento
FROM HumanResources.EmployeeDepartmentHistory
INNER JOIN Person.Person
ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GO

/* Cantidad de empleados por departamento */
SELECT COUNT(HumanResources.EmployeeDepartmentHistory.BusinessEntityID) AS Total,
HumanResources.Department.Name AS Departamento
FROM HumanResources.EmployeeDepartmentHistory
INNER JOIN Person.Person
ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Department.Name
GO


/* Cantidad de empleados por estado civil en cada departamento */
SELECT HumanResources.Department.Name AS 'Departamento',
HumanResources.Employee.MaritalStatus AS 'Estado Civil',
COUNT(HumanResources.Employee.BusinessEntityID) AS 'Cantidad'
FROM HumanResources.Employee
INNER JOIN HumanResources.EmployeeDepartmentHistory
ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Employee.MaritalStatus, HumanResources.EmployeeDepartmentHistory.DepartmentID, HumanResources.Department.Name
GO

/* Nombre, Apellido, Departamento, Estado Civil del empleado */
SELECT Person.FirstName AS Nombre, Person.LastName AS Apellido, HumanResources.Department.Name AS Departamento,
HumanResources.Employee.MaritalStatus AS 'Estado Civil'
FROM HumanResources.EmployeeDepartmentHistory
INNER JOIN Person.Person
ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
INNER JOIN HumanResources.Employee
ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID
GO

/* Listado de clientes que hicieron su orden de compra en los meses de noviembre y diciembre del año 2012 */

/* Cantidad de órdenes de pedido atendidos por cada medio de envío */