/* BASES DE DATOS 
DRA. ROSA NAVARRETE

EJERCICIOS PROPUESTOS

Nombres:García Gandhy
		Salazar Marco
		Velastegui Daniel

Fecha: 2020 - 08 - 21
*/


-- Sobre la BD PEDIDOS, escriba los siguientes STORED PROCEDURES.

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

CREATE PROCEDURE usp_ESTADISTICAS
	@PRODUCTOID		INT,
	@ESTADISTICAS	FLOAT OUTPUT
AS
	IF EXISTS (SELECT * FROM PRODUCTOS WHERE PRODUCTOID = @PRODUCTOID)
		BEGIN
			IF EXISTS (SELECT * FROM DETALLE_ORDENES
						WHERE PRODUCTOID = @PRODUCTOID)
				BEGIN
					DECLARE @NUM_ORDENES	FLOAT
					DECLARE @PEDIDOS		FLOAT
					SELECT @NUM_ORDENES = COUNT(*) FROM ORDENES
					SELECT @PEDIDOS = COUNT(*) FROM DETALLE_ORDENES
					WHERE PRODUCTOID = @PRODUCTOID

					SELECT @ESTADISTICAS = (@PEDIDOS / @NUM_ORDENES) * 100
					RETURN 0
				END
			ELSE
				BEGIN
					PRINT 'NO EXISTEN ORDENES DE ESE PRODUCTO'
					RETURN 2
				END
		END
	ELSE
		BEGIN
			PRINT 'NO EXISTE UN PRODUCTO CON ESE ID'
			RETURN 1
		END
GO

DECLARE @RETORNO INT, @ESTADISTICA FLOAT
EXEC @RETORNO = usp_ESTADISTICAS 1, @ESTADISTICA OUTPUT

PRINT 'RETORNO: ' + CONVERT (char(2),@RETORNO)
PRINT 'ESTADISTICA: ' + CONVERT (char(10),@ESTADISTICA)
GO

/* 2. Escriba un SP que reciba como parámetro los valores necesarios para el ingreso 
de una orden: nombre de la compañía cliente, el apellido y nombre del empleado que atiende 
la orden y un valor de descuento. La fecha de la orden está dada por la fecha del sistema. 
El SP debe ingresar la orden y obtener como salida el número de órdenes ingresadas 
para ese cliente */

USE PEDIDOS
GO

SELECT * FROM ORDENES
GO

CREATE PROCEDURE usp_INSERTAR_ORDEN
	@NOMBRECIA			VARCHAR(30),
	@NOMBREEMPLEADO		VARCHAR(20),
	@APELLIDOEMPLEADO	VARCHAR(20),
	@DESCUENTO			INT,
	@NUMORDENES			INT OUTPUT
AS
	IF EXISTS (SELECT * FROM CLIENTES WHERE NOMBRECIA = @NOMBRECIA)
		BEGIN
			IF EXISTS (SELECT * FROM EMPLEADOS
						WHERE APELLIDO = @APELLIDOEMPLEADO AND NOMBRE = @NOMBREEMPLEADO)
				BEGIN
					DECLARE @CLIENTEID	INT
					DECLARE @EMPLEADOID INT
					DECLARE @ORDENES	INT

					SELECT @CLIENTEID = CLIENTEID FROM CLIENTES
					WHERE NOMBRECIA = @NOMBRECIA

					SELECT @EMPLEADOID = EMPLEADOID FROM EMPLEADOS
					WHERE APELLIDO = @APELLIDOEMPLEADO
					AND NOMBRE = @NOMBREEMPLEADO

					SELECT @ORDENES = COUNT(*) + 1 FROM ORDENES

					INSERT ORDENES VALUES
					(@ORDENES, @CLIENTEID, @EMPLEADOID, GETDATE(), @DESCUENTO)

					SELECT @NUMORDENES = COUNT(*) FROM ORDENES
					WHERE CLIENTEID = @CLIENTEID

					RETURN 0
				END
			ELSE
				BEGIN
					PRINT 'NO EXISTE EL EMPLEADO ESPECIFICADO'
					RETURN 2
				END
		END
	ELSE
		BEGIN
			PRINT 'NO EXISTE UN CLIENTE CON ESE NOMBRE'
			RETURN 1
		END
GO

SELECT * FROM CLIENTES
SELECT * FROM EMPLEADOS
SELECT * FROM ORDENES
GO

DECLARE @RETORNO INT, @ORDENES INT
EXEC @RETORNO = usp_INSERTAR_ORDEN 'SU TIENDA', 'JUAN', 'CRUZ', 20, @ORDENES OUTPUT
PRINT 'RETORNO: ' + CONVERT (char(2),@RETORNO)
PRINT 'ORDENES: ' + CONVERT (char(10),@ORDENES)
GO

   -- SOBRE LA BD BANCO 

/* 3. Escriba un SP para registrar el pago de una mensualidad a un Préstamo. 
El SP recibe como parámetros el número de préstamo y el valor que se va 
a pagar. Se debe ingresar el DETALLE_PRESTAMO considerando la fecha del
sistema para fecha_pago. Además, actualizar el préstamo correspondiente, 
restando del saldo el valor pagado del préstamo. El SP devuelve el saldo
que queda luego del pago. Considere devolver un valor de retorno distinto 
de cero si no existe el número de préstamo recibido como parámetro. Incluya
las sentencias COMMIT y ROLLBACK pertinentes. PROBAR EL SP.*/

/* 4. Escriba un SP para ordenar las cuentas abiertas por los clientes de modo 
que pertenezcan a sucursales que se encuentren en el sector en que vive el cliente.
El SP recibe como parámetro un nombre y apellido de un cliente y localiza al mismo. 
Si no existe el cliente retorna un mensaje y el código 1. 
Si existe el cliente, examine si todas sus cuentas, sin importar si son o no activas
han sido abiertas en sucursales del sector donde vive el cliente. 
El SP debe mostrar la lista de numCta, tipo, sucursal y sector, de todas las cuentas 
abiertas por ese cliente. El SP obtiene como salida, el número de cuentas que deben 
ser cambiadas de sucursal porque corresponden a sucursales en sectores distintos al que 
vive el cliente. PROBAR EL SP */

/* 5. Escriba un SP para ingresar un nuevo cliente al banco. El SP recibe como parámetros: 
cédula, apellido, nombre, dirección, celular, teléfono de casa (opcional) y teléfono del trabajo (opcional)
y el nombre del sector donde vive el cliente. Además, para asignarle el ejecutivo, considere 
al ejecutivo con el menor número de clientes asignados. Si hay ejecutivos con el mismo número 
de clientes, entonces de entre ellos, al primero en orden alfabético. PROBAR EL SP */

 --TRIGGER 

 USE PEDIDOS 
 GO 
 SELECT * FROM DETALLE_ORDENES
 SELECT * FROM PRODUCTOS 
 SELECT * FROM ORDENES

 /* 7. Escriba un trigger de INSERT en la tabla DETALLE_ORDENES. Cada vez que se ingresa un 
 registro en la tabla, se debe actualizar el campo EXISTENCIA de la tabla PRODUCTOS, restando la CANTIDAD 
 del producto ingresado en DETALLE_ORDENES. Pruebe el trigger */

 USE PEDIDOS
 GO

 SELECT * FROM DETALLE_ORDENES
 SELECT * FROM PRODUCTOS
 GO

 CREATE TRIGGER EXISTENCIA
	ON DETALLE_ORDENES
	FOR INSERT
AS
	DECLARE @PRODUCTOID	INT
	DECLARE @CANTIDAD	INT
	DECLARE @EXISTENCIA	INT

	SELECT @CANTIDAD = CANTIDAD FROM inserted
	SELECT @EXISTENCIA = EXISTENCIA FROM PRODUCTOS

	IF @CANTIDAD <= @EXISTENCIA
		BEGIN
			SELECT @PRODUCTOID = PRODUCTOID FROM inserted

			UPDATE PRODUCTOS
			SET EXISTENCIA = EXISTENCIA / @CANTIDAD
			WHERE PRODUCTOID = @PRODUCTOID
		END
	ELSE
		BEGIN
		PRINT 'NO EXISTEN ESA CANTIDAD DE UNIDADES'
		ROLLBACK TRAN
		END
 GO

 INSERT DETALLE_ORDENES VALUES
 (11, 1, 1, 20)

 /* Crear la tabla siguiente: */
 create table PRODUCTOS_HISTORICO 
 (productoid int, fecha_cambio date, nuevo_precio money, primary key (productoid, fecha_cambio))

 /* 8. Escriba un trigger para UPDATE de la tabla PRODUCTOS. Si El campo PRECIOUNIT se cambia, ingrese un 
  registro en la tabla PRODUCTOS_HISTORICO, con los campos respectivos. Pruebe el trigger */

USE PEDIDOS
GO

SELECT * FROM PRODUCTOS
GO

CREATE TRIGGER PRODUCTOS_HISTORIAL
	ON PRODUCTOS
	FOR UPDATE
AS

	IF(UPDATE(PRECIOUNIT))
		BEGIN
			INSERT PRODUCTOS_HISTORICO
			SELECT PRODUCTOID, GETDATE(), PRECIOUNIT
			FROM inserted
		END

UPDATE PRODUCTOS SET
	PRECIOUNIT = 2.50
	WHERE PRODUCTOID = 1

SELECT * FROM PRODUCTOS_HISTORICO
GO

/* 9. Escriba un trigger para UPDATE en la tabla ORDENES. Si se cambia el campo FECHAORDEN o DESCUENTO, 
debe ingresar los registros OLD y NEW en una tabla de auditoría para registrar cambios en estos campos. 
Debe crear inicialmente la tabla de auditoría*/

USE PEDIDOS
GO

CREATE TABLE AUDIT_ORDENES 
							(AUDIT_ID	UNIQUEIDENTIFIER DEFAULT NEWID(),
							TIPO_AUDIT	CHAR(3),
							FECHACAMBIO	DATETIME,
							USUARIO		SYSNAME DEFAULT SUSER_SNAME(),
							FECHAORDEN	DATETIME,
							DESCUENTO	INT)

SELECT * FROM ORDENES
GO

CREATE TRIGGER AUDITORIA_OREDENES
	ON ORDENES
	FOR UPDATE
AS
	IF (UPDATE(FECHAORDEN) OR UPDATE(DESCUENTO))
		BEGIN
			INSERT AUDIT_ORDENES (TIPO_AUDIT, FECHACAMBIO, FECHAORDEN, DESCUENTO)
			SELECT 'NEW', GETDATE(), FECHAORDEN, DESCUENTO FROM inserted

			INSERT AUDIT_ORDENES (TIPO_AUDIT, FECHACAMBIO, FECHAORDEN, DESCUENTO)
			SELECT 'OLD', GETDATE(), FECHAORDEN, DESCUENTO FROM deleted
		END

UPDATE ORDENES
	SET DESCUENTO = 10
	WHERE ORDENID = 1

SELECT * FROM AUDIT_ORDENES
GO


-- FUNCIONES 

 
/* 10. Escriba una función de tipo escalar que reciba como parámetro el nombre y apellido de un 
empleado y obtenga el número de órdenes que ese empleado ha atendido  */

USE PEDIDOS
GO

SELECT * FROM EMPLEADOS;
SELECT * FROM ORDENES;
GO

CREATE FUNCTION NUM_ORDENES (@APELLIDO VARCHAR(20), @NOMBRE VARCHAR(20))
	RETURNS INT
AS
BEGIN
	DECLARE @EMP_ID			INT
	DECLARE @NUM_ORDENES	INT

	IF EXISTS (SELECT EMPLEADOID FROM EMPLEADOS
				WHERE APELLIDO = @APELLIDO AND NOMBRE = @NOMBRE)
		BEGIN
			SELECT @EMP_ID = EMPLEADOID 
			FROM EMPLEADOS
			WHERE APELLIDO = @APELLIDO
			AND NOMBRE = @NOMBRE

			SELECT @NUM_ORDENES = COUNT(*)
			FROM ORDENES
			WHERE EMPLEADOID = @EMP_ID

			RETURN @NUM_ORDENES
		END

	RETURN -1
END
GO

SELECT NOMBRE, APELLIDO, dbo.NUM_ORDENES (APELLIDO, NOMBRE) AS 'NUMERO DE ORDENES' FROM EMPLEADOS

-- 11. Sobre la BD BANCO, escriba una función escalar que muestre el número de 
-- clientes atendidos por un ejecutivo cuyo nombre y apellido ingresan como parámetro. 

USE BANCO
GO

SELECT * FROM Clientes
SELECT * FROM Ejecutivos
GO

CREATE FUNCTION NUM_CLIENTES (@apellido varchar(20), @nombre VARCHAR(20))
	RETURNS INT
AS
BEGIN
	DECLARE @codEjecutivo INT
	DECLARE @NUM_CLIENTES INT

	IF EXISTS (SELECT * FROM Ejecutivos
				WHERE apellido = @apellido AND nombre = @nombre)
		BEGIN
			SELECT @codEjecutivo = codEjecutivo
			FROM Ejecutivos
			WHERE apellido = @apellido AND nombre = @nombre

			SELECT @NUM_CLIENTES = COUNT(*)
			FROM Clientes
			WHERE codEjecutivo = @codEjecutivo

			RETURN @NUM_CLIENTES
		END
	RETURN -1
END
GO

SELECT codEjecutivo, nombre, apellido, dbo.NUM_CLIENTES(apellido, nombre) AS 'CANTIDAD DE CLIENTES' FROM Ejecutivos


-- 12. Sobre la BD BANCO, escriba una función de tabla en línea de múltiples instrucciones
-- que muestre el detalle de los pagos realizados a un préstamo cuyo número ingresa 
-- como parámetros. Debe mostrar el valor del pago y la fecha en que se realizó. 

USE BANCO
GO

SELECT * FROM Prestamos
SELECT * FROM Detalle_Prestamo
GO

CREATE FUNCTION DETALLE_PRESTAMOS (@numPrestamo INT)
	RETURNS @tabDetalle TABLE (	valor		MONEY,
								fecha_pago	DATETIME)
AS
BEGIN
	INSERT @tabDetalle
	SELECT valor, numPrestamo
	FROM Detalle_Prestamo
	WHERE numPrestamo = @numPrestamo

	RETURN
END
GO

SELECT * FROM DETALLE_PRESTAMOS(1)

