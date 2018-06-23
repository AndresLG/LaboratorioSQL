/* Visualiza base de datos del servidor */
EXEC sp_databases;

/* Visualiza los SP de la base de datos */
EXEC sp_stored_procedures;

/* Listar tablas y vistas de una base de datos activa */
EXEC sp_tables
GO

/* Mi primer procedimiento almacenado */
CREATE PROCEDURE sp_SumNum
    @VarUno INT = 0,
    @VarDos INT = 0,
    @Suma INT = 0
AS
    BEGIN
        SET @Suma = @VarUno + @VarDos
        SELECT @Suma
    END
GO
/* Ejecutar mi primer procedimiento almacenado */
EXEC sp_SumNum
GO

/* Modificar mi procedimiento almacenado */
ALTER PROCEDURE sp_SumNum
    @VarUno INT = 5,
    @VarDos INT = 20,
    @Suma INT = 0
AS
    BEGIN
        SET @Suma = @VarUno + @VarDos
        SELECT @Suma AS 'Resultado'
    END
GO
/* Ejecutar procedimiento almacenado */
EXEC sp_SumNum
GO

/* Mi segundo procedimiento almacenado */
CREATE PROCEDURE sp_MultNum
    @VarUno INT = 5,
    @VarDos INT = 20,
    @Multi INT = 0
AS
    BEGIN
        SET @Multi = @VarUno * @VarDos
        SELECT @Multi AS 'Resultado'
    END
GO
/* Ejecutar procedimiento almacenado */
EXEC sp_MultNum
GO

/* Eliminar mi procedimiento almacenado */
DROP PROCEDURE sp_SumNum
GO

/* Elaborar un SP que permita ingresar dos números y devuelva la sumatoria de ellos */
CREATE PROCEDURE sp_SumNum2
    @VarUno INT,
    @VarDos INT,
    @Suma INT = 0
AS
    BEGIN
        SET @Suma = @VarUno + @VarDos
        SELECT @Suma AS 'Resultado'
    END
GO
/* Sumando dos números */
EXEC sp_SumNum2 @VarUno = 30, @VarDos = 60
GO

/* SP que permita ingresar dos números y devuelva la multiplicación de ellos */
CREATE PROCEDURE sp_MultNum2
    @VarUno INT,
    @VarDos INT,
    @Multi INT = 0
AS
    BEGIN
        SET @Multi = @VarUno * @VarDos
        SELECT @Multi AS 'Resultado'
    END
GO
/* Multiplicando dos números */
EXEC sp_MultNum2 @VarUno = 40, @VarDos = 50
GO

 /* Elaborar un SP que permita ingresar dos números y devolver el mayor de ellos */
CREATE PROCEDURE sp_Evaluar
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno > @NumDos
            SELECT @NumUno AS 'Número mayor'
        ELSE
            SELECT @NumDos AS 'Número menor'
    END
GO
/* Comparando números */
EXEC sp_Evaluar @NumUno = 60, @NumDos = 50
GO

/* SP que permita ingresar dos números y devolver el mayor de ellos o si son iguales */
CREATE PROCEDURE sp_Evaluar2
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno = @NumDos
            PRINT 'Los números son iguales'
        ELSE 
            IF @NumUno > @NumDos
                SELECT @NumUno AS 'Número mayor'
            ELSE
                SELECT @NumDos AS 'Número menor'
    END
GO
/* Comparando números */
EXEC sp_Evaluar2 @NumUno = 50, @NumDos = 50
GO

/* SP que permita ingresar dos números y devolver el mayor y menor correctamente o si son iguales */
CREATE PROCEDURE sp_Evaluar3
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno = @NumDos
            PRINT 'Los números son iguales'
        ELSE 
            IF @NumUno > @NumDos
                SELECT @NumUno AS 'Número mayor',
                @NumDos AS 'Número menor'
            ELSE
                SELECT @NumDos AS 'Número mayor',
                @NumUno AS 'Número menor'
    END
GO
/* Comparando números */
EXEC sp_Evaluar3 @NumUno = 60, @NumDos = 70
GO

/* Elaborar un SP que permita enumerar una debida cantidad de números */
CREATE PROCEDURE sp_Listar
    @Num INT,
    @Inicio INT = 0
AS
    BEGIN
    WHILE (@Inicio < @Num)
        BEGIN
            SET @Inicio = @Inicio + 1
            PRINT @Inicio
        END
    END
GO
/* Listar 5 números */
EXEC sp_Listar @Num = 5
GO

/* Elaborar un SP que permita repetir el mensaje "RETROCEDER NUNCA, RENDIRSE JAMÁS, ELLA NO TE AMA :C",
de acuerdo a un número que a sido ingresado */
CREATE PROCEDURE sp_Listar2
    @Num INT,
    @Inicio INT = 0
AS
    BEGIN
    WHILE (@Inicio < @Num)
        BEGIN
            SET @Inicio = @Inicio + 1
            PRINT 'RETROCEDER NUNCA, RENDIRSE JAMÁS, ELLA NO TE AMA :C'
        END
    END
GO
/* Listar número de mensajes */
EXEC sp_Listar2 @Num = 10
GO

/* Elaborar un SP que permita ingresar un nombre y devuelva un mensaje de saludo con el mismo nombre */
CREATE PROCEDURE sp_Saludo
    @Nombre VARCHAR(40)
AS
    BEGIN
        PRINT 'Hola ' + @Nombre
    END
GO
/* Probando el SP Saludo */
EXEC sp_Saludo @Nombre = Andrés
GO

/* Elaborar un SP que te permita ingresar un nombre y una fecha de nacimiento */
CREATE PROCEDURE sp_NomFecNac
    @Nombre VARCHAR(40),
    @FecNac DATE
AS
    BEGIN
        SELECT @Nombre AS Nombre, @FecNac AS 'Fecha de Nacimiento'
    END
GO
/* Probando SP Ingresar nombre y fecha de nacimiento */
--- Ver la configuración de idioma del servidor
SELECT @@LANGUAGE
GO
---Ver formato de fecha de acuerdo al idioma
EXEC sp_helplanguage
GO
---Probando SP
EXEC sp_NomFecNac @Nombre = 'Andrés Paul', @FecNac = '06/23/2018'
GO

/* Elaborar un SP que permita ingresar un nombre y fecha de nacimiento en fomrato dd/mm/yyyy */
CREATE PROCEDURE sp_NomFecNac2
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS
    BEGIN
        SELECT @Nombre AS Nombre,
        CONVERT(date, @FecNac, 103) AS 'Fecha de Nacimiento'
    END
GO
/* Probando SP */
EXEC sp_NomFecNac2 @Nombre = Andrés, @FecNac = '23/06/2018'
GO

/* Modificando el SP */
ALTER PROCEDURE sp_NomFecNac2
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS
    BEGIN
        SELECT @Nombre AS Nombre,
        FORMAT(CONVERT(date, @FecNac, 103), 'd', 'en-gb') AS 'Fecha de Nacimiento'
    END
GO
/* Probando SP */
EXEC sp_NomFecNac2 @Nombre = Andrés, @FecNac = '26/11/1999'
GO

/* Elaborar un SP que permita ingresar un nombre, una fecha de nacimiento
y devuelva los mismos datos más la edad basada en años */
CREATE PROCEDURE sp_NomFecNac3
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS
    BEGIN
        SELECT @Nombre AS Nombre,
        FORMAT(CONVERT(date, @FecNac, 103), 'd', 'en-gb') AS 'Fecha de Nacimiento',
        DATEDIFF(YEAR, CONVERT(date, @FecNac, 103), GETDATE()) AS 'Edad'
    END
GO
/* Probando SP */
EXEC sp_NomFecNac3 @Nombre = Andrés, @FecNac = '26/11/1999'
GO

/* Poner en uso la base de datos Adventure */
USE AdventureWorks2016
