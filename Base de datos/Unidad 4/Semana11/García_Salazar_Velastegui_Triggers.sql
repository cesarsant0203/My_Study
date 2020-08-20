-- Tarea Triggers
-- Integrantes: Gandhy García, Marco Salazar, Daniel Velastegui
-- Fecha: 2020 - 08 - 16 

-- Sobre la BD PUBS

use pubs 
go

-- 1. Escriba un TRIGGER para UPDATE sobre la tabla SALES. El trigger debe verificar si la venta corresponde 
-- a un libro cuyo título corresponde a libros con un valor en el campo advance, superior a 7000; de ser así, 
-- el libro debe venderse únicamente con Payterms ‘ON Invoice’. Si eso no se cumple, hacer un ROLLBACK. 

select * from sales
go

select * from titles
go

CREATE TRIGGER TR_01
ON sales
FOR UPDATE
AS

declare @advance money;

select @advance = t.advance
from inserted i, titles t
where i.title_id = t.title_id

if @advance > 7000
begin
	if (select payterms
		from inserted) <> 'ON invoice'
	begin
		rollback tran
	end
end
GO

UPDATE sales
set payterms = 'Net 30'
where title_id = 'BU2075'
GO

-- 2. Escriba un TRIGGER para INSERT en la tabla STORES. El trigger detecta si el campo STATE corresponde al 
-- valor de STATE con mayor número de tiendas, de ser así emite un mensaje que diga: “ATENCIÓN: Ya existe un 
-- número alto de tiendas en el state (valor del state)”.

select * from stores
go

CREATE TRIGGER TR_02
ON stores
FOR INSERT
AS

declare @state char(2);
select @state = state from inserted;

if @state = 
(select state
from(
select state, count(*) as numTiendas
from stores
group by state
) aux
where numTiendas = (select max(numTiendas)
					from (
					select state, count(*) as numTiendas
					from stores
					group by state
					) aux )
)
begin
	print 'ATENCIÓN: Ya existe un número alto de tiendas en el state ' + @state
end
GO

insert into stores
values ('5467', 'New Bookstore', '366 East Belmont Ave.', 'Fresno', 'CA', '93722')
go

-- 3. Escriba un TRIGGER INSTEAD OF UPDATE en la table JOBS. Si se intenta actualizar un registro indique 
-- “No tiene autorización para cambiar valores de registros en JOBS” y no permita la actualización. 

select * from jobs;
go

CREATE TRIGGER TR_03
ON jobs
INSTEAD OF UPDATE
AS
PRINT 'No tiene autorización para cambiar valores de registros en JOBS'
GO

UPDATE JOBS
SET max_lvl = 250
where job_id = 11
GO

-- Sobre la base de datos PEDIDOS
USE PEDIDOS
GO
/*
4.	Escriba un TRIGGER para UPDATE de la tabla EMPLEADOS. Cuando se actualiza el campo REPORTA_A escribir un 
	mensaje que indique, " El empleado (nombre y apellido del empleado)  ha cambiado de jefe directo. Jefe 
	anterior fue: Nombre y apellido del jefe anterior, Jefe nuevo es: Nombre y apellido del nuevo Jefe"*/

SELECT * FROM EMPLEADOS;
GO

CREATE TRIGGER TR_04
	ON EMPLEADOS
	FOR UPDATE
AS
	DECLARE @ID_EMP		INT
	DECLARE @EMP_NOM	VARCHAR(30)
	DECLARE @JEFE_O_NOM VARCHAR(30)
	DECLARE @JEFE_N_NOM VARCHAR(30)
	DECLARE @ID_JEFE_O	INT
	DECLARE @ID_JEFE_N	INT

	IF UPDATE(REPORTA_A)
		BEGIN
			SELECT @ID_JEFE_N = REPORTA_A FROM inserted
			SELECT @ID_JEFE_O = REPORTA_A FROM deleted
			SELECT @JEFE_N_NOM = RTRIM(NOMBRE) + ' ' + RTRIM(LTRIM(APELLIDO)) FROM EMPLEADOS 
			WHERE EMPLEADOID = @ID_JEFE_N
			SELECT @JEFE_O_NOM = RTRIM(NOMBRE) + ' ' + LTRIM(APELLIDO) FROM EMPLEADOS 
			WHERE EMPLEADOID = @ID_JEFE_O
			SELECT @EMP_NOM = RTRIM(NOMBRE) + ' ' + LTRIM(APELLIDO) FROM inserted
			PRINT (N'EL EMPLEADO ' + @EMP_NOM + ' HA CAMBIADO DE JEFE DIRECTO')
			PRINT (N'JEFE ANTERIOR FUE: ' + @JEFE_O_NOM)
			PRINT (N'JEFE NUEVO ES: ' + @JEFE_N_NOM) 
		END

UPDATE EMPLEADOS
SET REPORTA_A = 2
WHERE EMPLEADOID = 7
			
/*
5.	Escriba un TRIGGER para INSERT en la tabla PRODUCTOS. Cuando ingrese un registro de un nuevo producto, muestre 
	el número de productos que tiene el proveedor de ese producto ingresado.*/

SELECT * FROM PRODUCTOS
GO

CREATE TRIGGER TR_05
	ON PRODUCTOS
	FOR INSERT
AS
	DECLARE @ID_PROV	INT
	DECLARE @CANT_PROD	INT
	SELECT @ID_PROV = PROVEEDORID FROM inserted
	SELECT @CANT_PROD = COUNT(*) FROM PRODUCTOS 
	WHERE PROVEEDORID = @ID_PROV
	PRINT ('EL PROOVEDOR DEL PRODUCTO INGRESADO TIENE ' + CAST(@CANT_PROD AS VARCHAR(10)) + ' PRODUCTOS')
	SELECT * FROM PRODUCTOS WHERE PROVEEDORID = @ID_PROV

INSERT INTO PRODUCTOS VALUES
(14, 200, 30, 'YOGURTH DE FRESA', 5, 100)


/*
6.	Crear un TRIGGER para INSERT en la tabla ORDENES. Verificar si el cliente a quien pertenece la orden es algún 
	'SUPERMERCADO', de ser así escriba un mensaje indicando 'HA INGRESADO UN NUEVO SUPERMERCADO COMO CLIENTE, AHORA 
	SON (número de supermercados)”.*/

SELECT * FROM ORDENES
SELECT * FROM CLIENTES
GO

CREATE TRIGGER TR_06
	ON ORDENES
	FOR INSERT
AS 
	DECLARE @ID_CLI		INT
	DECLARE @NOM_CLI	VARCHAR(30)
	DECLARE @CANT_SUPER INT

	SELECT @ID_CLI = CLIENTEID FROM inserted
	SELECT @NOM_CLI = NOMBRECIA FROM CLIENTES
	WHERE CLIENTEID = @ID_CLI
	
	IF @NOM_CLI LIKE ('SUPERMERCADO%')
		BEGIN
			SELECT @CANT_SUPER = COUNT(*) FROM CLIENTES
			WHERE NOMBRECIA LIKE ('SUPERMERCADO%')
			PRINT (N'HA INGRESADO UN NUEVO SUPERMERCADO COMO CLIENTE, AHORA SON ' + CAST(@CANT_SUPER AS VARCHAR(10)))
		END

INSERT INTO ORDENES VALUES
(11, 1, 4, GETDATE(), NULL)


-- Sobre la BD BANCO

USE BANCO
GO

/*7.	Escriba un TRIGGER para UPDATE de la tabla PRESTAMOS. Si se cambia cualquiera de los campos: saldo o dividendos, crear los registros de auditoría respectivos.
		Crear antes la tabla de AUDITORIA.*/

SELECT * FROM Prestamos
exec sp_help prestamos

CREATE TABLE Auditoria_Prestamos(
	audit_log_id                uniqueidentifier DEFAULT NEWID(),
    audit_log_type              char (3) NOT NULL,
	audit_numPrestamo			int NOT NULL,
	audit_monto					money,
	audit_fecha_aproba			smalldatetime,
	audit_dividendos			tinyint, 
	audit_saldo					money,
	audit_codSucursal			int,
	audit_codCliente			int,
	audit_user                  sysname DEFAULT SUSER_SNAME(),
    audit_changed               datetime DEFAULT GETDATE()
	)
GO

CREATE TRIGGER TR_07 
	ON Prestamos
	FOR UPDATE AS

	IF (COLUMNS_UPDATED() & 24) > 0
		BEGIN 
		INSERT INTO Auditoria_Prestamos(
			audit_log_type,
			audit_numPrestamo,			
			audit_monto,					
			audit_fecha_aproba,			
			audit_dividendos,			
			audit_saldo,				
			audit_codSucursal,			
			audit_codCliente)
			SELECT 'OLD',
					del.numPrestamo,
					del.monto,
					del.fecha_aproba,
					del.dividendos,			
					del.saldo,				
					del.codSucursal,			
					del.codCliente
				FROM deleted del

		INSERT INTO Auditoria_Prestamos(
			audit_log_type,
			audit_numPrestamo,			
			audit_monto,					
			audit_fecha_aproba,			
			audit_dividendos,			
			audit_saldo,				
			audit_codSucursal,			
			audit_codCliente)
			SELECT 'NEW',
					ins.numPrestamo,
					ins.monto,
					ins.fecha_aproba,
					ins.dividendos,			
					ins.saldo,				
					ins.codSucursal,			
					ins.codCliente
				FROM inserted ins
		END
GO

UPDATE Prestamos	
	SET saldo = 1000
	WHERE codCliente = 1;
GO

SELECT * FROM Prestamos;
SELECT * FROM Auditoria_Prestamos;
GO



/*8.	Escriba un TRIGGER instead of INSERT en la tabla PRESTAMOS. Sume el 5% al valor del monto del PRESTAMO que va a ser ingresado 
		(tenga en cuenta que el registro a ser ingresado está en la tabla INSERTED). */

SELECT * FROM Prestamos;
GO

CREATE TRIGGER TR_08
ON Prestamos
INSTEAD OF INSERT AS
BEGIN 
	INSERT INTO Prestamos
		SELECT monto, fecha_aproba, dividendos, saldo, codSucursal, codCliente FROM inserted

	UPDATE Prestamos
	SET monto += monto * 0.05
	WHERE numPrestamo = (SELECT TOP 1 numPrestamo FROM Prestamos ORDER BY numPrestamo DESC)
	
END
GO

DROP TRIGGER TR_08
GO

INSERT INTO Prestamos VALUES (600,GETDATE(),100,3000,2,1)
SELECT * FROM Prestamos
GO
