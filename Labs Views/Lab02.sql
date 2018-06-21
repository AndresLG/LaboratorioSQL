SELECT * FROM Genero
GO
SELECT * FROM Pais
GO
SELECT * FROM Autor
GO
SELECT * FROM Libro
GO
SELECT * FROM Bibliotecario
GO
SELECT * FROM Cliente
GO

SELECT Libro.tituloLibro, Libro.Genero_idGenero, Genero.nomGenero
FROM Libro
INNER JOIN Genero
ON Libro.Genero_idGenero = Genero.idGenero
GO

SELECT Libro.tituloLibro, Pais.nomPais
FROM Libro
INNER JOIN Pais
ON Libro.Pais_idPais = Pais.idPais
GO

SELECT Libro.tituloLibro,
CONCAT(Autor.nomAutor, ', ', Autor.apeAutor)
FROM Libro
INNER JOIN Autor
ON Libro.Autor_idAutor = Autor.idAutor
GO

SELECT Libro.tituloLibro,
CONCAT(Autor.nomAutor, ', ', Autor.apeAutor) AS 'Nombres y Apellidos',
Genero.nomGenero, Pais.nomPais
FROM Libro
INNER JOIN Autor
ON Libro.Autor_idAutor = Autor.idAutor
INNER JOIN Genero
ON Libro.Genero_idGenero = Genero.idGenero
INNER JOIN Pais
ON Libro.Pais_idPais = Pais.idPais
GO

/* Creando una Vista */
CREATE VIEW vwDatosLibro
AS
SELECT Libro.tituloLibro,
CONCAT(Autor.nomAutor, ', ', Autor.apeAutor) AS 'Nombres y Apellidos'
FROM Libro
INNER JOIN Autor
ON Libro.Autor_idAutor = Autor.idAutor
GO
/* Ver registros de una vista */
SELECT * FROM vwDatosLibro
GO

/* Listar el nombre del autor, el libro que ha escrito, el género y país respectivo en una vista llamada vwDatosAutor */
CREATE VIEW vwDatosAutor
AS
SELECT Autor.nomAutor, Libro.tituloLibro,
Genero.nomGenero, Pais.nomPais
FROM Libro
INNER JOIN Autor
ON Libro.Autor_idAutor = Autor.idAutor
INNER JOIN Genero
ON Libro.Genero_idGenero = Genero.idGenero
INNER JOIN Pais
ON Libro.Pais_idPais = Pais.idPais
GO
/* Ver registros de vista */
SELECT * FROM vwDatosAutor
GO

/* En una Vista listar la cantidad de libros por género */
CREATE VIEW vwGenLib
AS
SELECT Genero.nomGenero AS Genero, COUNT(Libro.Genero_idGenero) AS Total
FROM Libro
INNER JOIN Genero
ON Libro.Genero_idGenero = Genero.idGenero
GROUP BY Genero.nomGenero
GO
/* Ver registros de vista */
SELECT * FROM vwGenLib
GO

/* Vista con la cantidad de libros por país */
CREATE VIEW vwPaisLib
AS
SELECT Pais.nomPais AS Pais, COUNT(Libro.Pais_idPais) AS Total
FROM Libro
INNER JOIN Pais
ON Libro.Pais_idPais = Pais.idPais
GROUP BY Pais.nomPais
GO
/* Ver registros de vista */
SELECT * FROM vwPaisLib
GO

/* Ver listado de vistas */
SELECT Name FROM sys.views
GO

/* Vista de qué libros a prestado qué bibliotecario, a quién lo ha prestado y qué fecha lo prestó */
CREATE VIEW vwDatosPrestamos
AS
SELECT CONCAT(Bibliotecario.nomBibliotecario, ', ', Bibliotecario.apeBibliotecario) AS 'Bibliotecario',
Libro.tituloLibro AS 'Libro Prestado', CONCAT(Cliente.nomCliente,', ',Cliente.apeCliente) AS 'Cliente', Prestamos.fecsalPrestamo AS 'Fecha de Préstamo'
FROM Prestamos
INNER JOIN Detalle_Prestamo
ON Prestamos.idPrestamo = Detalle_Prestamo.Prestamos_idPrestamo
INNER JOIN Libro
ON Detalle_Prestamo.Libro_idLibro = Libro.idLibro
INNER JOIN Bibliotecario
ON Prestamos.Bibliotecario_idBibliotecario = Bibliotecario.idBibliotecario
INNER JOIN Cliente
ON Prestamos.Cliente_idCliente = Cliente.idCliente
GO
/* Ver registros de vista */
SELECT * FROM vwDatosPrestamos
GO