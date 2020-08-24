/* BASES DE DATOS 
DRA. ROSA NAVARRETE
INTEGRANTES
	LIZBETH SANTAMARIA
	CESAR SANTACRUZ
PRUEBA*/

/*Sobre la BD PEDIDOS */
USE PEDIDOS
GO

/*1.	Escribir un stored procedure que permita registrar un detalle de una orden de pedido. 
		Recibe como par�metros el nombre de la compa��a cliente, un n�mero de orden, 
		el c�digo del producto y las unidades del producto. Tiene como par�metro de salida el
		n�mero de unidades en existencia del producto que quedan luego de registrar el detalle de la orden. 
	-	Debe comprobar si existe el cliente; en caso contrario hacer un return con un c�digo que usted defina.
	-	Debe comprobar si existe el n�mero de orden para ese cliente; en return con un c�digo que usted defina.
	-	Comprobar si existe el producto; en caso contrario hacer un return con un c�digo que usted defina. 
	-	Iniciar una transacci�n
	-	Insertar el registro de detalle_orden. 
	-	Verificar si el n�mero de unidades en existencia es suficiente para cubrir las unidades requeridas 
		en el detalle de la orden. Si no, hacer un rollback. 
	-	Actualizar el n�mero de unidades en existencia del producto, restando las unidades indicadas en el detalle_orden.
		Si todo se cumple realizar el commit a la transacci�n.
		Retornar el control con un c�digo que usted defina.*/

select *from clientes
select * from ORDENES
select *from PRODUCTOS
 go

 create procedure SP_1_PRUEBA
	@nombrecli char(30),
	@orden int ,
	@det int,
	@codProduc int,	
	@unidades int,
	@unidadesExis int output
as 
 if not exists (select *from clientes where @nombrecli=nombrecia)
	begin
		print 'La compa�ia cliente no existe'
		return(1)
	end
	if not exists (select *from ORDENES where ORDENID=@orden)
	begin 
		print 'La orden no existe'
		return (2)
	end
	if not exists (select *from productos where PRODUCTOID=@codProduc)
	begin
		print 'El producto no existe'
		return(3)
	end

begin tran SP_1_PRUEBA
insert into detalle_ordenes (ordenid, detalleid, productoid, cantidad) values
(@orden,@det,@codProduc,@unidades)

if @unidades > (select existencia from PRODUCTOS where PRODUCTOID=@codProduc)
	begin
	print 'No hay suficientes productos'
	rollback tran
	end
else
begin
	Update PRODUCTOS
	set EXISTENCIA = EXISTENCIA-@unidades
	where PRODUCTOID=@codProduc
	select @unidadesExis = Existencia from PRODUCTOS where PRODUCTOID=@codProduc
	commit tran SP_1_PRUEBA
end
return
GO


/*Prueba trigger SP_1_PRUEBA*/
/*	Imprima un mensaje de acuerdo al c�digo de return. 
	a)	Ingresando un n�mero de unidades mayor que la cantidad en existencia del producto. */


declare @salida_existencia int, @compania varchar (30)='EL ROSADO'

exec SP_1_PRUEBA @compania,4,1,5,100000, @salida_existencia  output
print @compania+': Existencia de los productos actualizada :'+ convert (char(4),@salida_existencia)
go
/*	b)	Ingresando par�metros que permitan una ejecuci�n exitosa. 
*/
declare @salida_existencia int, @compania varchar (30)='EL ROSADO'

exec SP_1_PRUEBA @compania,4,5,3,100, @salida_existencia  output
print @compania+': Existencia de los productos actualizada :'+ convert (char(4),@salida_existencia)
go
/*Sobre la BD PUBS*/
USE PUBS
GO
/*2.	Escribir un procedimiento almacenado que permita insertar un registro en la tabla titleauthor. 
		El SP recibe como par�metro el t�tulo de un libro, el c�digo de un autor,
		el ordinal del autor (au_ord) y el royaltyper. 
		Inicie una transacci�n. 
		Debe tener en cuenta que la suma de los valores de royaltyper entre los autores del libro debe
		ser del 100% (este campo muestra como se distribuyen las utilidades entre los autores).
		El SP debe verificar que con el registro que se inserta no se sobrepase el 100% del royaltyper. 
		Si se sobrepasa realice un rollback, caso contrario, un commit. 
*/
select * from titleauthor
SELECT * FROM titles
SELECT * FROM titles WHERE title = 'MC3026'
go
--SE CREA EL PROCESURE SP_2_PRUEBA
create procedure SP_2_PRUEBA	@title_id varchar(80) ,
								@au_id varchar(11),
								@au_ord tinyint ,
								@royaltyper int
as
begin tran

insert into titleauthor (au_id, title_id, au_ord, royaltyper) values
(@au_id,@title_id, @au_ord ,@royaltyper )

if((select sum(royaltyper) from titleauthor where title_id=@title_id) >= 100)
	begin
		print 'El royaltyper no puede ser superior al 100% entre los autores'
		rollback tran
	end
else
	BEGIN
		commit tran
	END
GO
-------------------------------------------------------------------------------------------------
/*
drop procedure SP_2_PRUEBA
*/

/*Prueba trigger SP_2_PRUEBA*/
/*	a)	Llame al SP con estos par�metros (los valores se muestran en la secuencia de los par�metros): MC3026, 724-08-9931, 1, 60. 
		Muestre el contenido de titleauthor. */

execute SP_2_PRUEBA 'MC3026', '724-08-9931', 1, 60
select * from titleauthor
GO
/*	b)	Llame al SP con estos par�metros (los valores se muestran en la secuencia de los par�metros): MC3026, 341-22-1782, 1, 50
		Muestre el contenido de titleauthor.*/

execute SP_2_PRUEBA 'MC3026', '341-22-1782', 1, 50
select * from titleauthor
GO

/*Sobre la BD PUBS*/
USE PUBS
GO
/*3.	Escribir un trigger de update en la tabla titles. En caso de que se actualice el campo price o advance,
		guardar en una tabla de auditor�a, que debe crearse previamente, los registros correspondientes a la auditor�a 
		(como est� el registro y c�mo queda luego de la actualizaci�n.  
*/

SELECT * FROM TITLES
GO

--SE CREA LA TABLA AUDIT PARA LA AUDITORIA
CREATE TABLE audit(
ID_Audit			uniqueidentifier DEFAULT NEWID(),
registry_type		char(3) not null,
title_id			varchar(6) not null,
price				money not null,
advance				money not null,
audit_user			sysname DEFAULT SUSER_SNAME(),
change_date			datetime DEFAULT GETDATE(),
)
SELECT * FROM audit
GO

-- SE CREA EL TRIGGER
CREATE TRIGGER TR_3_PRUEBA
ON TITLES
for update as 
	if(UPDATE(PRICE) OR UPDATE(ADVANCE))
	BEGIN
		insert into audit(registry_type, title_id,price,advance)
		select 'OLD', e.title_id, e.price, e.advance
		from deleted e

		insert into audit(registry_type, title_id, price, advance)
		select 'NEW', i.title_id, i.price, i.advance
		from inserted i
	END
GO

/*
drop trigger TR_3_PRUEBA
*/

/*Prueba trigger TR_3_PRUEBA*/
/*a)	Realizando un update que incremente el valor del campo advance. Muestre el contenido de la tabla de auditor�a.
*/
SELECT * FROM TITLES;
UPDATE TITLES
set ADVANCE = 7000
where TITLE_ID = 'BU1111';
SELECT * FROM AUDIT;
GO

/*Sobre la BD PUBS*/
USE PUBS
GO
/*4.	Escribir una funci�n de tabla en l�nea de m�ltiples instrucciones que recibe el nombre de la editorial como par�metro
		y obtiene un reporte que contiene el nombre de las tiendas que existen en el Estado (state)en el que se encuentra la editorial;
		se muestra tambi�n su direcci�n y la ciudad en la que se encuentra. 
*/
SELECT * FROM publishers
SELECT * FROM STORES
GO
--SE CREA LA FUNCION REPORT_PUB-------------------------------------------------------
CREATE FUNCTION REPORT_PUB (@PUB_NAME varchar(40))
	RETURNS @REP_X_PUB TABLE (	STOR_NAME varchar(40), STOR_ADDRESS varchar(40), CITY varchar(20))
AS
BEGIN
--DECLARAMOS LA VARIABLE NECESARIA
	DECLARE @PUB_STATE varchar(40)
-- DAMOS VALOR A LA VARIABLE
	SELECT @PUB_STATE = STATE
	FROM PUBLISHERS
	WHERE PUB_NAME = @PUB_NAME

	INSERT @REP_X_PUB
	SELECT S.STOR_NAME, S.STOR_ADDRESS ,S.CITY
	FROM STORES S
	WHERE S.state = @PUB_STATE

	RETURN
END
GO
------------------------------------------------------------------------------------------
/*
drop trigger FN_4_PRUEBA
*/

/*Prueba trigger FN_4_PRUEBA*/
/*Pruebe la funci�n: 
a)	Pruebe con el nombre de editorial Algodata Infosystems*/
SELECT * FROM publishers
SELECT * FROM STORES
SELECT * FROM REPORT_PUB('Algodata Infosystems')
ORDER BY STOR_NAME
GO