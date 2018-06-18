/* Poner en uso la base de datos */
Use AdventureWorks2016
GO

/*Nombre, apellido, departamento, estado civil de empleado*/
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
SELECT CONCAT(Person.LastName, ', ',Person.FirstName) AS Cliente,
    CONCAT(MONTH(OrderDate),'/',YEAR(OrderDate)) AS 'Mes Y Año'
FROM Sales.SalesOrderHeader
    INNER JOIN Sales.Customer
    ON Sales.SalesOrderHeader.CustomerID = Sales.Customer.CustomerID
    INNER JOIN Person.Person
    ON Customer.PersonID = Person.BusinessEntityID
WHERE YEAR(OrderDate) = 2012 AND (MONTH(OrderDate) BETWEEN 11 AND 12)
GO

/* Cantidad de órdenes de pedido atendidos por cada medio de envío */
SELECT Purchasing.ShipMethod.Name AS 'Medio de envío',
    COUNT(Purchasing.ShipMethod.Name) AS 'Cantidad'
FROM Sales.SalesOrderHeader
    INNER JOIN Purchasing.ShipMethod
    ON Sales.SalesOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
GROUP BY Purchasing.ShipMethod.Name
GO

/* Cantidad de ventas realizadas de acuerdo al país */
SELECT País=
    CASE
    WHEN Sales.SalesTerritory.CountryRegionCode = 'AU' THEN 'Australia'
    WHEN Sales.SalesTerritory.CountryRegionCode = 'US' THEN 'Estados Unidos'
    WHEN Sales.SalesTerritory.CountryRegionCode = 'DE' THEN 'Alemania'
    WHEN Sales.SalesTerritory.CountryRegionCode = 'FR' THEN 'Francia'
    WHEN Sales.SalesTerritory.CountryRegionCode = 'GB' THEN 'Inglaterra'
    WHEN Sales.SalesTerritory.CountryRegionCode = 'CA' THEN 'Canadá'
    END,
    /*Sales.SalesTerritory.Name AS Estado,*/
    COUNT(Sales.SalesTerritory.CountryRegionCode) AS Cantidad
FROM Sales.SalesOrderHeader
    INNER JOIN Sales.SalesTerritory
    ON Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID
GROUP BY Sales.SalesTerritory.CountryRegionCode, Sales.SalesTerritory.Name
ORDER BY Sales.SalesTerritory.CountryRegionCode
GO