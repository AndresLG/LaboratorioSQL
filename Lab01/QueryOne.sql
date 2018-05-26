/* Crear una BD en Blanco */
CREATE DATABASE HospitalHHH;
GO

/* Necesito visualizar el listado de base de datos de tu servidor local */
SELECT DATABASE_ID, name
FROM sys.databases;
GO

/* Poner en uso una base de datos */
USE HospitalHHH;
GO

/* Ver listado de tablas de una base de datos */
USE BDHospitalVG
SELECT name from sys.tables;

/* Ver listado de vistas de una base de datos */
USE BDHospitalVG;
SELECT name FROM sys.system_views;
GO

/* Visualizar la información detallada de una base de datos */
EXEC sp_helpdb BDHospitalVG;

/* Utlizando snippets */
-- Create a new database called 'ColegioMG'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'ColegioMG'
)
CREATE DATABASE ColegioMG
GO

/* Eliminar una Base de Datos */
DROP DATABASE HospitalHHH;
GO

/* Eliminar base de datos AdventureWORKS */
DROP DATABASE AdventureWorks2016;
DROP DATABASE AdventureWorksDW2016;
GO