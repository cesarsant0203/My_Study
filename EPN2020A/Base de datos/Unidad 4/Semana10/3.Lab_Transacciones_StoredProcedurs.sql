-- BASES DE DATOS 
-- DRA. ROSA NAVARRETE

-- LABORATORIO DE TRANSACCIONES Y STORED PROCEDURES

--/* TRANSACCIONES */


USE pubs
GO

DECLARE @NombreTran VARCHAR(20) /* Declara una variable llamada TranName */
SELECT @NombreTran = 'MiTransa'  /* Asigna la cadena �MiTransa� a la variable */
BEGIN TRANSACTION @NombreTran
UPDATE roysched
SET royalty = royalty * 1.10
WHERE title_id LIKE 'PC%';
COMMIT TRANSACTION MiTransa
GO


USE prueba;
GO

CREATE TABLE tabvalores (valor int)
GO

DECLARE @transa1 varchar(20) = 'Transaccion1';

-- Se inicia una transacci�n a la que se le ha dado nombre 
-- inserta dos registros y hace rollback usando 
-- el nombre de la transacci�n

DECLARE @transa1 varchar(20) = 'Transaccion1'
BEGIN TRAN @transa1 
       INSERT INTO tabvalores VALUES(1);
       INSERT INTO tabvalores VALUES(2);
	   select * from tabvalores;
ROLLBACK TRAN @transa1
INSERT INTO tabvalores VALUES(3);
INSERT INTO tabvalores VALUES(4); 

SELECT * FROM tabvalores

----
use prueba
go 


create table ej (cola char(4), colb int)
go

begin tran;
DECLARE @cuentatran INT;
SET @cuentatran = 0;
begin try 
    insert into ej values ('aaaa',10); 
    save tran punto1; 
    set @cuentatran = 1; 
    raiserror('error provocado', 16, 1);
 
    insert into ej values ('bbbb',20)
    commit tran;
end try
begin catch
    if @cuentatran = 0
    begin
        rollback tran;
    end
    else
    begin
        rollback tran punto1;
        commit tran;
    end
end catch

select * from ej
---

use pubs 
go

select * from authors 
WHERE au_lname = 'White';

use prueba
go 

CREATE TABLE TestTran (Cola INT PRIMARY KEY, Colb CHAR(3))
GO
-- Inicia la transacci�n
BEGIN TRANSACTION TranExterna -- @@TRANCOUNT = 1.
GO
SET NOCOUNT ON
SELECT TRANCOUNT = @@TRANCOUNT
SET NOCOUNT OFF
INSERT INTO TestTran VALUES (1, 'aaa')
GO
BEGIN TRANSACTION Interna1 -- @@TRANCOUNT = 2.
GO
SET NOCOUNT ON
SELECT TRANCOUNT = @@TRANCOUNT
SET NOCOUNT OFF
INSERT INTO TestTran VALUES (2, 'bbb')
GO
BEGIN TRANSACTION Interna2 -- @@TRANCOUNT = 3.
GO
SET NOCOUNT ON
SELECT TRANCOUNT = @@TRANCOUNT
SET NOCOUNT OFF
INSERT INTO TestTran VALUES (3, 'ccc')
GO
COMMIT TRANSACTION Interna2 -- Decrementa @@TRANCOUNT a 2.
SET NOCOUNT ON
SELECT TRANCOUNT = @@TRANCOUNT
SET NOCOUNT OFF
-- No hay commit.
GO
COMMIT TRANSACTION Interna1 -- Decrementa @@TRANCOUNT a 1.
SET NOCOUNT ON
SELECT TRANCOUNT = @@TRANCOUNT
-- No hay commit.
GO
COMMIT TRANSACTION TranExterna -- Decrementa @@TRANCOUNT a 0.
-- Commits la transaction TranExterna.
SELECT TRANCOUNT = @@TRANCOUNT
GO
-- Hasta aqu� la transacci�n

SET NOCOUNT OFF
SELECT * FROM TestTran
GO
DROP TABLE TESTTRAN
GO


-- Utilizar @@ROWCOUNT (n�mero de registros afectados por 
-- la �ltima sentencia SQL)

select * from authors 
order by au_lname

BEGIN TRANSACTION
UPDATE authors SET au_lname = upper(au_lname)
WHERE au_lname = 'Ringer';
IF @@ROWCOUNT = 2
COMMIT TRAN
IF @@TRANCOUNT > 0
BEGIN
PRINT 'Una transacci�n necesita un  rolled back'
ROLLBACK TRAN
END



-- PROCEDIMIENTOS ALMACENADOS (STORED PROCEDURES)

use pubs
go

CREATE PROCEDURE ventas_por_titulo  @titulo varchar(80) 
AS
SELECT  'VENTA_ANUAL' = ytd_sales
FROM titles
WHERE title = @titulo
RETURN
GO

SELECT * FROM TITLES

Exec ventas_por_titulo 'Straight Talk About Computers'

--- VALOR POR DEFECTO PARA PAR�METROS 
USE PRUEBA 
GO

CREATE PROCEDURE pa_prueba
@uno int = NULL ,     -- valor default 
@dos int = 2 ,        -- valor default
@tres int = 3         -- valor default
AS

SELECT @uno, @dos,  @tres
GO

EXECUTE pa_prueba  -- Sin par�metros
GO

/*Muestra:
NULL	2	3
*/
EXECUTE pa_prueba 10, 20, 30 -- Todos los par�metros
GO
/*
Muestra:
NULL	2	3
*/
EXECUTE pa_prueba @dos = 500  -- Solo segundo par�metro
GO
/*
Muestra:
NULL 500 3
*/
EXECUTE pa_prueba 40, @tres = 50  
GO
/*
Muestra:
40 2 50
*/
---

-- Devolver par�metros con OUTPUT 
Use PUBS 
go

drop procedure ventas_por_titulo 
go

CREATE PROCEDURE ventas_por_titulo
@titulo varchar(80), -- Par�metro de entrada
@venta_anual int OUTPUT -- Par�metro de salida
AS 
-- Calcula las ventas para ese t�tulo, y asigna al par�metro de salida
SELECT @venta_anual = ytd_sales
FROM titles
WHERE title = @titulo
RETURN
GO

-- Declarar la variables para recibir la salida del procedure
DECLARE @venta_anual_llamada int
-- Ejecuta el procedure con un valor para  el par�metro titulo
-- y salva el valor de salida.
EXECUTE ventas_por_titulo
'Life Without Fear',  @venta_anual_llamada OUTPUT 
-- Muestra el valor regresado por el procedimiento.
PRINT 'Ventas para el t�tulo  "Sushi, Anyone?": ' 
+ convert(varchar(6),@venta_anual_llamada)
GO
select * from titles order by title
go
--- Devolver valores con c�digo de retorno desde el SP 

CREATE PROCEDURE ventas_con_retorno  
@titulo varchar(80) = NULL , @venta_anual int OUTPUT 
AS 
IF @titulo IS NULL
   BEGIN
       PRINT 'ERROR: Especifique un t�tulo'
       RETURN(1)
   END
ELSE
   BEGIN
       IF (SELECT COUNT(*) FROM titles
      WHERE title = @titulo) = 0
      RETURN(2)
   END

SELECT @venta_anual = ytd_sales
FROM titles
WHERE title = @titulo

IF @@ERROR <> 0 
BEGIN
   RETURN(3)
END
ELSE
BEGIN
    IF @venta_anual IS NULL
       RETURN(4) 
    ELSE
       RETURN(0)
END
GO

-- Prueba del  procedimiento :

SELECT * FROM TITLES; 

declare @ventas int, @retorno int
exec @retorno = ventas_con_retorno 'The title doesnt exist',  
@ventas output

print 'Retorna del sp ' + convert (char(2),@retorno)
print 'Ventas totales : ' + convert (char(10),@ventas)
---

USE PUBS
GO 

SELECT * FROM AUTHORS;
GO

CREATE PROCEDURE inserta_author 
@au_id varchar(11), @au_lname varchar(40),
@au_fname varchar(20), @phone char(12) = '999010291',
@address varchar(40) = NULL, @city varchar(20) = NULL,
@state char(2) = NULL, @zip char(5) = NULL,
@contract bit = NULL
AS

INSERT INTO authors
(au_id, au_lname, au_fname, phone, address, 
city, state, zip, contract) values
(@au_id,@au_lname,@au_fname,@phone,@address,
@city,@state,@zip,@contract)

IF  @@ERROR  <> 0 
BEGIN
   PRINT 'Ocurri� un error en el insert'
   RETURN(99)
END
ELSE
BEGIN
    PRINT 'Se carg� un nuevo autor'
    RETURN(0)
END
GO

-- Prueba de ejecuci�n del procedimiento :

Declare @retorno int
Exec @retorno = inserta_author  '123-44-6777' , 'PEREZ','JUAN',
'217890', @contract=1
Print ' Retorna del sp : ' + convert(char(2),@retorno)

SELECT * FROM AUTHORS


-- Escriba un SP que reciba el nombre de una tienda (stor_name) y devuelva
-- el valor que se ha facturado en los libros vendidos en esa tienda. 
go
/*drop procedure Facturacion
go */


CREATE PROCEDURE Facturacion (@nombretienda VARCHAR(100))
AS
CREATE TABLE #Temporal (Tienda VARCHAR(100),Cantidad money)
INSERT INTO #Temporal 
SELECT stor_name as Tienda, (qty*price) as Facturacion
FROM sales JOIN stores
on sales.stor_id=stores.stor_id 
JOIN titles
on sales.title_id=titles.title_id
GROUP BY stor_name,qty,price
SELECT Tienda, SUM(Cantidad) as [Ventas Totales]
from #Temporal 
GROUP BY Tienda
HAVING Tienda=@nombretienda
return

DROP TABLE #Temporal

EXEC Facturacion 'Barnum''s'

go


-- Escriba un SP que reciba como par�metro el nombre de un autor. El procedimiento 
-- almacenado debe devolver el n�mero de libros de su autor�a, que se han vendido. 
-- Tome en cuenta las ventas de los libros en la tabla SALES. 

create procedure numero_libros
@au_lname varchar(40),
@au_fname varchar(40),
@num_lib int OUTPUT

AS
select @num_lib = SUM (qty)
from authors AUT join titleauthor TITAUT
on AUT.au_id = TITAUT.au_id
JOIN titles TIT
ON TITAUT.title_id = TIT.title_id
JOIN sales SAL
ON TIT.title_id = SAL.title_id
WHERE au_lname LIKE @au_lname
		AND au_fname LIKE @au_fname;
return

select * from sales

-- prueba de ejecucion

declare @total_libros_salida int
 
exec numero_libros
'Green','Marjorie',@total_libros_salida OUTPUT

PRINT 'Ventas de libros del autor: ' + convert(varchar(6),@total_libros_salida) 
GO

-- Escriba un SP que reciba un ord_num (n�mero de factura) y devuelva el valor 
-- de esa factura 

sp_help titles 

drop procedure factura
go

create procedure factura
@num_orden varchar(40),
@val_factura money OUTPUT
as
select @val_factura=sum(qty*price)
from sales sa join titles tit
on sa.title_id = tit.title_id
where ord_num like @num_orden
go

-- prueba de ejecucion

declare @valor_factura money
exec factura'6871', @valor_factura output
select @valor_factura as 'Valor Factura'


-- EJERCICIOS SOBRE SP 

-- SOBRE LA BD PEDIDOS


/*1.	Cree una tabla llamada TOTAL-VENTA, que contenga el c�digo del art�culo 
y un campo para el n�mero total de unidades vendidas.
�	Escriba un SP para insertar un registro en la tabla DETALLE_ORDENES, que 
reciba como par�metros:  el n�mero de orden, el c�digo del art�culo y la cantidad.- 
El SP debe insertar un registro en DETALLE_ORDENES y actualizar la tabla TOTAL-VENTA, 
para sumar la cantidad vendida del art�culo y mantener el total vendido acumulado.
*/

use pedidos
go

create table TOTAL_VENTA (codarticulo int primary key, total int)

select * from detalle_ordenes -- verificar cu�l es el contenido
insert into total_venta values(2, 5)

SELECT * from TOTAL_VENTA -- c�digo de art. 2

drop procedure sp_total
go


create procedure sp_total @orden int ,@det int, @art int ,@cant int
as
insert into detalle_ordenes (ordenid, detalleid, productoid, cantidad) values
(@orden,@det,@art,@cant);
select codarticulo from total_venta where codarticulo=@art;
if @@ROWCOUNT > 0 
   update total_venta
   set total= total+ @cant
   where codarticulo=@art
else 
   insert into total_venta values(@art, @cant)
go

-- Prueba la ejecuci�n

execute sp_total 5,3,1,5
execute sp_total 5,4,2,8 
select * from total_venta



/*2.	Escriba un SP para obtener el valor a pagar por participaci�n en ventas 
a un empleado.-  
�	El SP recibe como par�metro el c�digo del empleado y un porcentaje de 
participaci�n y obtiene como par�metro de salida el valor que el empleado 
va a recibir, calculado como el porcentaje de participaci�n por la 
venta realizada por ese empleado (no considere los descuentos en las �rdenes
de pedido).-  Pruebe el SP */

use pedidos
go

select * from ORDENES;
go

create procedure sp_participa 
@code int, @participa tinyint, @valor_pagar money OUTPUT
as

create table #tempo_detalle 
(ordenid int, productoid int, cantidad int, precio money)

insert into #tempo_detalle
select do.ordenid, do.productoid, do.cantidad, p.preciounit
from detalle_ordenes do join productos p
on do.productoid = p.productoid
where do.ordenid in 
  (select ordenid from ordenes
   where empleadoid= @code)

select * from #tempo_detalle

create table #tempo_totales
(ordenid int, total money)

insert into #tempo_totales
select t.ordenid, sum(cantidad*precio)
from ordenes o join #tempo_detalle t
on (o.ordenid = t.ordenid) 
group by t.ordenid

select @valor_pagar =sum(total)
from #tempo_totales

set @valor_pagar = @valor_pagar * @participa * 0.01

go

-- Prueba la ejecuci�n
-- Declarar la variables para recibir la salida del procedure
DECLARE @venta_vendedor money
-- Ejecuta el procedure con un c�digo de vendedor y porcentaje 
-- de participaci�n y salva el valor de salida.
EXECUTE sp_participa 2,5,  @venta_vendedor OUTPUT 
-- Muestra el valor regresado por el procedimiento.
PRINT 'Ventas para el vendedor 2 con 5% de participaci�n ' +
convert(varchar(6),@venta_vendedor)
GO


/*3.	Escriba un SP que recibe como par�metro un c�digo de proveedor y obtiene como 
par�metro de salida el n�mero de registros de DETALLE_ORDENES en las que existen 
productos de ese proveedor.  Pruebe el SP.*/

select * from DETALLE_ORDENES;
go

create procedure sp_proveedor @prov int, @cuantos int OUTPUT
as
select @cuantos= count(*) from detalle_ordenes
where productoid in
(select productoid from productos where proveedorid= @prov)
go 

-- Prueba la ejecuci�n
declare @sale int
exec sp_proveedor 10, @sale OUTPUT
PRINT 'registros para proveedor 10 = '+convert (char(4),@sale)
go

/*4.	Escriba un SP que recibe como par�metro un nombre de compa��a de
un cliente y devuelve el n�mero de �rdenes y el promedio de descuento que se 
le ha concedido a ese cliente */

select * from ORDENES;
go
create procedure sp_cliente_ord @nomcia char (30),
@ordenes int output, @prom_des decimal (5,2) output
as
select @ordenes = count(ordenid), @prom_des = avg(descuento)
from ordenes o 
where o.clienteid =
  (select clienteid from clientes
   where  nombrecia like  @nomcia)
go


-- prueba de ejecuci�n
-- declara variables de salida
declare @ordenes_salida int, @promdes_salida decimal(5,2)

exec sp_cliente_ord 'EL ROSADO', @ordenes_salida output, @promdes_salida output
print 'Para EL ROSADO : ORDENES :'+ convert (char(4), @ordenes_salida) + 
'   PROMEDIO DESCUENTO: ' + convert(char(8), @promdes_salida)



-- 5. Escriba un SP que reciba el nombre de una compa��a cliente y devuelva 
-- el n�mero de �rdenes de esa compa��a, as� como el valor total de las �rdenes 
-- que ha generado. 


select * from ordenes
drop procedure ordenes_procedure 
go 
create procedure ordenes_procedure
@nom_cliente varchar(40),
@num_ordenes int output,
@val_generado money output
as

select @num_ordenes= count(ord.ordenid), @val_generado=sum(preciounit*cantidad)
from clientes cl join ordenes ord
on cl.CLIENTEID = ord.CLIENTEID
join DETALLE_ORDENES dord
on dord.ORDENID = ord.ORDENID
join PRODUCTOS pro
on pro.PRODUCTOID = dord.PRODUCTOID
where NOMBRECIA like @nom_cliente
go

declare @numero_de_ordenes int, @valor_total money
exec ordenes_procedure
'su tienda', @numero_de_ordenes output,@valor_total output
select @numero_de_ordenes as 'Numero de ordenes',@valor_total as 'Valor total'
go
--- 
CREATE PROCEDURE Ventas(@compania VARCHAR(125))
AS
CREATE TABLE #Temporal (ORDENID VARCHAR(125),Precio money)
INSERT INTO #Temporal
SELECT ORDENID, SUM((CANTIDAD*PRECIOUNIT)) AS Precio FROM DETALLE_ORDENES JOIN PRODUCTOS ON
DETALLE_ORDENES.PRODUCTOID=PRODUCTOS.PRODUCTOID
GROUP BY DETALLE_ORDENES.ORDENID
SELECT NOMBRECIA AS Compania,SUM(Precio) as [Ventas Totales],
COUNT(*) AS [Numero de Ordenes]
FROM CLIENTES JOIN ORDENES ON CLIENTES.CLIENTEID=ORDENES.CLIENTEID JOIN
#Temporal ON ORDENES.ORDENID=#Temporal.ORDENID
GROUP BY NOMBRECIA
HAVING NOMBRECIA=@compania
DROP TABLE #Temporal

SELECT * FROM CLIENTES
EXEC Ventas 'SU TIENDA'



