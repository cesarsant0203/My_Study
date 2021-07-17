-- BASES DE DATOS 
-- LABORATORIO. FUNCIONES DE USUARIO 
-- DRA. ROSA NAVARRETE 


USE PUBS
Go

/* Tres tipos de funciones:
a.	Funciones escalares
b.	Funciones de valores de tabla en línea
c.	Funciones de valores de tabla de múltiples instrucciones 
*/

SELECT DISTINCT TYPE FROM SYSOBJECTS ORDER BY TYPE

/*
C: check constraint
D: default constraint
F: foreign key constraint
FN: user function (scalar)
PK: primary key constraint
P: stored procedure
S: system table
U: user table
V: view
*/

IF OBJECT_ID ('edad',  'FN') IS NOT NULL
    DROP FUNCTION edad;
GO

-- a. Funciones escalares. Ejemplo de función que retorna un valor escalar
 
CREATE FUNCTION EDAD (@FECHANAC datetime, @HOY datetime)
RETURNS int
AS
BEGIN
   DECLARE @EDAD int
   SET @EDAD = DATEDIFF(YY,@FECHANAC, @HOY)
   RETURN(@EDAD)
END

create table datos (cod int, nombre varchar(20), fnac datetime)
set dateformat mdy
insert into datos values(10,'CARLOS PEREZ','09/03/61')
select * from datos

select cod, nombre, dbo.edad (fnac,getdate()) from datos



-- Crear en la BD PUBS una función escalar que devuelva el valor en dinero retenido por la editorial
-- cuyo nombre ingresa como parámetro, al calcular el total de dinero generado por las 
-- ventas anuales y restar el valor entregado en advance. 
-- Para probar la función, escriba un select que muestre, código y nombre 
-- de las editoriales y el valor efectivo de venta que se calcula en esa función. 

select * from titles 

drop function dbo.venta_efectiva
go

create function venta_efectiva (@nomeditorial varchar(40))
returns money 
as 
begin 
  declare @ventas money
 
  select @ventas= sum((ytd_sales*price) - advance)
  from titles 
   where pub_id = (select pub_id 
					from publishers 
					where pub_name = @nomeditorial) 
  return @ventas
 end
  
  go

  select pub_id, pub_name, dbo.venta_efectiva (pub_name) as 'Venta efectiva'
  from publishers 


  -- b. Funciones de valores de tabla en línea. 
  -- Ejemplo de función que retorna un tipo de datos table con valores de tabla en línea
  /*
  En una función definida por el usuario que devuelve un tipo de datos table: 
•	La cláusula RETURNS define el nombre de una variable local de retorno para la tabla devuelta por la función. 
La cláusula RETURNS también define el formato de la tabla. 
El nombre de una variable local de retorno tiene un alcance local dentro de la función.
•	Las instrucciones Transact-SQL del cuerpo de la función generan e insertan filas en la 
variable de retorno definida por la cláusula RETURNS.
•	Al ejecutar una instrucción RETURN, las filas insertadas en la variable se devuelven desde la función en 
formato tabular. La instrucción RETURN no puede tener un argumento. 
*/


CREATE FUNCTION VentasPorTienda (@tiendaid varchar(30))
RETURNS TABLE
AS
RETURN (SELECT title, qty
      FROM sales s, titles t
      WHERE s.stor_id = @tiendaid and
      t.title_id = s.title_id)

select * from sales order by stor_id
select * from dbo.VentasPorTienda('7066')
--------


-- c. Funciones de valores de tabla de múltiples instrucciones. Ejemplo de función que construye la tabla con múltiples instrucciones

USE PEDIDOS
GO

/* Verifica los registros insertados ordenados por el campo jefe */
select * from empleados order by reporta_a

/*  Crea una función que obtenga una tabla de reporte de los empleados que están bajo órdenes de un jefe, cuyo id recibe como parámetro */

drop function freporte

CREATE FUNCTION freporte (@JefeId int)
RETURNS @tabReporte TABLE 
   (empid int primary key,
   apellido varchar(20) NOT NULL,
   nombre varchar(20) NOT NULL,
   jefe int
   )
/* Retorna un conjunto de filas de todos los empleados que tienen como jefe al empleado con Id que entra como parámetro -  campo jefe*/
AS
BEGIN
   INSERT @tabReporte
   SELECT empleadoid, apellido,nombre, reporta_a
   FROM empleados 
	where reporta_a = @JefeId
   RETURN
END
GO

/*Prueba de la función para jefe con código 2*/

SELECT * 
FROM fReporte(2)
GO


-- EJERCICIOS

--- BD PEDIDOS 
-- Crear una función de tabla en línea que entregue el número total de unidades de un producto que se han 
-- incluido en pedidos, con respecto al código de un producto. 

use pedidos
go 

create function funidprod (@codprod int)
returns table
as
return (select SUM(cantidad)as 'total' 
		from DETALLE_ORDENES 
		where PRODUCTOID = @codprod) 


select * from productos

select * from dbo.funidprod (7) 
go


create function func_unidades (@codprod int)
returns int
as
begin
declare @cantidad int 
set @cantidad = (select SUM(cantidad)
		from DETALLE_ORDENES 
		where PRODUCTOID = @codprod);
return @cantidad 
end

select productoid, dbo.func_unidades(productoid) as 'cantidad'
from productos 
where productoid = 1


select * from productos 

select categoriaid, count(productoid)
from productos 
group by categoriaid 
having count(productoid) > 3 

-- Crear una función de tabla en línea que entregue el número de órdenes generadas para 
-- el cliente cuyo nombre ingresa como parámetro. 

select * from ordenes
select * from clientes

drop function fun_cliente_orden 
go 
create function fun_cliente_orden (@nomcli varchar(30))
returns table 
as 
return 
     select count(*) as 'ordenes'
	 from ordenes o join clientes c
	 on (o.clienteid = c.clienteid)
	 and nombrecia = @nomcli 

select * from dbo. fun_cliente_orden ('EL ROSADO')


-- Calcular con una función escalar, el valor (dinero) de descuento de una orden.  
-- El número de orden ingresa como parámetro. 

select * from ORDENES

drop function fdesc

create function fdesc (@ordenid int)
returns money
as
begin 
   declare @vdesc money, @totvta money
   select @totvta = SUM(cantidad * preciounit) 
   from PRODUCTOS p join DETALLE_ORDENES do
   on (do.PRODUCTOID = p.PRODUCTOID) 
   where do.ORDENID = @ordenid
   
   select @vdesc = @totvta * descuento / 100 
   from ORDENES 
   where ORDENID = @ordenid  

   return @vdesc
end  
   
select * from ORDENES

select ordenid, descuento, dbo.fdesc(ordenid) as 'descuento' 
from ORDENES 


select * from ORDENES 

-- Escriba una función de tabla en línea que devuelva las órdenes (ordenid, 
-- clienteid, fechaorden) 
-- que corresponden a un empleado cuyo nombre ingresa como parámetro 

select * from EMPLEADOS
SELECT * FROM ORDENES

drop function fordemp
go

create function fordemp (@ape char(30), @nom char(30))
returns table
as
return (
	select ordenid, clienteid, fechaorden 
	from ORDENES o join EMPLEADOS e
	on o.EMPLEADOID= e.EMPLEADOID
	where e.APELLIDO = @ape and e.NOMBRE = @nom
) 

select * from dbo.fordemp ('ARIAS', 'VERONICA') 


-- En la BD PUBS.- 
 
-- Escriba una función de tabla en línea que muestre el título de un libro y 
-- el número de ejemplares vendidos
-- en una tienda cuyo código entra como parámetro.

SELECT * FROM SALES 

CREATE FUNCTION VentasPorTienda (@tiendaid varchar(30))
RETURNS TABLE
AS
RETURN (SELECT title, qty
      FROM sales s, titles t
      WHERE s.stor_id = @tiendaid and
      t.title_id = s.title_id)

select * from sales order by stor_id
select * from dbo.VentasPorTienda('7066')

 select * from titles

-- Escriba una función escalar para calcular el valor en dinero de la venta anual de un libro
-- cuyo id entra como parámetro.

use pubs
go

select * from titles 

create function fvtanual (@id char(6))
returns decimal(10,2)
as 
 begin 
 declare @valor money
 select @valor = ytd_sales * price 
 from titles 
 where title_id = @id
 return @valor 
end

-- Uso de la función 
select title_id, title, dbo.fvtanual ('BU1032') 
from titles

-- Escriba una función escalar para calcular el valor que queda como saldo 
-- luego de haber cubierto
-- el valor advance, con respecto a la venta anual de los libros. 
-- El id del libro ingresa como parámetro. 
use pubs
go 
SELECT * FROM TITLES

create function fn_saldo (@titleid char(6))
returns money
as
 begin
    declare @totventa money, @advance money 
	select @totventa = ytd_sales * price, @advance = advance
	                from titles 
					where @titleid = title_id

	return (@totventa - @advance)
 end  

 select title_id, dbo.fn_saldo(title_id) as 'Saldo' 
 from titles 
 order by title_id


-- Escriba una función de tabla en línea que reciba como parámetro el 
-- nombre de una tienda y devuelva la lista de títulos de los libros
-- que se han vendido en esa tienda. 

select * from sales
select * from stores 

create function fn_titlesXstore (@storname varchar(20)) 
returns table 
as 
return (select title from 
        sales s join titles t 
		on s.title_id = t.title_id
		where stor_id = (select stor_id from stores  
		                 where stor_name = @storname))
 
		 

select * from fn_titlesXstore ('Eric the Read Books')


-- Escriba una función de tabla de múltiples instrucciones que recibe como
-- parámetro el nombre de una editorial y devuelve una tabla que contiene
-- la lista de libros publicados por la editorial con el total (en dinero)
-- que ha representado la venta anual de cada libro. 

select * from titles 
select * from publishers

sp_help publishers
go

drop function fn_titlesXpub
go

create function fn_titlesXpub (@pubname varchar(40))
RETURNS @titlespub table (
title varchar(80), 
revenue money
) 
as 
 begin  
    insert @titlespub
	select title, (ytd_sales*price) 
	from titles t join publishers p
	on t.pub_id = p.pub_id
	where p.pub_name = @pubname  
	return
end

select * from dbo.fn_titlesXpub ('New Moon Books')
  

