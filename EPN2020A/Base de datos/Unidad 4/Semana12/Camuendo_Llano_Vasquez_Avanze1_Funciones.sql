/* BASES DE DATOS 
DRA. ROSA NAVARRETE

EJERCICIOS PROPUESTOS*/


-- Sobre la BD PEDIDOS, escriba los siguientes STORED PROCEDURES.

/* 1. Escriba un SP para obtener la estadística de venta de un producto, que reciba como 
parámetro una variable @productoid int y asigne un id de producto.  
   
   Si no existe ese producto, imprima un mensaje y retorne un código de error.  
   Si existe el producto, pero no se tienen ventas de ese producto, 
   imprima un mensaje con código de error.
   Para obtener la estadística verifique el número de órdenes que se tienen y en cuántas 
   de esas órdenes se ha incluido ese producto y lo presenta como porcentaje. 
   (ej.  50 órdenes, 20 órdenes con ese producto, 50/20 *100). Retorne esa estadística 
   como un parámetro de salida. */

   


/* 2. Escriba un SP que reciba como parámetro los valores necesarios para el ingreso 
de una orden: nombre de la compañía cliente, el apellido y nombre del empleado que atiende 
la orden y un valor de descuento. La fecha de la orden está dada por la fecha del sistema. 
El SP debe ingresar la orden y obtener como salida el número de órdenes ingresadas 
para ese cliente */


   -- SOBRE LA BD BANCO 

/* 3. Escriba un SP para registrar el pago de una mensualidad a un Préstamo. 
El SP recibe como parámetros el número de préstamo y el valor que se va 
a pagar. Se debe ingresar el DETALLE_PRESTAMO considerando la fecha del
sistema para fecha_pago. Además, actualizar el préstamo correspondiente, 
restando del saldo el valor pagado del préstamo. El SP devuelve el saldo
que queda luego del pago. Considere devolver un valor de retorno distinto 
de cero si no existe el número de préstamo recibido como parámetro. Incluya
las sentencias COMMIT y ROLLBACK pertinentes. PROBAR EL SP.*/

/* 4. Escriba un SP para ordenar las cuentas abiertas por los clientes de modo 
que pertenezcan a sucursales que se encuentren en el sector en que vive el cliente.
El SP recibe como parámetro un nombre y apellido de un cliente y localiza al mismo. 
Si no existe el cliente retorna un mensaje y el código 1. 
Si existe el cliente, examine si todas sus cuentas, sin importar si son o no activas
han sido abiertas en sucursales del sector donde vive el cliente. 
El SP debe mostrar la lista de numCta, tipo, sucursal y sector, de todas las cuentas 
abiertas por ese cliente. El SP obtiene como salida, el número de cuentas que deben 
ser cambiadas de sucursal porque corresponden a sucursales en sectores distintos al que 
vive el cliente. PROBAR EL SP */

/* 5. Escriba un SP para ingresar un nuevo cliente al banco. El SP recibe como parámetros: 
cédula, apellido, nombre, dirección, celular, teléfono de casa (opcional) y teléfono del trabajo (opcional)
y el nombre del sector donde vive el cliente. Además, para asignarle el ejecutivo, considere 
al ejecutivo con el menor número de clientes asignados. Si hay ejecutivos con el mismo número 
de clientes, entonces de entre ellos, al primero en orden alfabético. PROBAR EL SP */

 --TRIGGER 

 USE PEDIDOS 
 GO 
 SELECT * FROM DETALLE_ORDENES
 SELECT * FROM PRODUCTOS 
 SELECT * FROM ORDENES

 /* 7. Escriba un trigger de INSERT en la tabla DETALLE_ORDENES. Cada vez que se ingresa un 
 registro en la tabla, se debe actualizar el campo EXISTENCIA de la tabla PRODUCTOS, restando la CANTIDAD 
 del producto ingresado en DETALLE_ORDENES. Pruebe el trigger */

 
 /* Crear la tabla siguiente: */
 create table PRODUCTOS_HISTORICO 
 (productoid int, fecha_cambio date, nuevo_precio money, primary key (productoid, fecha_cambio))

 /* 8. Escriba un trigger para INSERT de la tabla PRODUCTOS. Si El campo PRECIOUNIT se cambia, ingrese un 
  registro en la tabla PRODUCTOS_HISTORICO, con los campos respectivos. Pruebe el trigger */

/* 9. Escriba un trigger para UPDATE en la tabla ORDENES. Si se cambia el campo FECHAORDEN o DESCUENTO, 
debe ingresar los registros OLD y NEW en una tabla de auditoría para registrar cambios en estos campos. 
Debe crear inicialmente la tabla de auditoría*/


-- FUNCIONES 

 
/* 10. Escriba una función de tipo escalar que reciba como parámetro el nombre y apellido de un 
empleado y obtenga el número de órdenes que ese empleado ha atendido  */
SELECT * FROM ORDENES
SELECT * FROM EMPLEADOS
GO

DROP FUNCTION FN_NUMORDENES
GO

CREATE FUNCTION FN_NUMORDENES (@NOMBRE VARCHAR(20), @APELLIDO VARCHAR(20))
RETURNS INT 
AS
BEGIN
DECLARE @SUMORDENES INT
SELECT @SUMORDENES = COUNT(O.EMPLEADOID)
FROM ORDENES O JOIN EMPLEADOS E
ON O.EMPLEADOID = E.EMPLEADOID
WHERE @NOMBRE=E.NOMBRE AND @APELLIDO=E.APELLIDO
GROUP BY O.EMPLEADOID
return (@SUMORDENES)
END
GO

select EMPLEADOID, dbo.FN_NUMORDENES('MARIO','SANCHEZ') as 'Numero de ordenes' from EMPLEADOS ORDER BY EMPLEADOID

-- 11. Sobre la BD BANCO, escriba una función escalar que muestre el número de 
-- clientes atendidos por un ejecutivo cuyo nombre y apellido ingresan como parámetro. 
USE BANCO
GO

CREATE FUNCTION fn_numclientes (@NOMBRE VARCHAR(20), @APELLIDO VARCHAR(20))
RETURNS INT 
AS 
BEGIN
DECLARE @NUMCLIENTES INT
SELECT @NUMCLIENTES= COUNT(c.codEjecutivo)
FROM Clientes c JOIN Ejecutivos e
on c.codEjecutivo = e.codEjecutivo
WHERE @NOMBRE=e.nombre AND @APELLIDO=e.apellido
RETURN @NUMCLIENTES

END
GO 
select codEjecutivo,  dbo.fn_numclientes('Jose Luis','Narvaez Suñiga') as 'Numero de clientes' from Ejecutivos ORDER BY codEjecutivo

-- 12. Sobre la BD BANCO, escriba una función de tabla en línea de múltiples instrucciones
-- que muestre el detalle de los pagos realizados a un préstamo cuyo número ingresa 
-- como parámetros. Debe mostrar el valor del pago y la fecha en que se realizó. 
SELECT * FROM Prestamos
SELECT * FROM Detalle_Prestamo
GO

CREATE FUNCTION FN_DETALLEPAGOS(@NUMPRESTAMO INT)
RETURNS TABLE 
AS
RETURN(SELECT VALOR, FECHA_PAGO 
FROM Detalle_Prestamo d JOIN Prestamos p
on d.numPrestamo=p.numPrestamo
WHERE p.numPrestamo=@NUMPRESTAMO)
GO

SELECT * FROM FN_DETALLEPAGOS(1)

