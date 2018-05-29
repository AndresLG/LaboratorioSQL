SELECT * FROM VENTA;


/* INNER */
SELECT *
FROM CLIENTE
INNER JOIN VENTA
ON CLIENTE.idCliente = VENTA.CLIENTE_idCliente;

/* LEFT */
SELECT *
FROM EMPLEADO
LEFT JOIN VENTA
ON EMPLEADO.idEmpleado = VENTA.EMPLEADO_idEmpleado;

/* RIGHT */
SELECT *
FROM EMPLEADO
RIGHT JOIN VENTA
ON EMPLEADO.idEmpleado = VENTA.EMPLEADO_idEmpleado;

/* OUTER JOIN */
SELECT EMPLEADO.nombre ,EMPLEADO.apellido ,TIPO_EMPLEADO.nombre
FROM EMPLEADO
FULL OUTER JOIN TIPO_EMPLEADO
ON EMPLEADO.nombre =    TIPO_EMPLEADO.nombre;


/* FUNCIONES ESCALARES */


create function V_VENTA
(
@PRECIO1 int,
@PRECIO2 int
)
returns int
as
begin
    declare @totalVenta int
    set @totalVenta = @PRECIO1+@PRECIO2
    return @totalVenta
    end;

 select dbo.V_VENTA(80,80) as totalVenta;



