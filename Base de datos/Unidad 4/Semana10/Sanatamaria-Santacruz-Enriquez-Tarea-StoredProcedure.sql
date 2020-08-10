---------------Sobre la BD BANCO------------------------
USE BANCO
GO
/*
1.	Escriba un SP, que recibe como parámetros de entrada: un valor (money), un número de cuenta y un carácter (C o D),
	que indica si es un débito para la cuenta (‘D’) o un crédito (‘C’).   Como parámetro de salida obtenga el saldo_efectivo de la cuenta. 
•	Verificar si existe la cuenta y si es de tipo ‘corriente’; si no retornar un valor 1. 
•	Si encuentra la cuenta corriente efectuar la operación de débito o crédito a la cuenta (según indica el carácter de parámetro),
	afectando el saldo_contable. Verificar si existe algún error con @@ERROR,  de existir error, retorne 2. 
•	Insertar el respectivo registro en la tabla DETALLE_MOV_CTA. Considere la fecha del sistema como fecha del movimiento. 
	Retornar valor 3 si existe error. 
•	Para cada retorno emita un mensaje con print.
•	Trabaje con una transacción y considere las sentencias COMMIT y ROLLBACK que sean pertinentes para asegurar la consistencia de transacción.
•	Utilice TRY-CATCH
*/
select * from Cuentas
SELECT * FROM Detalle_Mov_Cta
go

CREATE PROCEDURE SP_1  @valor money, @numeroCuenta int, @caracter char, @saldoEfectivo money output
AS
	IF NOT EXISTS(SELECT * FROM Cuentas WHERE numCta=@numeroCuenta and tipo='Corriente')
		BEGIN
			PRINT 'NO EXISTE ESA CUENTA O NO ES UNA CUENTA CORRIENTE'
			RETURN(1)
		END
	ElSE
		BEGIN
		If (@@ERROR = 0)
			BEGIN
				IF (@caracter = 'D')
				BEGIN
					IF ((SELECT saldo_Efectivo FROM Cuentas WHERE numCta=@numeroCuenta) > @VALOR)
					BEGIN
						update Cuentas
						set saldo_Efectivo= saldo_Efectivo - @valor, @saldoEfectivo = saldo_Efectivo - @valor
						where numCta=@numeroCuenta
						insert into Detalle_Mov_Cta values(@numeroCuenta,GETDATE(),UPPER(@caracter),@valor)
						PRINT 'El debito de la cuenta ' + convert (char(3),@numeroCuenta)+ ' fue realizado con exito'			
						IF (@@ERROR <> 0)
						BEGIN
							PRINT 'El debito de la cuenta ' + convert (char(3),@numeroCuenta) + ' no fue realizado con exito'
							RETURN(3)
						END
						ELSE
						BEGIN
							RETURN (0)
						END
					END
					ELSE
					BEGIN
						PRINT 'NO TIENE FONDOS SUFICIENTES'
						RETURN(3)
					END
				END
				ELSE IF(@caracter = 'C')
				BEGIN
					update Cuentas
					set saldo_Efectivo= saldo_Efectivo + @valor, @saldoEfectivo= saldo_Efectivo + @valor
					where numCta=@numeroCuenta
					insert into Detalle_Mov_Cta values(@numeroCuenta,GETDATE(),UPPER(@caracter),@valor)
					PRINT 'El credito de la cuenta ' + convert(char(3),@numeroCuenta) + ' fue realizado con exito'
					IF (@@ERROR <> 0)
					BEGIN
						PRINT 'El credito de la cuenta ' + convert (char(3),@numeroCuenta) + ' no fue realizado con exito'
						RETURN(3)
					END
					ELSE
					BEGIN
						RETURN (0)
					END
				END
			end
		ELSE IF (@@ERROR > 0)
			BEGIN
			PRINT('Hubo un error al efectuar la operacion ' + convert (char(10),@@ERROR))
			RETURN(2)
			END
		END
	GO

------------------------------------------------------------------
------------------------------------------------------------------
--	DROP PROCEDURE SP_1
------------------------------------------------------------------
------------------------------------------------------------------

--PRUEBA DE EJECUCION
BEGIN TRAN 
	BEGIN TRY
		DECLARE @COD_RETORNO INT, @SALDO money
		EXEC @COD_RETORNO = SP_1 1000,3,'D', @SALDO output
		print 'Saldo_Efectivo : ' + convert (char(10),@saldo)
		PRINT @COD_RETORNO
		COMMIT TRAN
	END TRY
	BEGIN CATCH
			print('ERROR EN LA TRANSACCION')
		ROLLBACK TRAN
	END CATCH

select * from Cuentas
SELECT * FROM Detalle_Mov_Cta
go

/*
2.	Escriba un SP que recibe como parámetro la identificación de cliente (codcliente).
•	Localice si este cliente tiene PRESTAMOS.  Si no existe el cliente, retorne 1, si no tiene PRESTAMOS, retorne 2.
•	Retorne en dos parámetros de salida el monto de PRESTAMOS y saldo de PRESTAMOS.
•	Si hay error, retorne 3;  si no retorne 0.
•	Para cada retorno obtenga un mensaje con print.
•	Use TRY-CATCH 
*/
SELECT * FROM CLIENTES 
SELECT * FROM Prestamos
GO

CREATE PROCEDURE SP_2  @codigoCliente int, @montoPrestamo money output, @saldoPrestamo money output
AS
	IF EXISTS(SELECT * FROM Clientes WHERE codCliente=@codigoCliente)
		BEGIN
			IF EXISTS(SELECT numPrestamo FROM Prestamos WHERE codCliente=@codigoCliente)
				BEGIN
				SELECT @montoPrestamo = monto, @saldoPrestamo = saldo 
				FROM Prestamos 
				WHERE codCliente=@codigoCliente
				IF (@@ERROR <> 0)
					BEGIN
						PRINT 'Hubo un error'
						RETURN(3)
					END
				ELSE
					BEGIN
					PRINT 'No hubo error'
						RETURN (0)
					END
				END
			ELSE
				BEGIN
					PRINT 'NO EXISTE PRESTAMO CON ESE NUMERO DE PRESTAMO'
					RETURN(2)
				END
		END
	ELSE
		BEGIN
			PRINT 'NO EXISTE ESTE CLIENTE'
			RETURN(1)
		END

------------------------------------------------------------------
------------------------------------------------------------------
--	DROP PROCEDURE SP_2
------------------------------------------------------------------
------------------------------------------------------------------

--PRUEBA DE EJECUCION
BEGIN TRAN 
	BEGIN TRY
		DECLARE @COD_RETORNO INT,@CODIGO INT = 23, @MONTO money, @SALDO money
		EXEC @COD_RETORNO = SP_2 @CODIGO,@MONTO output, @SALDO output
		print 'Monto del prestamo : ' + convert (char(10),@monto)
		print 'Saldo del prestamo : ' + convert (char(10),@saldo)
		print 'Codigo de cliente  : ' + convert (char(10),@codigo)
		print 'Codigo de retorno  : ' + convert (char(10),@COD_RETORNO)
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		print('ERROR EN LA TRANSACCION')
		ROLLBACK TRAN
	END CATCH
go
/*
3.	Escriba una transacción dentro de un SP, que recibe como parámetro el numprestamo y valor (money, valor de abono).  
	Ingresa un nuevo registro a DETALLE_PRESTAMO, con fecha_pago, la fecha del día y resta el valor abonado del saldo del préstamo correspondiente.  
•	Trabaje con una transacción y considere las sentencias COMMIT y ROLLBACK que sean pertinentes para asegurar la consistencia de transacción.
•	Utilice TRY-CATCH
*/
select * from Prestamos
select * from Detalle_Prestamo
GO

CREATE PROCEDURE SP_3  @numeroPrestamo int, @valor money
AS
IF ((SELECT saldo FROM Prestamos WHERE numPrestamo=@numeroPrestamo) > @valor)
	BEGIN
	insert into Detalle_Prestamo values(GETDATE(),@valor,@numeroPrestamo)
	update Prestamos
	set saldo= saldo - @valor
	where numPrestamo=@numeroPrestamo
	IF (@@ERROR <> 0)
		BEGIN
			PRINT 'Hubo un error'
			RETURN(1)
		END
	ELSE
		BEGIN
		PRINT 'No hubo error'
			RETURN (0)
		END
	END
ELSE
	BEGIN
	PRINT 'Ya no queda esa cantidad de saldo, ingrese un numero menor'
	RETURN(1)
	END
go

------------------------------------------------------------------
------------------------------------------------------------------
--	DROP PROCEDURE SP_3
------------------------------------------------------------------
------------------------------------------------------------------

--PRUEBA DE EJECUCION
BEGIN TRAN 
	BEGIN TRY
		DECLARE @COD_RETORNO INT, @NUMEROPRESTAMO INT = 3
		EXEC @COD_RETORNO = SP_3 @NUMEROPRESTAMO,10
		print 'Numero de prestamo : ' + convert (char(10),@NUMEROPRESTAMO)
		print 'Codigo de retorno  : ' + convert (char(10),@COD_RETORNO)
		select * from Prestamos
		select * from Detalle_Prestamo
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		print('ERROR EN LA TRANSACCION')
		ROLLBACK TRAN
	END CATCH
go

/*
4.	Escriba un procedimiento que recibe como parámetro la identificación de cliente (codcliente).  Localice si este cliente tiene cuentas corrientes.
	Si no existe el cliente, retorne 1, si no tiene cuentas corrientes, retorne 2.
•	Retorne en un parámetro de salida la suma de valor de detalle_mov_cta, de todas las cuentas corrientes, siempre que sean de tipo_mov = ‘crédito’.
•	Si hay error, retorne 3;  si no retorne 0.
•	Para cada retorno obtenga un mensaje con print.
*/
select * from Cuentas
select * from Clientes
select sum(valor) from Detalle_Mov_Cta where tipo_Mov = 'C'
go

CREATE PROCEDURE SP_4  @CodigoCliente int, @SumaDetalle money output
AS
	IF EXISTS(SELECT Cl.codCliente FROM Clientes Cl
	WHERE Cl.codCliente = @CodigoCliente)
		BEGIN
			IF EXISTS(SELECT tipo FROM Cuentas Cu join ClientexCta ClCt 
			on Cu.numCta = ClCt.numCta join Clientes Cl 
			on Cl.codCliente = ClCt.codCliente
			WHERE Cl.codCliente = @CodigoCliente and tipo='Corriente')
				BEGIN
					SELECT @SumaDetalle=sum(valor)
					from Detalle_Mov_Cta De join Cuentas Cu 
					on Cu.numCta = De.numCta
					join ClientexCta ClCt 
					on Cu.numCta = ClCt.numCta 
					join Clientes Cl
					on Cl.codCliente = ClCt.codCliente
					where Cl.codCliente = @CodigoCliente and tipo='Corriente' and tipo_Mov='C'
					IF (@@ERROR <> 0)
						BEGIN
							PRINT 'Hubo un error'
							RETURN(3)
						END
					ELSE
						BEGIN
						PRINT 'No hubo error'
							RETURN (0)
						END
				END
			ELSE
				BEGIN
				Print 'El cliente ' + convert (char(3),@CODIGOCLIENTE) + 'no tiene cuentas corrientes'
				return(2)
				END
		END
	ElSE
		BEGIN
		Print 'No existe este cliente'
		return(1)
		END
	GO

------------------------------------------------------------------
------------------------------------------------------------------
--	DROP PROCEDURE SP_4
------------------------------------------------------------------
------------------------------------------------------------------

--PRUEBA DE EJECUCION
BEGIN TRAN 
	BEGIN TRY
		DECLARE @COD_RETORNO INT, @CODIGOCLIENTE int = 3, @SUMACREDITO MONEY
		EXEC @COD_RETORNO = SP_4 @CODIGOCLIENTE, @SUMACREDITO output
		print 'Suma de las cuentas corrientes del cliente ' 
		+ convert (char(3),@CODIGOCLIENTE) + ' :' + convert (char(10),@SUMACREDITO)
		print 'Codigo de retorno  : ' + convert (char(10),@COD_RETORNO)
		COMMIT TRAN
	END TRY
	BEGIN CATCH
			print('ERROR EN LA TRANSACCION')
		ROLLBACK TRAN
	END CATCH

/*
5.	Escriba un SP que realice lo siguiente: Reciba como parámetro un número de préstamo y muestre  lo siguiente:
•	Si este préstamo no existe, imprime mensaje correspondiente, retorne 1
•	Si existe, verifique si existen pagos en Detalle-prestamo, sobre ese préstamo, realizados en los últimos tres meses.  Si no existen movimientos, 
	imprime mensaje, retorne 2.
•	Si existen pagos, presente los pagos ordenados por fecha_pago.  Si no hay error retorne 0.
*/
SELECT * FROM Prestamos;
SELECT * FROM Detalle_Prestamo;
go 

CREATE PROCEDURE SP_5  @numeroPrestamo int
AS
	IF NOT EXISTS(SELECT * FROM Prestamos WHERE numPrestamo=@numeroPrestamo)
		BEGIN
			PRINT 'NO EXISTE PRESTAMO CON ESE NUMERO DE PRESTAMO'
			RETURN(1)
		END
	ElSE IF EXISTS (SELECT NUM_DETALLE_PRES 
		FROM PRESTAMOS JOIN DETALLE_PRESTAMO 
		ON PRESTAMOS.numPrestamo = DETALLE_PRESTAMO.NUMPRESTAMO WHERE Prestamos.numPrestamo = @numeroPrestamo 
		and datediff ( mm, GETDATE() , fecha_pago)<=3 
		and datediff ( yy, GETDATE() , fecha_pago)=0)
		BEGIN
		SELECT VALOR, fecha_pago FROM PRESTAMOS JOIN DETALLE_PRESTAMO 
		ON PRESTAMOS.numPrestamo = DETALLE_PRESTAMO.NUMPRESTAMO
		where Prestamos.numPrestamo = @numeroPrestamo 
		and datediff ( mm, GETDATE() , fecha_pago)<=3 
		and datediff ( yy, GETDATE() , fecha_pago)=0
		ORDER BY fecha_pago
		PRINT 'No hay error'
		RETURN (0)
		END
	ELSE
		BEGIN
			PRINT 'NO EXISTEN MOVIMIENTOS'
			RETURN(2)
		END	
GO
--PRUEBA DE EJECUCION
BEGIN TRAN 
	BEGIN TRY
		DECLARE @COD_RETORNO INT, @numeroPrestamo INT
		EXEC @COD_RETORNO = SP_5 133
		print 'Codigo de retorno  : ' + convert (char(10),@COD_RETORNO)
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH

	SELECT * FROM Prestamos
	SELECT * FROM Detalle_Prestamo
	go


/*
6.	Escriba un SP que realice lo siguiente: Reciba como parámetro un número de cuenta y detalle de esa cuenta, lo siguiente:
•	Si la cuenta no existe, imprime mensaje, retorne 1
•	Si la cuenta existe, verifique si existen movimientos en Detalle-mov-cta, sobre esa cuenta, correspondientes a los dos meses previos a la fecha actual.
	Si no existen movimientos, imprime mensaje, retorne 2
•	Si existen movimientos, presente los movimientos ordenados por tipo_mov, primero los créditos, luego los débitos.  Si no hay error retorne 0.
*/

SELECT * FROM Cuentas;
SELECT * FROM Detalle_Mov_Cta;
go

CREATE PROCEDURE SP_6  @numeroCuenta int
AS
	IF NOT EXISTS(SELECT * FROM Cuentas WHERE numCta=@numeroCuenta)
		BEGIN
			PRINT 'NO EXISTE CUENTA CON ESE NUMERO DE CUENTA'
			RETURN(1)
		END
	ElSE IF EXISTS (SELECT FECHA_MOV
		FROM Cuentas JOIN Detalle_Mov_Cta
		ON CUENTAS.numCta = Detalle_Mov_Cta.numCta WHERE CUENTAS.numCta = @numeroCuenta 
		and datediff ( mm, GETDATE() , fecha_Mov)<=2 
		and datediff ( yy, GETDATE() , fecha_Mov)=0)
		BEGIN
		SELECT num_Mov, VALOR, tipo_Mov, fecha_Mov FROM Cuentas JOIN Detalle_Mov_Cta
		ON CUENTAS.numCta = Detalle_Mov_Cta.numCta WHERE CUENTAS.numCta = @numeroCuenta 
		and datediff ( mm, GETDATE() , fecha_Mov)<=2 
		and datediff ( yy, GETDATE() , fecha_Mov)=0
		ORDER BY tipo_Mov
		PRINT 'No hay error'
		RETURN (0)
		END
	ELSE
		BEGIN
			PRINT 'NO EXISTEN MOVIMIENTOS'
			RETURN(2)
		END	
GO

--PRUEBA DE EJECUCION
BEGIN TRAN 
	BEGIN TRY
		DECLARE @COD_RETORNO INT

		EXEC @COD_RETORNO = SP_6 1
		print 'Codigo de retorno  : ' + convert (char(10),@COD_RETORNO)
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH

	SELECT * FROM Cuentas
	SELECT * FROM Detalle_Mov_Cta
	go
