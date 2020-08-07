/* BASES DE DATOS 
   EJERCICIOS SOBRE TRANSACCIONES
   Dra. Rosa Navarrete
*/


-- Sobre la BD PRUEBA

/* 1.  Escriba una transacción para actualizar el sueldo de un empleado.  
a.  Defina una variable local con el apellido del empleado
b.  Localice al empleado.  Si no encuentra un registro con ese apellido, ROLLBACK
c.  Si encuentra más de un registro, mensaje indicando que necesita el nombre y ROLLBACK
d.  Si encuentra solo un registro con el apellido, actualice el salario del empleado subiéndole un 10%
e.  Si el valor actualizado supera el sueldomax para ese cargo, imprima un mensaje y actualice el sueldo 
    al sueldomax del cargo.
f.  COMMIT  a la transacción

*/

use BDPRUEBA
go 

select * from empleados
select * from cargos
-- Inicio de la transacción
begin tran 

	declare @ape char(30), @codemp int, @nuevosueldo money, @maxs money, @registros int
	set @ape = 'PAZ'

	select @codemp = CodEmple from empleados where apellido = @ape 
    set @registros=@@rowcount  -- guarda el número de registros que cumplen la condición

	if @registros = 0 
		begin
          print 'No existen empleados con ese apellido'
          ROLLBACK TRAN
		end

	if @registros > 1
		begin
			print 'Hay más de un empleado de ese apellido. Necesita el nombre'
			ROLLBACK TRAN
		end
		
    if @registros = 1
        begin
				update empleados 
				set sueldo = sueldo * 1.1
				where CodEmple = @codemp

				select @nuevosueldo = sueldo from empleados
				where CodEmple = @codemp

				set @maxs = (select sueldomax from cargos c join empleados e
					on e.cargo = c.codcargo
					where e.codemple = @codemp)
				
				if @nuevosueldo > @maxs			
					update empleados 
					set sueldo = @maxs
					where CodEmple = @codemp
			
           
			commit tran
		end
go 



/* 2.  Escriba una transacción que defina una variable con un nombre de un cargo.
a.  Busque si existe ese nombre de cargo, si no lo encuentra ROLLBACK
b.  Encuentre el promedio de sueldo de los empleados que tengan un ese cargo.  Si el
promedio es < que el 75% de sueldo máximo para ese cargo, actualice el sueldo de los 
empleados subiéndolo en un 8%.
c.  Commit a la transacción
*/

select * from empleados
select * from cargos

begin tran
declare @cargo char(30), @promcargo money, @codcargo int
set @cargo = 'SECRETARIA EJECUTIVA'

set @codcargo = (select  codcargo  from cargos where nomcargo = @cargo)
if @@rowcount = 0 
  begin
     print 'No existe el cargo'
     rollback tran
  end 


set @promcargo = (select avg(sueldo) 
from empleados 
where cargo = @codcargo)

if @promcargo <  (select sueldomax *0.75 
                 from cargos 
                 where nomcargo = @cargo)
   begin
      update empleados
      set sueldo = sueldo + sueldo * 1.08
      where cargo = @codcargo
      commit tran
  end



use banco
go

/*3.	Escriba una transacción para cambiar el ejecutivo de un cliente. Haga lo siguiente:
a. Defina una variable local que contenga el codcliente. (este es el cliente referencial)
b. Si no encuentra el cliente, imprima un mensaje y ROLLBACK.
c. Ubique al primer ejecutivo, en orden alfabético, que trabaje en una sucursal que pertenezca al sector donde está el cliente referencial. 
d. Asigne el codejecutivo al cliente referencial 
e. y a cada una de las cuentas de ese cliente referencial.
COMMIT  a la transacción. */

select * from clientes order by codEjecutivo

select * from ejecutivos

select * from sector

select * from sucursal

select * from cuentas

select * from clientexcta


BEGIN TRAN PREGUNTA1
DECLARE @codcliente int, @nuevoejecutivo int

-- a

set @codcliente = 102

-- b
IF NOT EXISTS( select cl.codcliente from clientes cl where cl.codcliente=@codcliente)
	BEGIN
	PRINT('CLIENTE NO ENCONTRADO')
	ROLLBACK TRAN PREGUNTA1
	END

ELSE
	-- c
	BEGIN
	DECLARE @sectorcliente int
	SET @sectorcliente = (select sector from clientes 
	where codcliente=@codcliente)
	SELECT @sectorcliente as 'SECTOR_CLIENTE'

    set @nuevoejecutivo = (select top 1 e.codEjecutivo
    from ejecutivos e join sucursal s
    on (e.codsucursal = s.codsucursal)
    where s.sector = @sectorcliente
    order by e.apellido, e.nombre)

    SELECT @nuevoejecutivo as 'NUEVO EJECUTIVO'

	-- d	
	update clientes 
    set codejecutivo = @nuevoejecutivo
    where codcliente = @codcliente

	-- e
	UPDATE cuentas
	SET cod_ejecutivo = @nuevoejecutivo
	where numcta in (select numcta from clientexcta 
                     where codcliente = @codcliente)
	
END
COMMIT TRAN
GO

/*4. Sobre la BD BANCO. Escriba una transacción que verifique un préstamo que ya ha sido cancelado. 

a. Defina una variable local que contenga el NUMPRESTAMO.
b. Verifique que el préstamo tenga saldo cero. Si no lo tiene, ROLLBACK.
c. Verifique si la suma del campo VALOR en detalle_préstamo, es igual al MONTO del préstamo, 
si no lo es imprima un mensaje y haga un ROLLBACK. 
d. Si se cumple, pase el registro de PRESTAMO a una tabla idèntica (previamente creada) que se llame PRESTAMOS_CANCELADOS 
y pase los registros de DETALLE_PRESTAMO a una tabla idéntica  (previamente creada) que se llame DETALLE_PRESTAMO_CANCELADOS.  
e. Luego borre los registros de DETALLE_PRESTAMO y de PRESTAMOS. */

use banco
go

select * from prestamos
select * from Detalle_Prestamo

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
SET @numprestamo = 20

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
		print 'Hay un error, los pagos no igualan al monto';
		rollback tran;
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
go





