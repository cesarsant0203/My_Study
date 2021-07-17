/*  BASES DE DATOS
    EJERCICIOS RESUELTOS SOBRE PROCEDIMIENTOS ALMACENADOS
	DRA. ROSA NAVARRETE

*/

/*  Sobre la BD BANCO */


/*1.	Escriba un SP, que recibe como parámetros de entrada:
 un valor (money), un número de cuenta y un carácter (C o D), 
que indica si es un débito para la cuenta ('D') o un crédito ('C').   

Como parámetro de salida obtenga el saldo de la cuenta (saldo efectivo si 
se trató de un débito y saldo_contable, si fue un crédito) 
-	Si no existe la cuenta retorne 1.
-   Si existe la cuenta pero no es de tipo 'corriente' retorne 2
-	Si encuentra la cuenta corriente efectuar la operación de
 débito o crédito a la cuenta (según indica el carácter de parámetro),
 afectando el saldo_contable. Verificar si existe algún error 
 de existir error, retorne 3. 
-	Insertar el respectivo registro en la tabla DETALLE_MOV_CTA. 
Considere la fecha del sistema como fecha del movimiento.  
-	Para cada retorno emita un mensaje con print.
-	Considere las sentencias COMMIT y ROLLBACK que sean pertinentes 
para asegurar la consistencia de transacción.*/

USE BANCO 
GO


CREATE PROCEDURE DEBCRED
	@VALOR MONEY,
	@NUM_CUENTA INT,
	@CARACTER CHAR(1),
	@SALDO MONEY OUTPUT
AS
	IF NOT EXISTS(SELECT * FROM Cuentas WHERE numCta=@NUM_CUENTA)
		BEGIN
			PRINT 'NO EXISTE CUENTA CON ESE NUMERO'
			RETURN(1)
		END
	IF EXISTS (SELECT * FROM Cuentas WHERE numCta=@NUM_CUENTA AND tipo <> 'CORRIENTE')
		BEGIN
			PRINT 'NO ES CUENTA CORRIENTE'
			RETURN(2)
		END
	
	IF(@CARACTER='D')
	-- Débito: Afecta tanto al saldo_contable como a saldo_efectivo
	-- Debe verificar que saldo_efectivo sea > @VALOR 
		BEGIN
			IF EXISTS (SELECT * FROM Cuentas WHERE numCta=@NUM_CUENTA 
				AND saldo_efectivo > @VALOR)
				BEGIN 
					UPDATE Cuentas SET saldo_efectivo=saldo_efectivo-@VALOR 
		 			WHERE numCta=@NUM_CUENTA;
					UPDATE Cuentas SET saldo_Contable=saldo_Contable-@VALOR 
		 			WHERE numCta=@NUM_CUENTA;
					SET @SALDO=(SELECT saldo_Efectivo FROM Cuentas 
						WHERE numCta=@NUM_CUENTA);
					
					INSERT INTO Detalle_Mov_Cta ([numCta],[fecha_Mov],[tipo_Mov],[valor]) 
					VALUES(@NUM_CUENTA, GETDATE(),@CARACTER,@VALOR);
				END 
				    ELSE 
					BEGIN 
					  PRINT 'ERROR, NO EXISTE EL SALDO_EFECTIVO SUFICIENTE'
					  RETURN (3)
		 			END
		END

	IF(@CARACTER='C')
		-- Afecta solo a saldo_contable 
		BEGIN
			UPDATE Cuentas SET saldo_Contable=saldo_Contable+@VALOR 
			WHERE numCta=@NUM_CUENTA;
			SET @SALDO=(SELECT saldo_contable FROM Cuentas 
						WHERE numCta=@NUM_CUENTA);
			INSERT INTO Detalle_Mov_Cta ([numCta],[fecha_Mov],[tipo_Mov],[valor]) 
			VALUES(@NUM_CUENTA, GETDATE(),@CARACTER,@VALOR);
		END
		
		
GO
		
exec sp_helptext debcred;

SELECT * FROM CUENTAS 



BEGIN TRAN 
	BEGIN TRY
		DECLARE @COD_RETORNO INT, @SALDO MONEY
		EXEC @COD_RETORNO = DEBCRED 350,2,'C', @SALDO OUTPUT
		PRINT @COD_RETORNO
		PRINT @SALDO
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH

	SELECT * FROM Cuentas
	SELECT * FROM Detalle_Mov_Cta
	go





/*3.Escriba un SP que reciba como parámetros el apellido y nombre 
de un ejecutivo y retornar como salida un valor entero que representa 
el número de clientes que atiende el ejecutivo.   
-	Localiza al ejecutivo, si no lo encuentra retorna 1.
-	Si encuentra el ejecutivo, contar cuántos clientes atiende el ejecutivo y 
    retornar el valor.

	*/
	
USE BANCO 
GO

	CREATE PROCEDURE PROCEDIMIENTO3
		@NOMBRE CHAR(30),
		@APELLIDO CHAR(30),
		@NUM_CLIENTE INT OUTPUT
	AS
		IF  NOT EXISTS (SELECT * FROM Ejecutivos 
		                WHERE nombre=@NOMBRE AND apellido=@APELLIDO)
			BEGIN
				RETURN(1)
			END
		ELSE
			BEGIN
			SET @NUM_CLIENTE=(SELECT COUNT(*) 
			FROM Clientes C join Ejecutivos E 
			ON E.codEjecutivo=C.codEjecutivo 
			WHERE E.apellido=@APELLIDO AND E.nombre=@NOMBRE)
			END
	GO

	SELECT * FROM EJECUTIVOS
	GO

	BEGIN TRAN
	BEGIN TRY
		DECLARE @NUMERO_CLIENTES INT, @VALOR_RETORNADO INT
		EXEC @VALOR_RETORNADO= PROCEDIMIENTO3 'Andrea','Espinoza', 
		@NUM_CLIENTE=@NUMERO_CLIENTES OUTPUT
		PRINT 'EXISTE(N) '+RTRIM(CONVERT(CHAR(30),@NUMERO_CLIENTES))+' CLIENTE(S) ASOCIADOS AL EJECUTIVO'
		PRINT 'RETORNO ' + CONVERT(CHAR(30),@VALOR_RETORNADO)
		COMMIT TRAN
	END TRY
	BEGIN CATCH
	 ROLLBACK TRAN
	END CATCH

	SELECT * FROM Clientes
	SELECT * FROM Ejecutivos
	GO
	
/*4.	Escriba una transacción dentro de un SP, que recibe como 
parámetro el numprestamo y valor (money, valor de abono). 
 Ingresa un nuevo registro a DETALLE_PRESTAMO, con fecha_pago, 
la fecha del día y resta el valor abonado del saldo del préstamo correspondiente.  
Considere las sentencias COMMIT y ROLLBACK que sean pertinentes.*/

select * from Prestamos
go

CREATE PROCEDURE SP_4
	@numeroPrestamo INT,
	@valor MONEY
AS
	IF NOT EXISTS (SELECT * FROM Prestamos WHERE @numeroPrestamo=numPrestamo)
		BEGIN
			PRINT 'Este prestamo no existe'
		END
	ELSE
		BEGIN
			INSERT INTO Detalle_Prestamo ([fecha_pago],[valor],[numPrestamo]) 
			VALUES (GETDATE(), @valor, @numeroPrestamo)
			UPDATE Prestamos 
			SET saldo=saldo-@valor 
			WHERE numPrestamo=@numeroPrestamo
		END

--Prueba de la transacccion

BEGIN TRAN TranPrueba
	BEGIN TRY
		Declare @Prestamo int = 1
		EXEC SP_4 @Prestamo,2500
		COMMIT TRAN TranPrueba
	END TRY
	BEGIN CATCH
		PRINT 'La transaccion no se ejecuto correctamente'
	END CATCH
go

select * from Detalle_Prestamo
select * from Prestamos
go









--solucionj---------------------------------------------------------------------------------------------
USE BANCO 
GO

SELECT * FROM Detalle_Prestamo
SELECT * FROM Prestamos
GO

CREATE PROCEDURE PROCEDIMIENTO4
	@NUMPRESTAMO INT,
	@VALOR MONEY
AS
	IF EXISTS (SELECT * FROM Prestamos WHERE @NUMPRESTAMO=numPrestamo)
		BEGIN
			UPDATE PRESTAMOS SET saldo=saldo-@VALOR WHERE numPrestamo=@NUMPRESTAMO
			INSERT INTO Detalle_Prestamo ([fecha_pago],[valor],[numPrestamo]) VALUES (GETDATE(), @VALOR, @NUMPRESTAMO)
		END
	ELSE
		BEGIN
			PRINT 'NO SE PUEDE ABONAR A UN PRESTAMO QUE NO EXISTE'
			RETURN(1)
		END

BEGIN TRAN
	BEGIN TRY
		EXEC PROCEDIMIENTO4 2,2500
		PRINT 'NO EXISTIO ERROR EN LA TRANSACCION'
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		PRINT 'EXISTIO ERROR EN LA TRANSACCION'
		ROLLBACK TRAN
	END CATCH

/*5.	Escriba un procedimiento que recibe como parámetro la identificación 
de cliente (codcliente).  Localice si este cliente tiene cuentas corrientes. 
 Si no existe el cliente, retorne 1, si no tiene cuentas corrientes, retorne 2.
Retorne en un parámetro de salida la suma de valor de detalle_mov_cta, de 
todas las cuentas corrientes, siempre que sean de tipo_mov = ‘crédito’.
Si hay error, retorne 3;  si no retorne 0.
Para cada retorno obtenga un mensaje con print.
*/

USE BANCO 
GO

SELECT * FROM ClientexCta
SELECT * FROM Cuentas
SELECT * FROM Detalle_Mov_Cta
SELECT * FROM Clientes
GO


CREATE PROCEDURE PROCEDIMIENTO5
	@COD_CLIENTE INT,
	@SUMA_VALOR MONEY OUTPUT
AS
	IF NOT EXISTS ( SELECT * FROM CLIENTES WHERE @COD_CLIENTE=codCliente)
		BEGIN
			PRINT 'NO EXISTE EL CLIENTE'
			RETURN 1
		END 
	ELSE
		BEGIN
			IF NOT EXISTS (SELECT * FROM ClientexCta CXC, Cuentas C WHERE CXC.codCliente=@COD_CLIENTE AND CXC.numCta=C.numCta AND C.tipo='CORRIENTE')
				BEGIN
					PRINT 'NO EXISTEN CUENTAS CORRIENTES PERTENECIENTES A ESE CLIENTE'
					RETURN 2
				END
			ELSE
				BEGIN
					SET @SUMA_VALOR=(SELECT SUM(valor) FROM Detalle_Mov_Cta WHERE tipo_Mov='C' AND numCta=(SELECT numCta FROM ClientexCta WHERE codCliente=@COD_CLIENTE))
					IF(@@ERROR<>0)
						BEGIN
							PRINT 'EXISTIO ERROR EN LA TRANSACCION'
							RETURN 3
						END
					ELSE
						BEGIN
							PRINT 'NO EXISTIO ERROR EN LA TRANSACCION'
							RETURN 0
						END
				END
		END
GO

BEGIN TRAN
	BEGIN TRY
		DECLARE @SUMA MONEY
		EXEC PROCEDIMIENTO5 1, @SUMA_VALOR=@SUMA OUTPUT
		PRINT 'EL VALOR TOTAL DE LAS CUENTAS DEL CLIENTE ES '+LTRIM(CONVERT(CHAR(30), @SUMA))
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		PRINT 'EXISTIO ERROR, HACIENDO ROLLBACK DE LA TRANSACCION'
		ROLLBACK TRAN
	END CATCH


/*6.Escriba un SP que recibe 2 parámetros de entrada:  apellido y nombre del cliente.  
Si encuentra 0 registros con ese apellido y nombre, retorne 1 e indique con un mensaje. 
 Si encuentra más de 1 registro, retorne 2, e indique en el mensaje que hay homónimos.  
Si encuentra un solo cliente, muestre todas las cuentas que tiene (numcta, titulo, nombre de la sucursal,
 tipo y saldo_contable).
*/


USE BANCO 
GO

SELECT * FROM Clientes
SELECT * FROM Cuentas
SELECT * FROM ClientexCta
GO


CREATE PROCEDURE PROCEDIMIENTO6
	@NOMBRE CHAR(30),
	@APELLIDO CHAR(30)
AS
	IF NOT EXISTS (SELECT * FROM Clientes WHERE nombre=@NOMBRE AND apellido=@APELLIDO)
		BEGIN
			PRINT 'NO EXISTEN CLIENTES CON ESE NOMBRE Y APELLIDO'
			RETURN 1
		END
	ELSE
		BEGIN
			DECLARE @NUM_ENCONTRADOS INT
			SET @NUM_ENCONTRADOS=(SELECT COUNT(*) FROM Clientes WHERE nombre=@NOMBRE AND apellido=@APELLIDO)
			IF (@NUM_ENCONTRADOS>1)
				BEGIN
					PRINT 'EXISTEN HOMONIMOS'
					RETURN 2
				END 
			IF(@NUM_ENCONTRADOS=1)
				BEGIN
					SELECT CTA.numCta, CTA.titulo, CTA.Sucursal ,CTA.tipo , CTA.saldo_contable FROM Cuentas CTA, Clientes C, ClientexCta CXCTA WHERE C.nombre=@NOMBRE AND C.apellido=@APELLIDO AND C.codCliente=CXCTA.codCliente AND CXCTA.numCta=CTA.numCta
					RETURN 0
				END
		END
GO

BEGIN TRAN
	BEGIN TRY
		EXEC PROCEDIMIENTO6 'Juan Manuel','Paucar Lopez'
		COMMIT TRAN 
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH


/* 7.  Escriba un SP para realizar una transferencia entre cuentas. 
El SP recibe como parámetros: el número de cuenta de origen, el valor a debitar de
esa cuenta, el número de cuenta de destino. (Usar el saldo_contable en cuenta origen
y en cuenta destino). Tome como fecha del movimiento 
la fecha del sistema. Debe considerar que la transferencia genera un DETALLE_MOV de 
débito de la cuenta origen y otro de crédito en la cuenta destino. Además, verifique
si la cuenta de origen tiene el saldo suficiente, en caso contrario rollback. Si hay
algún error, rollback a la transacción. La transferencia debe tratarse como 
una transacción para considerar el commit y el rollback respectivos */

use banco
go

select * from cuentas
go

sp_help cuentas
go

drop procedure sp_transferencia
GO

create procedure sp_transferencia @cta_origen int, @cta_destino int, @valor money
as
declare @saldo_efectivo money

begin tran
if not exists (select * from cuentas
               where numCta=@cta_origen)
   begin
     print 'No existe la cuenta origen'
     return (1)
   end

if not exists (select * from cuentas
               where numCta=@cta_destino)
   begin
     print 'No existe la cuenta destino'
     return (2)
   end
   if (select saldo_efectivo from cuentas
   where numCta=@cta_origen) < @valor
      begin
	     print 'El saldo de la cuenta es insuficiente'
		 return (2)
	  end
   
   update cuentas 
   set saldo_efectivo =saldo_efectivo - @valor
   where numCta = @cta_origen

   if @@error > 0
      begin
       rollback tran
	   return (3)
	  end

   update cuentas
   set saldo_efectivo = saldo_efectivo + @valor
   where numCta=@cta_destino

   if @@error > 0
      begin
       rollback tran
	   return (4)
	  end

	commit tran
	return 0

--- Prueba del SP 

select * from cuentas

declare @retorno int

exec @retorno=sp_transferencia 2,3,500

print @retorno

