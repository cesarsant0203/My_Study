/*
BASES DE DATOS
Ing. Rosa Navarrete
SCRIPT DE EJEMPLOS DE STORED PROCEDURES
*/


/*1.	Cree una tabla llamada TOTAL-VENTA, que contenga el código del artículo 
y un campo para el número total de unidades vendidas.
•	Escriba un SP para insertar un registro en la tabla DETALLE_ORDENES, que 
reciba como parámetros:  el número de orden, el código del artículo y la cantidad.- 
El SP debe insertar un registro en DETALLE_ORDENES y actualizar la tabla TOTAL-VENTA, 
para sumar la cantidad vendida del artículo y mantener el total vendido acumulado.
*/

use pedidos
go
create table TOTAL_VENTA (codarticulo int primary key, total int)

select * from detalle_ordenes -- verificar cuál es el contenido
insert into total_venta values(2, 5) -- para probar con código de art. 2

drop procedure sp_total

create procedure sp_total @orden int ,@det int, @art int ,@cant int
as
insert into detalle_ordenes (ordenid, detalleid, productoid, cantidad) values
(@orden,@det,@art,@cant)
select codarticulo from total_venta where codarticulo=@art
if @@ROWCOUNT > 0 
   update total_venta
   set total= total+ @cant
   where codarticulo=@art
else 
   insert into total_venta values(@art, @cant)
go

-- Prueba la ejecución

execute sp_total 5,3,1,5
select * from total_venta



/*2.	Sobre la bd PEDIDOS.
Escriba un SP para obtener el valor a pagar por participación en ventas 
a un empleado.-  
•	El SP recibe como parámetro el código del empleado y un porcentaje de 
participación y obtiene como parámetro de salida el valor que el empleado 
va a recibir, calculado como el porcentaje de participación por la 
venta realizada por ese empleado (no considere los descuentos en las órdenes
de pedido).-  Pruebe el SP */

use pedidos
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
   where empleadoid= 3)

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

-- Prueba la ejecución
-- Declarar la variables para recibir la salida del procedure
DECLARE @venta_vendedor money
-- Ejecuta el procedure con un código de vendedor y porcentaje 
-- de participación y salva el valor de salida.
EXECUTE sp_participa 3,5,  @venta_vendedor OUTPUT 
-- Muestra el valor regresado por el procedimiento.
PRINT 'Ventas para el vendedor 3 con 5% de participación' +
convert(varchar(6),@venta_vendedor)
GO




/*3.	Escriba un SP que recibe como parámetro un código de proveedor y obtiene como 
parámetro de salida el número de registros de DETALLE_ORDENES en las que existen 
productos de ese proveedor.  Pruebe el SP.*/

create procedure sp_proveedor @prov int, @cuantos int OUTPUT
as
select @cuantos=count(*) from detalle_ordenes
where productoid in
(select productoid from productos where proveedorid= @prov)
go 

-- Prueba la ejecución
declare @sale int
exec sp_proveedor 10, @sale OUTPUT
PRINT 'registros para proveedor 10 = '+convert (char(4),@sale)


/*4.	Escriba un SP que recibe como parámetro un nombre de compañía de
un cliente y devuelve el número de órdenes y el promedio de descuento que se 
le ha concedido a ese cliente */

create procedure sp_cliente_ord @nomcia char (30),
@ordenes int output, @prom_des decimal (5,2) output
as
select @ordenes = count(ordenid), @prom_des = avg(descuento)
from ordenes o 
where o.clienteid =
  (select clienteid from clientes
   where  nombrecia like  @nomcia)
go


-- prueba de ejecución
-- declara variables de salida
declare @ordenes_salida int, @promdes_salida decimal(5,2)

exec sp_cliente_ord 'SU TIENDA', @ordenes_salida output, @promdes_salida output
print 'Para SU TIENDA : ORDENES :'+ convert (char(4), @ordenes_salida) + 
'   PROMEDIO DESCUENTO: ' + convert(char(8), @promdes_salida)


/*4. Sobre la BD BANCO. Escriba un SP que verifique un préstamo que ya ha sido cancelado. El
SP recibe como parámetro el número del préstamo.  

b. Verifique que el préstamo tenga saldo cero. Si no lo tiene, ROLLBACK.
c. Verifique si la suma del campo VALOR en detalle_préstamo, es igual al MONTO del préstamo, 
si no lo es imprima un mensaje y haga un ROLLBACK. 
d. Si se cumple, pase el registro de PRESTAMO a una tabla idèntica (previamente creada) que se llame 
PRESTAMOS_CANCELADOS y pase los registros de DETALLE_PRESTAMO a una tabla idéntica  
(previamente creada) que se llame DETALLE_PRESTAMO_CANCELADOS.  
e. Luego borre los registros de DETALLE_PRESTAMO y de PRESTAMOS. */

use banco
go

select * from prestamos
select * from detalle_prestamo

create table prestamos_cancelados
(numprestamo int primary key, monto money, fecha_aprobada datetime, dividendos tinyint, saldo money, codsucursal int,
codcliente int)

select * from prestamos_cancelados
delete prestamos_cancelados

create table detalle_prestamos_cancelados
(num_detalle_pres int primary key, fecha_pago datetime, valor money, numprestamo int)

select * from detalle_prestamos_cancelados

begin tran
declare @numprestamo int, @sumavalor money 
SET @numprestamo = 2

select * from prestamos

if not exists (select numprestamo FROM prestamos  WHERE numprestamo=@numprestamo and saldo=0)
	begin
	print 'El número de préstamo no existe o aún no ha sido cancelado'
	rollback tran
	end

else

begin

set @sumavalor= (select sum(valor) from detalle_prestamo
                 where numprestamo = @numprestamo) 

if @sumavalor != (select monto from prestamos
				 where numprestamo = @numprestamo)
	begin 
		print 'Hay un error, los pagos no igualan al monto'
		rollback tran
	end

else
	begin
		insert into prestamos_cancelados
        select * from prestamos 
		where numprestamo = @numprestamo

		insert into detalle_prestamos_cancelados
        select * from detalle_prestamo
		where numprestamo = @numprestamo

        delete detalle_prestamo 
		where numprestamo = @numprestamo

		delete prestamos 
		where numprestamo = @numprestamo

	 end
commit tran
end

---