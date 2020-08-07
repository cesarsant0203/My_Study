-- TRY -CATCH 

USE PUBS;
GO
-- Verifica si ya existe el stored procedure; si existe se borra
IF OBJECT_ID ( 'usp_GetErrorInfo', 'P' ) IS NOT NULL 
    DROP PROCEDURE usp_GetErrorInfo;
GO

-- Crea procedimiento para recuperar información del error 
CREATE PROCEDURE usp_GetErrorInfo
AS
SELECT
    ERROR_NUMBER() AS ErrorNumber
    ,ERROR_SEVERITY() AS ErrorSeverity
    ,ERROR_STATE() AS ErrorState
    ,ERROR_PROCEDURE() AS ErrorProcedure
    ,ERROR_LINE() AS ErrorLine
    ,ERROR_MESSAGE() AS ErrorMessage;
RETURN


BEGIN TRY
    -- Provoca un error al dividir para cero
    SELECT 1/0;
END TRY
BEGIN CATCH
    -- Ejecuta el stored procedure para recuperar información del error 
    EXECUTE usp_GetErrorInfo;
END CATCH;



BEGIN TRY
    -- Tabla que no existe; no captura el error 
    -- de resolución del nombre del objeto 
    SELECT * FROM NonexistentTable;
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



-- Verifica que el stored procedure no existe
IF OBJECT_ID ( 'usp_ExampleProc', 'P' ) IS NOT NULL 
    DROP PROCEDURE usp_ExampleProc;
GO

-- Crea un stored procedure que provoca un error en la 
-- resolución de un nombre de objeto

CREATE PROCEDURE usp_ExampleProc
AS
    SELECT * FROM NonexistentTable;
RETURN 
GO

BEGIN TRY
    EXECUTE usp_ExampleProc;
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;


USE Pubs
GO

select * from titles

go

BEGIN TRANSACTION;

BEGIN TRY
    -- Genera un error por infracción de un constraint
    DELETE FROM Titles 
    WHERE title_id = 'BU7832'
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO


-- Ejemplo de una transacción que controla transferencia entre cuentas 

DECLARE @importe DECIMAL(18,2),
	@CuentaOrigen VARCHAR(12),
	@CuentaDestino VARCHAR(12)
 
/* Asignamos el importe de la transferencia y las cuentas de origen y destino */

SET @importe = 50 
SET @CuentaOrigen = '200700000002'
SET @CuentaDestino = '200700000001'
 
BEGIN TRANSACTION -- O solo BEGIN TRAN
BEGIN TRY
/* Descontamos el importe de la cuenta origen */
UPDATE CUENTAS 
SET SALDO = SALDO - @importe
WHERE NUMCUENTA = @CuentaOrigen
 
/* Registramos el movimiento */
INSERT INTO MOVIMIENTOS 
(IDCUENTA, SALDO_ANTERIOR, SALDO_POSTERIOR, 
 IMPORTE, FXMOVIMIENTO)
SELECT 
IDCUENTA, SALDO + @importe, SALDO, @importe, getdate()
FROM CUENTAS
WHERE NUMCUENTA = @CuentaOrigen
 
/* Incrementamos el importe de la cuenta destino */
UPDATE CUENTAS 
SET SALDO = SALDO + @importe
WHERE NUMCUENTA = @CuentaDestino
 
/* Registramos el movimiento */
INSERT INTO MOVIMIENTOS 
(IDCUENTA, SALDO_ANTERIOR, SALDO_POSTERIOR,
 IMPORTE, FXMOVIMIENTO)
SELECT 
IDCUENTA, SALDO - @importe, SALDO, @importe, getdate()
FROM CUENTAS
WHERE NUMCUENTA = @CuentaDestino
 
/* Confirmamos la transaccion*/ 
COMMIT TRANSACTION -- O solo COMMIT
 
END TRY
BEGIN CATCH
/* Hay un error, deshacemos los cambios*/ 
ROLLBACK TRANSACTION -- O solo ROLLBACK
PRINT 'Se ha producido un error!'
END CATCH

-- Creamos una base de datos para realizar el ejemplo y la llamamos Pruebas

USE Pruebas
GO
-- Creamos una tabla alumnos la cual utilizaremos de ejemplo

IF OBJECT_ID('ALUMNOS') IS NOT NULL
   DROP TABLE ALUMNOS
GO

CREATE TABLE ALUMNOS (ID INT PRIMARY KEY, NOMBRE VARCHAR(30),
                       FECHA DATETIME,EDAD INT
                       CHECK (EDAD >=11 AND EDAD <=18))
GO
-- Ingresamos registros
INSERT INTO ALUMNOS VALUES (1,'MARIO','20100101',11)

-- Intentaremos ingresar un registro que no cumple con el check
INSERT INTO ALUMNOS VALUES (2,'JULIAN','20100101',3)   
                    
-- Control de errores
SET NOCOUNT ON
BEGIN TRY
   INSERT INTO ALUMNOS VALUES (2,'JULIAN','20100101',3)
END TRY
BEGIN CATCH
   SELECT ERROR_NUMBER() AS NUMERO,
          ERROR_SEVERITY() AS SEVERIDAD,
          ERROR_STATE() AS ESTADO,
          ERROR_MESSAGE() AS MENSAJE
END CATCH
--Transacciones
-- Intentaremos insertar 3 registros, 2 buenos y 1 errado

BEGIN TRANSACTION
BEGIN TRY
   -- Registro válido
   INSERT INTO ALUMNOS VALUES (2,'ALDO','20100101',17)                       
   INSERT INTO ALUMNOS VALUES (2,'VICTOR','20100101',18)                       
   -- Registro no válido
   INSERT INTO ALUMNOS VALUES (3,'JUAN','20100101',3)                          
 
   COMMIT TRANSACTION
END TRY

BEGIN CATCH
   ROLLBACK TRANSACTION  
   RAISERROR('Se ha generado un error al insertar',16,1)
END CATCH
 -- Ver la tabla ALUMNOS
SELECT * FROM ALUMNOS

-- Anidamiento de errores
-- Creamos una tabla para la auditoria de errores

IF OBJECT_ID('LOG_ERRORES') IS NOT NULL
   DROP TABLE LOG_ERRORES
GO
CREATE TABLE LOG_ERRORES
(ID INT IDENTITY,NUMERO BIGINT,MENSAJE VARCHAR(1000) NOT NULL)
GO
SET NOCOUNT ON
-- Habrá un error porque la edad no cumple con el check
BEGIN TRY
   INSERT INTO ALUMNOS VALUES (2,'ABELARDO','20100101',3)                       
END TRY
BEGIN CATCH
   BEGIN TRY
     -- Intentemos insertar el error en al tabla de auditoria de errorres
     --  pero no pasemos el mensaje con lo cual da error
        INSERT INTO LOG_ERRORES (NUMERO,MENSAJE) VALUES (ERROR_NUMBER(),NULL)
   END TRY
 
   BEGIN CATCH
       PRINT 'NO SE PUDO GUARDAR EN LA TABLA LOG_ERRORES'
   END CATCH
END CATCH

-- Limpiemos las 2 tablas
DROP TABLE ALUMNOS;
DROP TABLE LOG_ERRORES;

