USE AdventureWorks2016;

SELECT * FROM Person.Address;

/* AND */
SELECT ModifiedDate, City FROM Person.Address
WHERE YEAR(ModifiedDate) = '2014'
AND MONTH(ModifiedDate) = '01'
AND City = 'Beaverton';

/* LIKE */
SELECT AddressLine2 FROM Person.Address
WHERE AddressLine2 like 'B%';

/* NOT */
SELECT * FROM HumanResources.Employee WHERE NOT Gender = 'M';

/* IN */
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE FirstName IN ('Michael');

/* Rangos en AND */
SELECT * FROM HumanResources.Employee WHERE BusinessEntityID >= '10'
AND BusinessEntityID <= '40';

/* OR */
SELECT BusinessEntityID, JobTitle FROM HumanResources.Employee
WHERE BusinessEntityID >= '10' AND BusinessEntityID <= '40'
OR JobTitle like 'V%';