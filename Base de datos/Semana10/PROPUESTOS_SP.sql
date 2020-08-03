/* BASES DE DATOS 
DRA. ROSA NAVARRETE

EJERCICIOS PROPUESTOS SOBRE STORED PROCEDURES */


-- Sobre la BD PEDIDOS, escriba los siguientes SP.

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
de una orden: nombre de la compañía cliente, nombre del empleado, y un valor de descuento. 
El SP debe ingresar la orden y obtener como salida el número de órdenes ingresadas 
para ese cliente */


/* 3. Escriba un SP que reciba como parámetro el nombre y apellido de un 
empleado y obtenga el número de órdenes que ese empleado ha atendido, así 
como el número de orden y la fecha, de la orden más reciente. */


/* 4. Escriba un SP para ingresar una orden de un cliente. Recibirá el 
nombre del cliente y el apellido y nombre del empleado que atiende 
la orden. La fecha de la orden está dada por la fecha del sistema */


/* 5. Escriba un SP para insertar un detalle de una orden de pedido. Revise 
-- los parámetros que requiera para ingresar. En el SP debe actualizar 
-- la cantidad en existencia del producto incluido en el detalle. 

   -- SOBRE LA BD BANCO 

/* 6. Escriba un SP para registrar el pago de una mensualidad a un Préstamo. 
El SP recibe como parámetros el número de préstamo y el valor que se va 
a pagar. Se debe ingresar el DETALLE_PRESTAMO considerando la fecha del
sistema para fecha_pago. Además, actualizar el préstamo correspondiente, 
restando del saldo el valor pagado del préstamo. El SP devuelve el saldo
que queda luego del pago. Considere devolver un valor de retorno distinto 
de cero si no existe el número de préstamo recibido como parámetro. Incluya
las sentencias COMMIT y ROLLBACK pertinentes. PROBAR EL SP.*/

/* 7. Escriba un SP para ordenar las cuentas abiertas por los clientes de modo 
que pertenezcan a sucursales que se encuentren en el sector en que vive el cliente.
El SP recibe como parámetro un nombre y apellido de un cliente y localiza al mismo. 
Si no existe el cliente retorna un mensaje y el código 1. 
Si existe el cliente, examine si todas sus cuentas, sin importar si son o no activas
han sido abiertas en sucursales del sector donde vive el cliente. 
El SP debe mostrar la lista de numCta, tipo, sucursal y sector, de todas las cuentas 
abiertas por ese cliente. El SP obtiene como salida, el número de cuentas que deben 
ser cambiadas de sucursal porque corresponden a sucursales en sectores distintos al que 
vive el cliente. PROBAR EL SP */

/* 8. Escriba un SP para ingresar un nuevo cliente al banco. El SP recibe como parámetros: 
cédula, apellido, nombre, dirección, celular, teléfono de casa (opcional) y teléfono del trabajo (opcional)
y el nombre del sector donde vive el cliente. Además, para asignarle el ejecutivo, considere 
al ejecutivo con el menor número de clientes asignados. Si hay ejecutivos con el mismo número 
de clientes, entonces de entre ellos, al primero en orden alfabético. PROBAR EL SP */


/* 9. Escriba un SP para realizar una transferencia entre cuentas. 
El SP recibe como parámetros: el número de cuenta de origen, el valor a debitar de
esa cuenta, el número de cuenta de destino. (Usar el saldo_contable en cuenta origen
y en cuenta destino). Tome como fecha del movimiento 
la fecha del sistema. Debe considerar que la transferencia genera un DETALLE_MOV de 
débito de la cuenta origen y otro de crédito en la cuenta destino. Además, verifique
si la cuenta de origen tiene el saldo suficiente, en caso contrario rollback. Si hay
algún error, rollback a la transacción. La transferencia debe tratarse como 
una transacción para considerar el commit y el rollback respectivos */



/* 10. Escriba un SP para registrar el pago de una mensualidad a un Préstamo. 
El SP recibe como parámetros el número de préstamo y el valor que se va 
a pagar. Se debe ingresar el DETALLE_PRESTAMO considerando la fecha del
sistema para fecha_pago. Además, actualizar el préstamo correspondiente, 
restando del saldo el valor pagado del préstamo. El SP devuelve el saldo
que queda luego del pago. Considere devolver un valor de retorno distinto 
de cero si no existe el número de préstamo recibido como parámetro. Incluya
las sentencias COMMIT y ROLLBACK pertinentes. 
 

