/* ----Práctica Calificada de MS SQL Server :::: Para esta práctica vamos a utilizar la base de datos Adventure Works 2016 */

--- Elabore el código Transact SQL para resolver los siguientes enunciados ---

--- 1. Se necesita listar los empleados y sus respectivos departamentos en el que laboran. ---
--- 2. Se necesita saber la cantidad de empleados por departamento. ---
--- 3. Se necesita listar las cantidades de ventas realizadas por año. ---
--- 4. Se necesita listar los empleados con su respectivo correo y número de teléfono. ---
--- 5. Se necesita saber la cantidad de ventas atendidas por cada vendedor. ---

---Cada uno de los enunciados deben ser considerados Vistas. ---

/* Se calificará desde su repositorio de GitHub en la que deberán crear una carpeta llamada práctica calificada */

--- * ---
/* Ejercicio 1 */
CREATE VIEW vw_1erEjercicio
AS
SELECT FirstName, MiddleName, LastName, Department
FROM HumanResources.vEmployeeDepartment;

SELECT * FROM vw_1erEjercicio;

/* Ejercicio 2 */
CREATE VIEW vw_2doEjercicio
AS
SELECT 
FROM ;

SELECT * FROM vw_2doEjercicio;

/* Ejercicio 3 */
CREATE VIEW vw_3erEjercicio
AS
SELECT 
FROM ;

SELECT * FROM vw_3erEjercicio;

/* Ejercicio 4 */
CREATE VIEW vw_4toEjercicio
AS
SELECT FirstName, MiddleName, LastName, EmailAddress, PhoneNumber
FROM HumanResources.vEmployee;

SELECT * FROM vw_4toEjercicio;

/* Ejercicio 5 */
CREATE VIEW vw_5toEjercicio
AS
SELECT 
FROM ;

SELECT * FROM vw_5toEjercicio;