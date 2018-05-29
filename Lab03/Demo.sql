SELECT * FROM Person.Person

/* Crear Vista */
CREATE VIEW vw_Persona
AS
    SELECT FirstName, LastName
    FROM Person.Person;

/* Usar Vista */
SELECT * FROM vw_Persona;

CREATE VIEW vw_Persona2
AS
    SELECT FirstName, LastName
    FROM Person.Person
    WHERE LastName like 'Adams';

SELECT * FROM vw_Persona2;

CREATE VIEW vw_Persona3
AS
    SELECT
    CONCAT(FirstName, ', ', LastName) AS Datos
FROM Person.Person
WHERE LastName LIKE 'Adams';

SELECT * FROM vw_Persona3;