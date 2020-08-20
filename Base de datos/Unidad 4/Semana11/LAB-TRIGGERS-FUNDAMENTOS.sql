-- BASE DE DATOS 
-- DRA. ROSA NAVARRETE

-- TRIGGERS. CONCEPTOS INICIALES

USE pubs
go

-- Vemos si existen triggers creados en la base de datos
select * from sysobjects where type = 'TR';


IF EXISTS (SELECT name FROM sysobjects
        WHERE name = 'anuncio' AND type = 'TR')
    DROP TRIGGER anuncio
GO

CREATE  TRIGGER anuncio
ON titles
FOR INSERT, UPDATE 
AS 
PRINT ('MENSAJE : Intento de inserción o actualización en titles')
GO

Update titles
Set ytd_sales = ytd_sales * 1.10
Where title_id ='BU1032'
GO

DROP TRIGGER anuncio

----
/* 
Utilizar un trigger de regla de negocio entre las tablas employee y jobs.
Implementar reglas del negocio mediante un trigger que, cuando se inserta o 
se cambia un job_lvl (salario por hora) de un empleado, el trigger comprueba 
que el valor esté entre el mínimo (min_lvl) y máximo (max_lvl) para el respectivo 
job_id. */

select emp_id,e.job_id, e.job_lvl, j.min_lvl, j.max_lvl
from employee e, jobs j
where e.job_id = j.job_id

IF EXISTS (SELECT name FROM sysobjects  WHERE name = 'employee_insupd' AND type = 'TR')
 DROP TRIGGER employee_insupd;
go

CREATE TRIGGER employee_insupd
ON employee
FOR INSERT, UPDATE
AS

SET NOCOUNT ON
-- Declara variables con el mismo nombre de los campos para que sean fácilmente identificables.
DECLARE @min_lvl tinyint,
   	@max_lvl tinyint,
    	@emp_lvl tinyint,
    	@job_id smallint

-- Guarda en las variables, los valores de los campos desde las tablas respectivas
-- Tome en cuenta que el registro a insertar (por insert o update) está en la tabla 
-- inserted (de la cual toma el valor del job_id y del job_lvl que se quiere ingresar).  
SELECT @min_lvl = min_lvl, 
    @max_lvl = max_lvl, 
    @emp_lvl = i.job_lvl,
    @job_id = i.job_id
FROM inserted i , jobs j
WHERE j.job_id = i.job_id

IF (@job_id = 1) and (@emp_lvl <> 10) 
BEGIN
    -- Para el job_id = 1, siempre el emp_lvl es 10
    PRINT ('El Job id 1 espera el nivel 10')
    PRINT ('REGISTROS EN INSERTED')
    select * from inserted
    PRINT ('REGISTROS EN DELETED')
    select * from deleted
    ROLLBACK TRANSACTION
END
ELSE
IF NOT (@emp_lvl BETWEEN @min_lvl AND @max_lvl)
BEGIN
    RAISERROR('El nivel para el  job_id : %d debería estar entre %d  y %d.', 16,1, 
    @job_id, @min_lvl, @max_lvl)
    PRINT ('REGISTROS EN INSERTED')
    select * from inserted
    PRINT ('REGISTROS EN DELETED')
    select * from deleted
    
    ROLLBACK TRANSACTION
END


/*Probar el trigger*/


select * from employee
where emp_id = 'A-C71970F';

select * from jobs 
where job_id = (select job_id 
                from employee 
				where emp_id = 'A-C71970F');

update employee 
set job_lvl = 200
where emp_id = 'A-C71970F'
  
insert into employee (emp_id,fname,lname,job_id,job_lvl,pub_id,hire_date)
values ('L-B31946F','Paz','Maria',1,5,1389,1992-02-14)

go
-----------------------------------------------------------------------------------------------
CREATE TRIGGER employee_insupd
ON employee
FOR INSERT, UPDATE
AS

SET NOCOUNT ON
-- Declara variables con el mismo nombre de los campos para que sean fácilmente identificables.
BEGIN TRY 
DECLARE @caso tinyint=0, @min_lvl tinyint,
   	@max_lvl tinyint,
    	@emp_lvl tinyint,
    	@job_id smallint

-- Guarda en las variables, los valores de los campos desde las tablas respectivas
-- Tome en cuenta que el registro a insertar (por insert o update) está en la tabla 
-- inserted (de la cual toma el valor del job_id y del job_lvl que se quiere ingresar).  
SELECT @min_lvl = min_lvl, 
    @max_lvl = max_lvl, 
    @emp_lvl = i.job_lvl,
    @job_id = i.job_id
FROM inserted i , jobs j
WHERE j.job_id = i.job_id

IF (@job_id = 1) and (@emp_lvl <> 10) 
BEGIN
    set @caso=1;
    RAISERROR('El valor de job_lvl para el  job_id : %d debería ser 10', 16,1,@job_id);
END
ELSE
IF NOT (@emp_lvl BETWEEN @min_lvl AND @max_lvl)
BEGIN
    RAISERROR('El nivel para el  job_id : %d debería estar entre %d  y %d.', 16,1, 
    @job_id, @min_lvl, @max_lvl);
END
END TRY
BEGIN CATCH
   if @caso = 1
     -- Para el job_id = 1, siempre el emp_lvl es 10
    PRINT ('El Job id 1 espera el job_lvl 10');
   else 
    PRINT ('El valor del job_lvl no está entre los límites'); 
    PRINT ('REGISTROS EN INSERTED');
    select * from inserted;
    PRINT ('REGISTROS EN DELETED');
    select * from deleted;
	ROLLBACK TRANSACTION;
END CATCH
     

update employee 
set job_lvl = 200
where emp_id = 'A-C71970F'
  
insert into employee (emp_id,fname,lname,job_id,job_lvl,pub_id,hire_date)
values ('L-B31946F','Paz','Maria',1,5,1389,1992-02-14)
GO

--- USO DE COLUMNS_UPDATED()

USE pubs
go

IF EXISTS (SELECT NAME, TYPE FROM SYSOBJECTS 
WHERE NAME = 'employeeData' AND TYPE= 'U'  )   
DROP TABLE employeeData

IF EXISTS(SELECT NAME, TYPE FROM SYSOBJECTS        
WHERE NAME = 'auditEmployeeData' AND TYPE= 'U')
    		DROP TABLE auditEmployeeData
GO

CREATE TABLE employeeData (
        emp_id                int NOT NULL,
        emp_bankAccountNumber char (10) NOT NULL,
        emp_salary            int NOT NULL,
        emp_SSN               char (11) NOT NULL,
        emp_lname             nchar (32) NOT NULL,
        emp_fname             nchar (32) NOT NULL,
        emp_manager           int NOT NULL
        )
GO

CREATE TABLE auditEmployeeData (
        audit_log_id                uniqueidentifier DEFAULT NEWID(),
        audit_log_type              char (3) NOT NULL,
        audit_emp_id                int NOT NULL,
        audit_emp_bankAccountNumber char (10) NULL,
        audit_emp_salary            int NULL,
        audit_emp_SSN               char (11) NULL,
        audit_user                  sysname DEFAULT SUSER_SNAME(),
        audit_changed               datetime DEFAULT GETDATE()
        )
GO
  
CREATE TRIGGER updEmployeeData 
ON employeeData 
FOR update AS
  
-- Verifica si cualquiera de las columnas 2, 3 or 4 ha sido actualizada (número de cuenta bancaria, el sueldo anual o el número de seguridad social del empleado).  Si alguna o todas éstas 
-- columas 2, 3 or 4 han sido cambiadas, crea un registro de auditoría
-- La máscara de bits (bitmask) se calcula en binario  = 14  (2^^1 + 2 ^^2 + 2^^3)
-- Para chequear si todas las columnas 2, 3, y 4 han sido actualizadas, usar = 14, en lugar de   >0 
  
    IF (COLUMNS_UPDATED() & 14) > 0
-- Para ver si todas las columnas 2, 3, 4 son  updated.

    BEGIN
    -- Audit OLD record.
    INSERT INTO auditEmployeeData
        (audit_log_type,
        audit_emp_id,
        audit_emp_bankAccountNumber,
        audit_emp_salary,
        audit_emp_SSN)
        SELECT    'OLD', 
                del.emp_id,
                del.emp_bankAccountNumber,
                del.emp_salary,
                del.emp_SSN
            FROM deleted del
  
    -- Audit NEW record.
    INSERT INTO auditEmployeeData
        (audit_log_type,
        audit_emp_id,
        audit_emp_bankAccountNumber,
        audit_emp_salary,
        audit_emp_SSN)
        SELECT    'NEW',
                ins.emp_id,
                ins.emp_bankAccountNumber,
                ins.emp_salary,
                ins.emp_SSN
            FROM inserted ins
    END
  
GO
  
-- Insertar un nuevo empleado no causa que se dispare el trigger de UPDATE 

INSERT INTO employeeData
VALUES ( 101, 'USA-987-01', 23000, 'R-M53550M', N'Mendel', N'Roland', 32)
GO

-- Al actualizar el registro del empleado número  101 para cambiar el salario a  51000  
-- causa que se dispare el trigger de UPDATE y se grabe un registro en auditEmployeeData

  
UPDATE employeeData
    SET emp_salary = 51000
    WHERE emp_id = 101
GO
SELECT * FROM auditEmployeeData  
GO

-- Actualizar el registro para el empleado 101 para cambiar el número de la cuenta del banco 
-- y el número de seguridad social (SSN), causa que se dispare el trigger y se grabe un registro de auditoría

UPDATE employeeData
    SET emp_bankAccountNumber = '133146A0', emp_SSN = 'R-M53550M'
    WHERE emp_id = 101
GO

SELECT * FROM auditEmployeeData
GO
-- Procesar varios registros en las tablas temporales del trigger 
-- Ejemplo: Cuando se produce la venta de un número de ejemplares de un libro, 
-- esto se inserta en la tabla SALES, pero, por cada venta, se incrementa el 
-- campo ytd_sales de la tabla TITLES que lleva el acumulado de venta anual de 
-- los libros. 

-- Puede ocurrir que se haya ingresado un lote de registros de ventas que no se hacen
-- una a una. Por tanto, en la tabla inserted estarán n registros. 

CREATE TRIGGER intrig
ON sales
FOR INSERT 
AS
IF @@ROWCOUNT = 1
BEGIN
	UPDATE titles
	SET ytd_sales = ytd_sales + qty
	FROM inserted
	WHERE titles.title_id = inserted.title_id
END
ELSE
BEGIN
	UPDATE titles
	SET ytd_sales = ytd_sales + 
	(SELECT SUM(qty)
	FROM inserted
	WHERE titles.title_id = inserted.title_id) 
	WHERE titles.title_id IN 
	(SELECT title_id FROM inserted)
END


-- crear una tabla con registros 


CREATE TABLE ventas_aux
(stor_id char(4),
ord_num varchar(20),
date datetime,
qty smallint,
payterms varchar(12),
title_id tid)


set dateformat ymd

insert into ventas_aux (stor_id,ord_num,date, qty, payterms, title_id) 
values ('7066', 'F001', '1993/05/24', 50, 'Net 30', 'PC8888') 

insert into ventas_aux (stor_id,ord_num,date, qty, payterms, title_id) 
values ('7066', 'F002', '1994/09/13', 75, 'ON Invoice', 'PS2091') 

insert into ventas_aux (stor_id,ord_num,date, qty, payterms, title_id) 
values ('7066', 'F003', '1993/05/12', 20, 'Net 60', 'TC7777') 

insert into ventas_aux (stor_id,ord_num,date, qty, payterms, title_id)
values ('7066', 'F004', '1993/06/12', 30, 'Net 60', 'TC7777')

select * from ventas_aux 

-- Realizar una inserción de múltiples registros en tabla sales

insert into sales
select * from ventas_aux

-- El trigger maneja la inserción de múltiples registros

select * from titles


-- Trigger de inserción condicional 

-- Se tratan los registros en inserted por si existiera alguno con error.

/* 
En el siguiente ejemplo, se supone que la base de datos pubs contiene una tabla llamada newsale. 
Ésta es la instrucción CREATE para newsale:*/

CREATE TABLE newsale
(stor_id char(4),
ord_num varchar(20),
date datetime,
qty smallint,
payterms varchar(12),
title_id tid)

-- borro el trigger creado anteriormente

drop trigger intrig 
GO
-- crear el nuevo trigger

CREATE TRIGGER conditionalinsert
ON sales
FOR INSERT AS
              DECLARE @RC int
              SET NOCOUNT ON
              PRINT ('EN TABLA INSERTED')
              SELECT * FROM INSERTED
              SET @RC=@@ROWCOUNT
              SELECT @RC AS 'VALOR @@ROWCOUNT'
IF
(SELECT COUNT(*) FROM titles, inserted
 WHERE titles.title_id = inserted.title_id) <> @RC
 BEGIN
   DELETE sales FROM sales, inserted
   WHERE sales.title_id = inserted.title_id AND
   inserted.title_id NOT IN
   (SELECT title_id
   FROM titles)
   select @@rowcount as 'registros borrados'
   PRINT 'Solo se insertan en sales, los registros que tengan title_id válido '
 END

/* Cuando se insertan títulos no válidos, la transacción no se deshace; en lugar de eso, 
el trigger se encarga de eliminar las filas no deseadas. Esta capacidad de eliminar filas 
que ya han sido insertadas se basa en el orden en el que se realiza el procesamiento cuando 
se activan los triggers. En primer lugar, las filas se insertan en la tabla del trigger y en 
la tabla inserted y, a continuación, se activa el trigger.
Para probar el trigger, inserte cuatro filas en la tabla newsale. Dos de las filas de newsale 
tienen valores en la columna title_ids que no coinciden con los que ya hay en la tabla titles.*/

insert into newsale values('7066','QA7442.3',1999-07-25,75,'Red 30','PS1372')
insert into newsale values('7066','QA7442.3',1999-06-24,75,'Red 60','BU7832')
insert into newsale values('7067','D4482',1999-06-27,10,'Red 30','PSxxxx')
insert into newsale values('7131','N914008',1999-07-27,20,'Red 30','PSyyyy')

select * from newsale

-- Anulamos la verificación de foreign key de SALES:

ALTER TABLE SALES NOCHECK CONSTRAINT ALL

-- A continuación, inserte los datos de newsale en sales. La instrucción sería así:

INSERT sales
SELECT * FROM newsale;

SELECT * FROM SALES; 

/* Los valores PSxxxx y PSyyyy de title_id no coinciden con ninguno de los de la tabla titles, 
y el trigger conditionalinsert elimina esas dos filas de las tablas sales e inserted.*/


-- Triggers definidios en una tabla 
EXEC sp_helptrigger nombre-tabla

-- EJEMPLO DE TRIGGER DDL 

IF EXISTS (SELECT * FROM sys.server_triggers
    WHERE name = 'ddl_trig_login')
DROP TRIGGER ddl_trig_login
ON ALL SERVER
GO
CREATE TRIGGER ddl_trig_login 
ON ALL SERVER 
FOR DDL_LOGIN_EVENTS 
AS 
    PRINT 'Login Event Issued.'
    SELECT EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)')
GO
DROP TRIGGER ddl_trig_login
ON ALL SERVER
GO

-- EJEMPLO DE TRIGGER INSTEAD OF
use pedidos
go
create trigger reemplazo
on empleados
instead of insert as
print 'no hay contrataciones'
go

select * from empleados

insert into empleados values (8,'JAIME','CASTRO', '18/08/78', 5,450)







