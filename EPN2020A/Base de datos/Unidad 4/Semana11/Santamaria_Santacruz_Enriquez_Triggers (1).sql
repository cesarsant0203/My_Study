USE PUBS
GO
/*Sobre la BD PUBS*/

/*1.	Escriba un TRIGGER para UPDATE sobre la tabla SALES. 
El trigger debe verificar si la venta corresponde a un libro cuyo
t�tulo corresponde a libros con un valor en el campo advance,
superior a 7000; de ser as�, el libro debe venderse �nicamente
con Payterms �ON Invoice�. Si eso no se cumple, hacer un ROLLBACK. */

SELECT * FROM SALES
GO

SELECT ADVANCE, title_ID FROM TITLES WHERE advance>=7000
GO

CREATE TRIGGER TR_1
ON SALES
FOR UPDATE
AS

SET NOCOUNT ON
-- Declara variables con el mismo nombre de los campos para que sean f�cilmente identificables.
DECLARE @advance money,
   	@title_id varchar(6),
    	@ord_num varchar(20),
    	@payterms varchar(12)

-- Guarda en las variables, los valores de los campos desde las tablas respectivas  
SELECT @advance = t.advance,
   	@title_id = i.title_id,
    	@ord_num = i.ord_num,
    	@payterms = s.payterms
FROM inserted i , sales s join titles t on s.title_id = t.title_id
WHERE i.title_id = s.title_id

IF (@advance <7000)
BEGIN
    -- Para los libros que tienen advance menor a 7000
    PRINT ('t�tulo no corresponde a libros con un valor en el campo advance superior a 7000')
    PRINT ('REGISTROS EN INSERTED')
    select * from inserted
    PRINT ('REGISTROS EN DELETED')
    select * from deleted
    ROLLBACK TRANSACTION
END
ELSE
IF (@payterms != 'ON Invoice')
BEGIN
	PRINT ('el libro debe venderse �nicamente con Payterms �ON Invoice�')
    PRINT ('REGISTROS EN INSERTED')
    select * from inserted
    PRINT ('REGISTROS EN DELETED')
    select * from deleted
    
    ROLLBACK TRANSACTION
END

/*
drop trigger TR_1
*/

/*Prueba trigger TR_1*/

select * from sales join titles on sales.title_id = titles.title_id
where advance <7000;

select title, s.payterms, advance, ord_num from titles t join sales s on t.title_id=s.title_id
where payterms = 'ON Invoice' and advance >=7000
-- no cumple
update sales 
set qty = 4
where ord_num = 'QA7442.3'
-- cumple
update sales 
set qty = 13
where ord_num = 'X999'
go
/*2.	Escriba un TRIGGER para INSERT en la tabla STORES. 
El trigger detecta si el campo STATE corresponde al valor de
STATE con mayor n�mero de tiendas, de ser as� emite un mensaje 
que diga: �ATENCI�N: Ya existe un n�mero alto de tiendas en el
state (valor del state)�.*/

CREATE TRIGGER TR_2
ON Stores
FOR INSERT
AS

SET NOCOUNT ON
-- Declara variables con el mismo nombre de los campos para que sean f�cilmente identificables.
DECLARE @state char(2),
   	@top_state char(2)

-- Guarda en las variables, los valores de los campos desde las tablas respectivas  
SELECT  @state = i.state,
   	@top_state = count(s.state)
FROM inserted i , stores s
WHERE  s.stor_id = i.stor_id
group by i.state
order by count(s.state)

IF (@top_state = max(@top_state))
BEGIN
    -- Para el estado que tenga la mayor cantidad de tiendas
    RAISERROR ('ATENCI�N: Ya existe un n�mero alto de tiendas en el state %s',16,1, @state)
    PRINT ('REGISTROS EN INSERTED')
    select * from inserted
    PRINT ('REGISTROS EN DELETED')
    select * from deleted
    ROLLBACK TRANSACTION
END
go

/*
drop trigger TR_2
*/

/*Prueba trigger TR_2*/
select state, count(state) from stores
group by state
order by count(state)
go
select * from stores
go
-- no cumple
insert into Stores (stor_id,stor_name,stor_address,city,state,zip)
values ('2452','Santacruz','Pasaje N69A','Seatlle','CA','42222')
go
-- cumple
insert into Stores (stor_id,stor_name,stor_address,city,state,zip)
values ('2342','SantinaStore','canyon road','Portland','OR','42222')
go

/*3.	Escriba un TRIGGER INSTEAD OF UPDATE en la table JOBS. 
Si se intenta actualizar un registro indique �No tiene autorizaci�n
para cambiar valores de registros en JOBS� y no permita la actualizaci�n.*/ 

create trigger TR_3
on Jobs
instead of update as
print 'No tiene autorizaci�n
para cambiar valores de registros en JOBS'
go
/*
drop trigger TR_3
*/

/*Prueba trigger TR_3*/

select * from Jobs

update Jobs
set job_desc = 'Publisher excecutive'
where job_id = 5
go

-- Sobre la BD PEDIDOS
use pedidos 
go

/*4.	Escriba un TRIGGER para UPDATE de la tabla EMPLEADOS. Cuando se actualiza el campo REPORTA_A escribir un mensaje que indique, 
" El empleado (nombre y apellido del empleado) ha cambiado de jefe directo. Jefe anterior fue: Nombre y apellido del jefe anterior,
jefe nuevo es: Nombre y apellido del nuevo jefe"*/
SELECT *FROM EMPLEADOS

create trigger TR-EMPLEADOS
on EMPLEADOS
FOR update
as 
	if update(reporte_a)

	declare @nombre char(30), @apellido char(30),@empleadoID INT, @REPORTa_A INT 
	set @nombre =(SELECT NOMBRE FROM EMPLEADOS)
	set @apellido=(select apellido from EMPLEADOS)
	set @empleadoID = (select EMPLEADOID from  empleados)
	set @reporta_a = (select REPORTA_A from empleados)

	-- registro actual
    INSERT INTO EMPLEADOS
        (@empleadoID,
		@REPORTA_A,
		@nombre,
        @apellido)
        SELECT    'OLD', 
		del.@REPORTA_A,
		del.@empleadoId
        FROM deleted del

		
    -- registro nuevo o actualizado
    INSERT INTO auditproductos
        (@empleadoID,
		@REPORTA_A,
		@nombre,
        @apellido)
        SELECT    'NEW', 
        ins.@REPORTA_A, 
		ins.@empleadoId
        FROM inserted ins
    END


	select E.@apellido as 'APELLIDO EMPLEADO', E.@nombre as 'NOMBRE EMPLEADO', 
J.@apellido AS 'APELLIDO JEFE',@J.nombre as 'NOMBRE JEFE'
from Empleados E
left outer join Empleados J
on E.reporta_a = J.empleadoid

set job_desc = 'Publisher excecutive'
where job_id = 5
END
go

/*5.	Escriba un TRIGGER para INSERT en la tabla PRODUCTOS. Cuando ingrese un registro de un nuevo producto, muestre el número de 
productos que tiene el proveedor de ese producto ingresado.*/
use pedidos
SELECT * FROM PROVEEDORES
SELECT * FROM PRODUCTOS
GO
drop trigger PRODUCTOS_trigger

CREATE TRIGGER PRODUCTOS_trigger
ON PRODUCTOS
FOR INSERT
AS
	DECLARE @PROV_ID INT, @CONTADOR INT
	SET @PROV_ID=(SELECT PROVEEDORID FROM inserted)
	SET @CONTADOR=(SELECT COUNT(PROVEEDORID) FROM PRODUCTOS WHERE PROVEEDORID=@PROV_ID)
	print 'NUMERO DE PRODUCTOS:'+ cast (@CONTADOR as nvarchar(100))
GO 

INSERT INTO PRODUCTOS([PRODUCTOID],[PROVEEDORID],[CATEGORIAID],[DESCRIPCION],[PRECIOUNIT],[EXISTENCIA]) 
VALUES (21,120,100,'SALAMI DE AJO',5,500)

GO
/*6.	Crear un TRIGGER para INSERT en la tabla ORDENES. Verificar si el cliente a 
quien pertenece la orden es algún 'SUPERMERCADO', de ser así escriba un mensaje indicando 
'HA INGRESADO UN NUEVO SUPERMERCADO COMO CLIENTE, AHORA SON (número de supermercados)”. */

SELECT * FROM ORDENES
GO
select *from  CLIENTES

drop TRIGGER INSER_ORDENES

CREATE TRIGGER TR_6
ON ORDENES
FOR INSERT AS 
declare @NOMBREC char(30),@CLIENTE_ID INT, @CONTADOR INT
SELECT @CLIENTE_ID=(SELECT clienteid FROM inserted)
SELECT @NOMBREC=(SELECT nombrecia from clientes where clienteid = @cliente_id)
SELECT @CONTADOR=(SELECT COUNT(*) FROM clientes WHERE NOMBRECIA LIKE ('SUPERMERCADO%'))  

if @NOMBREC like 'SUPERMERCADO%'
BEGIN
	print 'HA INGRESADO UN NUEVO SUPERMERCADO COMO CLIENTE, AHORA SON: ' + cast(@CONTADOR as varchar(10))	
END
GO

INSERT INTO ORDENES([ORDENID],[CLIENTEID],[EMPLEADOID],[FECHAORDEN],[DESCUENTO]) 
VALUES(11,1,2,'18/06/07', NULL);


--7.	Escriba un TRIGGER para UPDATE de la tabla PRESTAMOS. Si se cambia cualquiera de los campos: saldo o dividendos, crear los registros de auditoría respectivos. Crear antes la tabla de AUDITORIA.
USE BANCO
GO

create table auditoria(
ID_Audit         uniqueidentifier DEFAULT NEWID(),
tipo_registro    char(3) not null,
num_prestamo     int not null,
saldo_cuenta     money not null,
dividendo        int not null,
audit_usu        sysname DEFAULT SUSER_SNAME(),
hora_cambio      datetime DEFAULT GETDATE(),
)
GO

create trigger TR_7
on prestamos
for update as 
	if(COLUMNS_UPDATED() &24)>0
	BEGIN
		insert into auditoria(tipo_registro, num_prestamo,saldo_cuenta,dividendo)
		select 'old', e.num_prestamo, e.saldo_cuenta, e.dividendo
		from deleted e

		insert into auditoria(tipo_registro, num_prestamo, saldo_cuenta, dividendo)
		select 'new', i.num_prestamo, i.saldo_cuenta. i.dividendo
		from inserted i
	END
go 


--test

update Prestamos
set saldo = 20000
where num_prestamo = 1

select * from Prestamos
select * from auditoria 

--8.	Escriba un TRIGGER para UPDATE de la tabla PRESTAMOS.  Si cambia el valor en el campo MONTO o el campo DIVIDENDOS, verificar si la FECHA_APROBA es anterior a la fecha actual del sistema.  Solo puede realizarse el cambio si no han pasado más de 15 días entre la FECHA_APROBA y la fecha actual.  Si la diferencia es > a 15 días, sacar un mensaje de ‘NO PUEDE ALTERARSE EL MONTO, HA PASADO EL PERIODO PERMITIDO’ y hace un ROLLBACK.  

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
        print 'NO PUEDE ALTERARSE EL MONTO, HA PASADO EL PERIODO PERMITIDO';
		rollback; 
		end
go 

--Test 
select * from Prestamos 

update Prestamos
set monto= 3000 
where numPrestamo = 1 
