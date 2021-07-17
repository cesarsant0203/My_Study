-- BASE DE DATOS
-- DRA. ROSA NAVARRETE


--LABORATORIO. TRIGGERS

-- SOBRE BD BANCOS 
-- 1.  Escriba un TRIGGER para INSERT de la tabla DETALLE_MOV_CTA
-- Cuando inserta un registro, verificar el campo TIPO_MOV;  si es ‘C’, 
-- sumar el VALOR al campo SALDO_CONTABLE del registro padre en la tabla CUENTA, 
-- si es ´D´, restar VALOR al campo SALDO_CONTABLE del registro padre en la tabla CUENTA.  

USE BANCO
GO 

SELECT * FROM Detalle_Mov_Cta
GO

SELECT * FROM CUENTAS

GO

CREATE TRIGGER INS_DETALLE_MOV_CTA
ON DETALLE_MOV_CTA
FOR INSERT
AS 
declare @NUM_CTA int
declare @TIPO_MOV char(1)
declare @valor money  

SELECT @NUM_CTA= numCta, @TIPO_MOV= tipo_Mov, @VALOR = valor from inserted 
if @TIPO_MOV = 'C'
   UPDATE Cuentas SET saldo_Contable=saldo_Contable+ @VALOR 
   WHERE numCta=@NUM_CTA;
if @TIPO_MOV = 'D'
   UPDATE Cuentas SET saldo_Contable=saldo_Contable - @VALOR 
   WHERE numCta=@NUM_CTA; 	
		
GO


EXEC SP_HELP INS_DETALLE_MOV_CTA
EXEC SP_HELPTEXT INS_DETALLE_MOV_CTA	


-- 2.	Esciba un TRIGGER para UPDATE de la tabla PRESTAMOS.  
--Si cambia el valor en el campo MONTO o el campo DIVIDENDOS, verificar si la FECHA_APROBA es anterior a la 
-- fecha actual del sistema.  Solo puede realizarse el cambio si no han pasado más de 15 días entre la FECHA_APROBA y 
-- la fecha actual. 
--  Si la diferencia es > a 15 días, sacar un mensaje de ‘NO PUEDE ALTERARSE EL MONTO, HA PASADO EL PERIODO PERMITIDO’ 
-- y hace un ROLLBACK.  
	

SELECT * FROM Prestamos 
go

create trigger UPD_PRESTAMOS
ON PRESTAMOS
FOR UPDATE 
AS 

declare @fecha_aproba datetime 

select  @fecha_aproba = fecha_aproba
from inserted 

  if UPDATE(monto) or UPDATE(dividendos) 

     if DATEDIFF(dd, @fecha_aproba, getdate()) > 15 
	    begin 
        print 'No es posible actualizar por el tiempo transcurrido';
		rollback; 
		end
go 

-- 
select * from Prestamos 

update Prestamos
set monto= 3000 
where numPrestamo = 1 



 

/* 3.Escriba un TRIGGER para DELETE en la tabla CLIENTE
Verifique si el cliente puede borrarse, para eso, no debe tener cuentas activas ni préstamos.. 
Si no puede borrar, haga un rollback. Guarde en una tabla (que debe crearse), llamada 
CLIENTES_BORRADOS, el registro que se elimine. Si tiene cuentas pasivas, borre también estas cuentas.
*/
use banco
go

select * from clientes
select * from cuentas
select * from clientexcta
select * from prestamos

create table clientes_borrados (codcliente int, cedula varchar(30), apellido varchar(30), 
nombre varchar(30), fechanac smalldatetime, direccion varchar(50), sector int, fono_ofic varchar(9),
fono_dom varchar(9), fono_cel varchar(9), codejecutivo int)


create trigger deletecliente
on clientes
for delete
as 
declare @cli int
select @cli=codcliente from deleted
if @cli  in 
(select codcliente from clientexcta
where activo = 1)
  rollback 
if @cli in 
(select codcliente from prestamos)
  rollback

insert into clientes_borrados
select * from deleted

delete clientes
where codcliente = 8


select * from clientes_borrados




/*4.	Escriba un TRIGGER para INSERT y UPDATE sobre la tabla EJECUTIVOS  
Cada vez que en ejecutivos se cambie el valor del campo COD_SUCURSAL, 
guarde en una tabla (que debe crearse), llamada AUDIT_EJECUTIVOS, 
el registro actual y el registro que se borra, incorpore información del 
nombre del usuario que realiza la transacción.  */

select * from ejecutivos

CREATE TABLE auditEjecutivos (
        audit_log_id                uniqueidentifier DEFAULT NEWID(),
        audit_log_type              char (3) NOT NULL,
        audit_codejecutivo          int NOT NULL,
        audit_cedula                char (10),
        audit_apellido              varchar(30),
		audit_nombre                varchar(30),
        audit_codsucursal           int,
        audit_user                  sysname DEFAULT SUSER_SNAME(),
        audit_changed               datetime DEFAULT GETDATE()
        )
GO
  
drop trigger upd_del_ejecutivos

CREATE TRIGGER upd_del_ejecutivos
ON ejecutivos 
FOR update, delete AS
  
    IF update (codsucursal) 

    BEGIN
    -- registro actual
    INSERT INTO auditejecutivos
        (audit_log_type,
        audit_codejecutivo, 
		audit_cedula,
        audit_apellido,
		audit_nombre,
        audit_codsucursal)
        SELECT    'OLD', 
        del.codejecutivo, 
		del.cedula,
        del.apellido,
		del.nombre,
        del.codsucursal
        FROM deleted del
  
    -- registro nuevo o actualizado
    INSERT INTO auditejecutivos
        (audit_log_type,
        audit_codejecutivo, 
		audit_cedula,
        audit_apellido,
		audit_nombre,
        audit_codsucursal)
        SELECT    'NEW', 
        ins.codejecutivo, 
		ins.cedula,
        ins.apellido,
		ins.nombre,
        ins.codsucursal
        FROM inserted ins
    END
  
GO


update ejecutivos 
set codsucursal = 2
where codejecutivo = 1


select * from auditejecutivos


-- Sobre la BD PEDIDOS 

/*5.	BD PEDIDOS. Escriba un trigger para insert en la tabla CLIENTES 
Cuando ingresa el registro verifica si hay un homónimo de NOMBRECIA;  
si lo hay indica con un mensaje ‘POSIBLE HOMÓNIMO O DUPLICADO’ y no inserta. */

*/

use pedidos
go

drop trigger insert_clientes

create trigger insert_clientes
on clientes
for insert
as
declare @nomcia varchar(30)
select @nomcia= nombrecia from inserted
select nombrecia from clientes where nombrecia= @nomcia
if @@rowcount > 1
  begin
     print 'POSIBLE HOMONIMO O DUPLICADO'
     rollback tran
  end
go 

select * from clientes
delete  CLIENTES where clienteid=12


insert into clientes (clienteid, cedula_ruc,nombrecia, nombrecontacto,
direccioncli) values
(12, '1890987666','otro nombre', 'JUAN PEREZ', 'LA FLORESTA')



/* 6. Escriba un TRIGGER para insert en la tabla PRODUCTOS 
Cuando ingrese un registro compruebe que el proveedor tenga al menos otro producto registrado, 
en caso contrario, emita un mensaje indicando ‘PROVEEDOR NUEVO, PRIMER PRODUCTO’
*/

USE PEDIDOS
GO

SELECT * FROM PROVEEDORES
SELECT * FROM PRODUCTOS
GO

CREATE TRIGGER INS_PRODUCTOS
ON PRODUCTOS
FOR INSERT
AS
	DECLARE @PROV_ID INT, @CONTADOR INT
	SET @PROV_ID=(SELECT PROVEEDORID FROM inserted)
	SET @CONTADOR=(SELECT COUNT(PROVEEDORID) FROM PRODUCTOS WHERE PROVEEDORID=@PROV_ID)
	IF(@CONTADOR=1)
		BEGIN
			PRINT 'PROVEEDOR NUEVO, PRIMER PRODUCTO'
		END

GO 

INSERT INTO PRODUCTOS([PRODUCTOID],[PROVEEDORID],[CATEGORIAID],[DESCRIPCION],[PRECIOUNIT],[EXISTENCIA]) 
VALUES (16,120,100,'PESCADO',5,500)

GO

/* 7.	Escriba un TRIGGER para insert o update en la tabla ORDENES
Cuando ingrese un registro o se actualice el campo DESCUENTO, compruebe si el valor que se va a ingresar 
como descuento sea <= que el promedio de descuento ingresado para las órdenes, en caso contrario indique 
‘DESCUENTO ESPECIAL, SUPERIOR AL PROMEDIO’ 
*/

USE PEDIDOS
GO

SELECT * FROM ORDENES
GO

CREATE TRIGGER INS_UPD_ORDENES 
ON ORDENES
FOR INSERT, UPDATE
AS
	IF UPDATE(DESCUENTO)
		BEGIN
			DECLARE @VALOR_INGRESAR NUMERIC, @PROMEDIO NUMERIC 
			SET @VALOR_INGRESAR=(SELECT DESCUENTO FROM inserted)
			SET @PROMEDIO=(SELECT AVG(DESCUENTO) FROM ORDENES)
			IF(@VALOR_INGRESAR > @PROMEDIO)
				BEGIN
					PRINT 'DESCUENTO ESPECIAL, SUPERIOR AL PROMEDIO'
				END
		END

SELECT AVG(DESCUENTO) FROM ORDENES 

INSERT INTO ORDENES VALUES (11,2,4,GETDATE(),8)
/*EL VALOR 8 CORRESPONDE AL DESCUENTO QUE ES MAYOR QUE EL PROMEDIO 6, 
VERIFICAR QUE ESTE SEA MAYOR AL PROMEDIO PARA COMPRABAR EL FUNCIONAMIENTO DEL TRIGGER*/


/* 8. Crear un trigger para insert en la tabla DETALLE_ORDENES.  Por cada registro que se ingrese
-- restar el valor del campo CANTIDAD del PRODUCTOID, en el registro correspondiente a ese 
-- PRODUCTO en la tabla PRODUCTOS, campo EXISTENCIA. 
-- Se trata de mantener actualizado el número de unidades en EXISTENCIA de cada producto. */

use pedidos
go 

select * from PRODUCTOS 
select * from DETALLE_ORDENES

create trigger ins_detalleordenes
on DETALLE_ORDENES
for insert
as
	declare @canti int, @prodid int
	select @prodid = productoid,@canti= cantidad from inserted 
	update PRODUCTOS
	set EXISTENCIA=EXISTENCIA - @canti
	where PRODUCTOID=@prodid
go

insert into DETALLE_ORDENES values (10,2,11,10)

/* 9. Crear un trigger de actualización en la tabla PRODUCTOS.  
-- Cuando se actualiza el valor del 
-- campo PRECIO del producto, crear un registro de auditoría. 
-- Debe crear previamente una tabla que mantenga información del 
-- Código del producto y su precio 
-- y registrar el registro actual y el registro modificado. */

select * from productos

CREATE TABLE auditproductos (
        audit_log_id                uniqueidentifier DEFAULT NEWID(),
        audit_log_type              char (3) NOT NULL,
        audit_productoid           int NOT NULL,
        audit_preciounit            money,
        audit_user                  sysname DEFAULT SUSER_SNAME(),
        audit_changed               datetime DEFAULT GETDATE()
        )
GO

drop trigger updproductos

CREATE TRIGGER updPRODUCTOS
ON PRODUCTOS  
FOR update AS
  
    IF update (preciounit) 

    BEGIN
    -- registro actual
    INSERT INTO auditproductos
        (audit_log_type,
        audit_productoid, 
		audit_preciounit)
        SELECT    'OLD', 
        del.productoid, 
		del.preciounit
        FROM deleted del
  
    -- registro nuevo o actualizado
    INSERT INTO auditproductos
        (audit_log_type,
        audit_productoid, 
		audit_preciounit)
        SELECT    'NEW', 
        ins.productoid, 
		ins.preciounit
        FROM inserted ins
    END
  
GO

select * from productos
update productos 
set preciounit = 5
where productoid = 1


select * from auditproductos






 
-- TRIGGER INSTEAD OF 

/* 10. Probar un trigger INSTEAD OF que no permita la inserción de registros en la 
tabla empleados. En su lugar muestra un mensaje indicando que no hay contrataciones */

use pedidos
go

create trigger reemplazo
on empleados
instead of insert as
print 'no hay contrataciones'
go

select * from empleados

insert into empleados values (8,'JAIME','CASTRO', '18/08/78', 5,450)

---

use prueba
go

CREATE TABLE BaseTable
  (PrimaryKey     int PRIMARY KEY IDENTITY(1,1),
   Color          nvarchar(10) NOT NULL,
   Material       nvarchar(10) NOT NULL,
   ComputedCol AS (Color + Material)
  )
GO

--Crea una vista con todas las columnas de tabla BaseTable.
CREATE VIEW InsteadView
AS SELECT PrimaryKey, Color, Material, ComputedCol
FROM BaseTable
GO

--Crea un trigger INSTEAD OF INSERT en la vista.
CREATE TRIGGER InsteadTrigger 
on InsteadView
INSTEAD OF INSERT
AS
BEGIN
  --Construye una sentencia insert que ignora los campos PrimaryKey y
  --ComputedCol, tomando desde la tabla inserted

  INSERT INTO BaseTable
       SELECT Color, Material
       FROM inserted
END
GO

-- Una sentencia INSERT correcta que salte los campos PrimaryKey y ComputedCol columns.
INSERT INTO BaseTable (Color, Material)
       VALUES (N'Red', N'Cloth')

--Ver los resultados 
SELECT PrimaryKey, Color, Material, ComputedCol
FROM BaseTable

--Una sentencia incorrecta que trata de ingresar valores para 
--PrimaryKey y ComputedCol.
INSERT INTO BaseTable
       VALUES (2, N'Green', N'Wood', N'GreenWood')


--Usando el trigger para insertar en la tabla a través de la vista
INSERT INTO InsteadView (PrimaryKey, Color, Material, ComputedCol)
       VALUES (999, N'Blue', N'Plastic', N'XXXXXX')
       
SELECT PrimaryKey, Color, Material, ComputedCol
FROM InsteadView


DISABLE TRIGGER esquema.nombre_trigger ON esquema.tabla;


ENABLE TRIGGER esquema.nombre_trigger ON esquema.tabla;

