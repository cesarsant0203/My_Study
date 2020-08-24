/* BASES DE DATOS 
DRA. ROSA NAVARRETE

EJERCICIOS PROPUESTOS*/


-- Sobre la BD PEDIDOS, escriba los siguientes STORED PROCEDURES.==============================================

/* 1. Escriba un SP para obtener la estadística de venta de un producto, que reciba como 
parámetro una variable @productoid int y asigne un id de producto.  
   
   Si no existe ese producto, imprima un mensaje y retorne un código de error.  
   Si existe el producto, pero no se tienen ventas de ese producto, 
   imprima un mensaje con código de error.
   Para obtener la estadística verifique el número de órdenes que se tienen y en cuántas 
   de esas órdenes se ha incluido ese producto y lo presenta como porcentaje. 
   (ej.  50 órdenes, 20 órdenes con ese producto, 50/20 *100). Retorne esa estadística 
   como un parámetro de salida. */
USE PEDIDOS
GO

SELECT * FROM PRODUCTOS
SELECT * FROM DETALLE_ORDENES
SELECT * FROM ORDENES
GO
-- Se crea el SP --------------------------------------------------------------------------------
CREATE PROCEDURE SP_1
	@idProducto		INT,
	@venta	FLOAT OUTPUT
AS
--Se declara las variables
DECLARE @cantidadOrdenes INT, @cantidadPedidos INT
	IF NOT EXISTS (SELECT * FROM PRODUCTOS WHERE PRODUCTOID = @idProducto)
		BEGIN
			PRINT 'No se encontro el ID del producto'
			RETURN 1
		END
	ELSE
		BEGIN
			IF NOT EXISTS (SELECT * FROM DETALLE_ORDENES
						WHERE PRODUCTOID = @idProducto)
				BEGIN
					PRINT 'Para este producto no existen ordenes'
					RETURN 2
				END
				BEGIN
					SELECT @cantidadPedidos = COUNT(*) FROM DETALLE_ORDENES
					WHERE PRODUCTOID = @idProducto
					SELECT @cantidadOrdenes = COUNT(*) FROM ORDENES
					SELECT @venta = (cast(@cantidadPedidos as float) / cast(@cantidadOrdenes as float)) * 100.0
					RETURN 0
				END
		END
GO
--------------------------------------------------------------------------------------------------------------
/*
 drop procedure SP_1
 */

/*Prueba de ejecucion SP_1*/
DECLARE @valorReturn INT, @venta FLOAT, @idproducto int = 1
EXEC @valorReturn = SP_1 @idproducto, @venta OUTPUT

PRINT	'EL valor del return fue de ' + CONVERT (char(2),@RETORNO)
PRINT	'La estadistica de venta del producto con ID ' + CONVERT(char(2),@idproducto) 
		+' '+CONVERT (char(10),@ESTADISTICA)
GO


/* 2. Escriba un SP que reciba como parámetro los valores necesarios para el ingreso 
de una orden: nombre de la compañía cliente, el apellido y nombre del empleado que atiende 
la orden y un valor de descuento. La fecha de la orden está dada por la fecha del sistema. 
El SP debe ingresar la orden y obtener como salida el número de órdenes ingresadas 
para ese cliente */
USE PEDIDOS
GO
select  *from CLIENTES
select *from empleados;
select *from ordenes;
GO
-- Se crea el SP ----------------------------------------------------------------------
create procedure SP_2
					@nombrecia char (30),
					@nombreEmpleado char (30),
					@apellidoEmpleado char (30),
					@valorDescuento int,
					@numeroOrdenes int OUTPUT
as
declare @clienteID int, @empleadoID int, @ordenId int

if EXISTS (select * from clientes where nombrecia=@nombrecia )
	BEGIN 
		select @clienteID = c.CLIENTEID
		from clientes c
		where nombrecia=@nombrecia
	END 
ELSE 
	BEGIN
		PRINT'NO EXISTE LA EMPRESA'
	END

if exists (	select *from EMPLEADOS 
			where nombre = @nombreEmpleado
			and apellido = @apellidoEmpleado )
begin
	select @empleadoId = e.EMPLEADOID
	from EMPLEADOS e
	where nombre = @nombreEmpleado
	and apellido = @apellidoEmpleado
END 
ELSE 
	BEGIN
		PRINT'EMPLEADO NO REGISTRADO'
	END

select @ordenId = count(*)+1 from ORDENES

select  @numeroOrdenes = count(*)
from ordenes 
where CLIENTEID = @clienteID;

insert into ORDENES (ORDENID,CLIENTEID,EMPLEADOID,FECHAORDEN,DESCUENTO) VALUES (@ordenid,@clienteID,@empleadoID,getdate(),@valorDescuento)

go

/*
 drop procedure SP_2
 */

/*Prueba de ejecucion*/
declare @salida_ordenes int, @compania varchar (30)='DISTRIBUIDORA PRENSA'
exec SP_2 @compania,'PABLO','CELY',5, @salida_ordenes  output
print @compania+': ORDENES :'+ convert (char(4),@salida_ordenes)

 --TRIGGER=====================================================================================================

 USE PEDIDOS 
 GO 
 SELECT * FROM DETALLE_ORDENES
 SELECT * FROM PRODUCTOS 
 SELECT * FROM ORDENES
 GO
 /* 7. Escriba un trigger de INSERT en la tabla DETALLE_ORDENES. Cada vez que se ingresa un 
 registro en la tabla, se debe actualizar el campo EXISTENCIA de la tabla PRODUCTOS, restando la CANTIDAD 
 del producto ingresado en DETALLE_ORDENES. Pruebe el trigger */
 --Se crea el trigger -----------------------------------------------
CREATE TRIGGER TR_7
ON DETALLE_ORDENES
FOR INSERT
AS
--Se declara variables
declare @cantidad int, @productoid int, @existencia int;
--Se da valor a las variables
select	@cantidad = CANTIDAD,
		@productoid = PRODUCTOID
		from inserted;
select	@existencia = existencia
		from productos pr 
		where pr.PRODUCTOID = @productoid;
if (@existencia >= @cantidad)
	BEGIN
		update PRODUCTOS
		set existencia = existencia - @cantidad
		where @productoid = PRODUCTOID
	END
ELSE
	BEGIN
		PRINT 'NO HAY PRODUCTO EN STOCK'
		rollback tran
	END
GO
-------------------------------------------------------------------
/*
drop trigger TR_7
*/

/*Prueba trigger TR_7*/
insert into DETALLE_ORDENES
values (6,6,11, 15)
 SELECT * FROM DETALLE_ORDENES
 SELECT * FROM PRODUCTOS 
 SELECT * FROM ORDENES
go

 /* Crear la tabla siguiente: */
 create table PRODUCTOS_HISTORICO 
 (productoid int, fecha_cambio date, nuevo_precio money, primary key (productoid, fecha_cambio))
 go
 /* 8. Escriba un trigger para UPDATE de la tabla PRODUCTOS. Si El campo PRECIOUNIT se cambia, ingrese un 
  registro en la tabla PRODUCTOS_HISTORICO, con los campos respectivos. Pruebe el trigger */
  --Se crea el trigger ----------------------------------------------
CREATE TRIGGER TR_8
ON PRODUCTOS
FOR UPDATE
AS
--Se declara las variables
declare @preciounit money,
		@productoid int;
--Se da valor a las variables
select @preciounit = i.PRECIOUNIT, @productoid = p.PRODUCTOID
from inserted i, PRODUCTOS p
where i.PRODUCTOID = p.PRODUCTOID

if UPDATE(preciounit)
	begin
		insert into PRODUCTOS_HISTORICO
		values (@productoid,GETDATE(),@preciounit)
	end
else
	begin
		print 'Es el mismo precio unitario'
		rollback tran
	end
GO
----------------------------------------------------------------------
/*
drop trigger TR_8
*/

/*Prueba trigger TR_8*/
--Precio unitario
update PRODUCTOS
set PRECIOUNIT = 3.20
where PRODUCTOID = 4
select * from PRODUCTOS_HISTORICO
select * from PRODUCTOS
go
/* 9. Escriba un trigger para UPDATE en la tabla ORDENES. Si se cambia el campo FECHAORDEN o DESCUENTO, 
debe ingresar los registros OLD y NEW en una tabla de auditoría para registrar cambios en estos campos. 
Debe crear inicialmente la tabla de auditoría*/

--Se crea la tabla----------------------------------------------------
 create table AUDITORIA_ORDENES 
 (tranId int identity,
 fecha_cambio date,
 nuevaFechaOrden date null,
 antiguaFechaOrden date null,
 nuevoDescuento int null,
 antiguoDescuento int null,
 primary key ( tranId))
 go
 ---------------------------------------------------------------------

 select * from AUDITORIA_ORDENES
 select * from ordenes
 go

 -- Se crea el trigger -----------------------------------------------
CREATE TRIGGER TR_9
ON ORDENES
FOR UPDATE
AS
--Se declaran las variables
declare @fechaorden date,
		@descuento int,
		@Nfechaorden date,
		@Ndescuento int;
--Se da valor a las variables
select	@fechaorden = d.FECHAORDEN,
		@descuento = d.DESCUENTO
from inserted i, ordenes o, deleted d
where i.ORDENID = o.ORDENID
select	@Nfechaorden = i.FECHAORDEN,
		@Ndescuento = i.DESCUENTO
from inserted i, ordenes o
where i.ORDENID = o.ORDENID
if UPDATE(Fechaorden)
	begin
		insert into AUDITORIA_ORDENES (	fecha_cambio,
										nuevaFechaOrden,
										antiguaFechaOrden)
		values (GETDATE(),
				@Nfechaorden,
				@fechaorden)
	end
else if UPDATE(Descuento)
	begin
		insert into AUDITORIA_ORDENES (	fecha_cambio,
										nuevoDescuento,
										antiguoDescuento)
		values (GETDATE(),
				@Ndescuento,
				@descuento)
	end
else
	begin
		rollback tran
	end
GO
-------------------------------------------------------------------
/*
drop trigger TR_9
*/

/*Prueba trigger TR_9*/
--Descuento
update ORDENES
set DESCUENTO = 17
where ORDENID = 1
 select * from AUDITORIA_ORDENES
 select * from ordenes
go
--Fecha de orden
SET DATEFORMAT dmy;  
update ORDENES
set FECHAORDEN = '20-08-2020'
where ORDENID = 1
 select * from AUDITORIA_ORDENES
 select * from ordenes
go
-- FUNCIONES ==============================================================================================

 
/* 10. Escriba una función de tipo escalar que reciba como parámetro el nombre y apellido de un 
empleado y obtenga el número de órdenes que ese empleado ha atendido  */
USE PEDIDOS
GO

SELECT * FROM EMPLEADOS;
SELECT * FROM ORDENES;
GO
-- Se crea la funcion ---------------------------------------------------
CREATE FUNCTION fun_10 (@ingresoNombre VARCHAR(30), @ingresoApellido VARCHAR(30))
RETURNS INT
AS
BEGIN
--Declara las variables
	DECLARE @totalOrdenes INT
	DECLARE @empleadoId INT
	IF NOT EXISTS (SELECT EMPLEADOID FROM EMPLEADOS
				WHERE NOMBRE = @ingresoNombre AND APELLIDO = @ingresoApellido)
		BEGIN
		RETURN 1
		END
		ELSE IF EXISTS (SELECT EMPLEADOID FROM EMPLEADOS
				WHERE NOMBRE = @ingresoNombre AND APELLIDO = @ingresoApellido)
		BEGIN
			SELECT @empleadoId = EMPLEADOID 
			FROM EMPLEADOS
			WHERE NOMBRE = @ingresoNombre 
			AND APELLIDO = @ingresoApellido

			SELECT @totalOrdenes = COUNT(*)
			FROM ORDENES
			WHERE EMPLEADOID = @empleadoId

			RETURN @totalOrdenes
		END
	RETURN 0
END
GO
---------------------------------------------------------------------------------------------------
/*
drop FUNCTION fun_10
*/

/*Prueba FUNCTION fun_10*/
SELECT	nombre 'Nombres',
		apellido 'Apellidos',
		dbo.fun_10 (NOMBRE, APELLIDO)'Cantidad de ordenes' 
FROM EMPLEADOS

-- 11. Sobre la BD BANCO, escriba una función escalar que muestre el número de 
-- clientes atendidos por un ejecutivo cuyo nombre y apellido ingresan como parámetro. 
USE BANCO
GO

SELECT * FROM Clientes
SELECT * FROM Ejecutivos
GO
-- Se crea la funcion ----------------------------------------------------
CREATE FUNCTION fun_11 (@nombre VARCHAR(20), @apellido varchar(20))
	RETURNS INT
AS
BEGIN
--Se declara las variables
	DECLARE @totalClientes INT
	DECLARE @codigoEjecutivo INT


	IF EXISTS (SELECT * FROM Ejecutivos
				WHERE nombre = @nombre  AND apellido = @apellido)
		BEGIN
			SELECT @codigoEjecutivo = codEjecutivo
			FROM Ejecutivos
			WHERE nombre = @nombre AND  apellido = @apellido

			SELECT @totalClientes = COUNT(*)
			FROM Clientes
			WHERE codEjecutivo = @codigoEjecutivo

			RETURN @totalClientes
		END
	RETURN 0

END
GO
---------------------------------------------------------------------
/*
drop FUNCTION fun_11
*/

/*Prueba FUNCTION fun_11*/
SELECT	codEjecutivo 'Codigo del ejecutivo',
		nombre 'Nombres',
		apellido 'Apellidos',
		dbo.fun_11(nombre, apellido) 'Cantidad de Clientes' 
FROM Ejecutivos

-- 12. Sobre la BD BANCO, escriba una función de tabla en línea de múltiples instrucciones
-- que muestre el detalle de los pagos realizados a un préstamo cuyo número ingresa 
-- como parámetros. Debe mostrar el valor del pago y la fecha en que se realizó. 
USE BANCO
GO

--Se crea la funcion ------------------------------------------------
CREATE FUNCTION fun_table_12 (@numPrestamo INT)
RETURNS @detallesxPrestamo TABLE(valor MONEY,fecha_pago DATETIME)
AS
BEGIN
	INSERT @detallesxPrestamo 
	SELECT valor, fecha_pago
	FROM Detalle_Prestamo
	WHERE numPrestamo = @numPrestamo
	RETURN
END
GO
----------------------------------------------------------------------
/*
drop FUNCTION fun_table_12

*/

/*Prueba FUNCTION fun_table_12*/
SELECT * FROM fun_table_12(3)
