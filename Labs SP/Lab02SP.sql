/* Elaborar los siguientes SP:
    1.- Permita ingresar el nombre de un empleado, su fecha de ingreso a la empresa y determine la cantidad de años de permanencia.
    2.- Ingrese un número e imprima el texto " Mensaje de prueba"
    3.- Ingrese 3 números y les permita ordenar de mayor e menor
    4.- Elaborar una vista que permita Visualizar el número de pedidos atendidos por bibliotecario
    5.- Elaborar una vista que permita visualisar: codigo de prestamo, fecha de prestamo, bibliotecario, libro, autor y género.*/
/* 1 */
CREATE PROCEDURE sp_Empleado
    @Nombre VARCHAR(40),
    @FecIngreso VARCHAR(10)
AS
    BEGIN
    SELECT @Nombre AS 'Empleado',
    FORMAT(CONVERT(date, @FecIngreso, 103), 'd', 'en-gb') AS 'Fecha de Ingreso',
    DATEDIFF(YEAR, CONVERT(date, @FecIngreso, 103), GETDATE()) AS 'Permanencia'
    END
GO

EXEC sp_Empleado @Nombre = Andrés , @FecIngreso = '26/11/1999'
GO

/* 2 */
CREATE PROCEDURE sp_MsjPrueba
@Numero INT,
@Inicio INT = 0
AS
    BEGIN
    WHILE (@Inicio < @Numero)
        BEGIN
            SET @Inicio = @Inicio + 1
            PRINT 'Mensaje de prueba'
        END
    END
GO

EXEC sp_MsjPrueba @Numero = 5
GO

/* 3 */
CREATE PROCEDURE sp_OrdenNum
@Num1 INT,
@Num2 INT,
@Num3 INT
AS
    BEGIN
    IF @Num1 > @Num2
        
    END
GO

EXEC sp_OrdenNum @Num1 = 5, @Num2 = 6, @Num3 = 7
GO

/* 4 */
CREATE VIEW vwPedidos
AS

/* 5 */


/* Visualizar los registros de la tabla Género */
SELECT * FROM Genero
GO

/* Crear unSP que permita listar los registros de la tabla género */
CREATE PROCEDURE sp_ListGen
AS
    BEGIN
        SELECT * FROM Genero
    END
GO
/* Ejecutar Store Procedure de listado de género */
EXEC sp_ListGen
GO

/* Crear un SP que permita listar los registros de la tabla cliente */
CREATE PROCEDURE sp_ListCliente
AS
    BEGIN
        SELECT * FROM Cliente
    END
GO
/* Ejecutar SP */
EXEC sp_ListCliente
GO

/* crear un SP que permita listar los cloentes ordenados por la columna sexo de forma ascendente */
CREATE PROCEDURE sp_ListClienteSexo
AS
    BEGIN
    SELECT * FROM Cliente
    ORDER BY Cliente.sexoCliente ASC
    END
GO
/* Ejecutar SP */
EXEC sp_ListClienteSexo
GO

/* Modificar el SP anterior de tal forma que permita mostrar el listado de clientes de acuerdo a
la letra del indicado */
ALTER PROCEDURE sp_ListClienteSexo
    @Sexo VARCHAR(1)
AS
    BEGIN
        SELECT *
        FROM Cliente
        WHERE Cliente.sexoCliente = @Sexo
    END
GO
/* Ejecutar SP */
EXEC sp_ListClienteSexo @Sexo = F
GO

/* Modificar el SP de tal forma que se vea completo el nombre del sexo */
ALTER PROCEDURE sp_ListClienteSexo
    @Sexo VARCHAR(1)
AS
    BEGIN
        SELECT CONCAT(Cliente.apeCliente, ', ',Cliente.nomCliente) AS Cliente,
        Cliente.dniCliente AS dni,
        Sexo = 
        CASE
            WHEN Cliente.sexoCliente = 'F' THEN 'Femenino'
            WHEN Cliente.sexoCliente = 'M' THEN 'Masculino'
        END
        FROM Cliente
        WHERE Cliente.sexoCliente = @Sexo
    END
GO
/* Ejecutar SP */
EXEC sp_ListClienteSexo @Sexo = M
GO

/* Crear un SP que permita ingresar registros a la tabla Género */
CREATE PROCEDURE sp_AddGen
    @Codigo VARCHAR(4),
    @Nombre VARCHAR(MAX)
AS
    BEGIN
        INSERT INTO Genero
            (idGenero, nomGenero)
        VALUES
            (@Codigo, @Nombre)
    END
GO
/* Agregar el género comedia */
EXEC sp_AddGen @Codigo = 5, @Nombre = Comedia
GO
/* Verificar que se haya agreagado el registro */
SELECT * FROM Genero
GO

/* Agregar los géneros Infantil, Obra Literaria y Drama */
EXEC sp_AddGen @Codigo = 6, @Nombre = 'Infantil'
EXEC sp_AddGen @Codigo = 7, @Nombre = 'Obra Literaria'
EXEC sp_AddGen @Codigo = 8, @Nombre = 'Drama'
GO
/* Verificar que se haya agreagado el registro */
SELECT * FROM Genero
GO

/* Elaborar un SP que permita validar el código de género antes de ingresar un registro */
CREATE PROCEDURE sp_ValidAddReg
    @Codigo INT,
    @Nombre VARCHAR(MAX)
AS
    BEGIN
        IF(SELECT Genero.idGenero FROM Genero WHERE Genero.idGenero = @Codigo) IS NOT NULL
            SELECT 'No puedo ingresar el registro porque el código ya existe' AS 'Resultado'
        ELSE
            INSERT INTO Genero
                (idGenero, nomGenero)
            VALUES
                (@Codigo, @Nombre);
            SELECT * FROM Genero ORDER BY idGenero
    END
GO
/* Validar ingreso de género con el código 2 */
EXEC sp_ValidAddReg @Codigo = 2, @Nombre = 'Series'
EXEC sp_ValidAddReg @Codigo = 9, @Nombre = 'Series'
EXEC sp_ValidAddReg @Codigo = 10, @Nombre = 'Cuentos'
EXEC sp_ValidAddReg @Codigo = 11, @Nombre = 'Comics'
GO

/* Eliminar registro a través de un SP */
CREATE PROCEDURE sp_DelGen
    @Codigo VARCHAR(4)
AS
    BEGIN
        DELETE FROM Genero
        WHERE Genero.idGenero = @Codigo
    END
GO
/* Ejecutar SP */
EXEC sp_DelGen @Codigo = 11
GO

/*  */
ALTER PROCEDURE sp_DelGen
    @Codigo INT
AS
    BEGIN
        IF(SELECT Genero.idGenero FROM Genero WHERE Genero.idGenero = @Codigo) IS NULL
            SELECT 'No puedo eliminar el registro porque el código no existe' AS 'Resultado'
        ELSE
            DELETE FROM Genero
            WHERE Genero.idGenero = @Codigo
            SELECT * FROM Genero ORDER BY idGenero
    END
GO
/*  */
EXEC sp_DelGen @Codigo = 10
GO