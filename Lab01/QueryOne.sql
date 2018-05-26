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