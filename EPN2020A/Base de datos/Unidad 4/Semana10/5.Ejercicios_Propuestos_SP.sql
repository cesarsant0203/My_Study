/* BASES DE DATOS 
DRA. ROSA NAVARRETE

EJERCICIOS PROPUESTOS SOBRE STORED PROCEDURES */


-- Sobre la BD PEDIDOS, escriba los siguientes SP.

/* 1. Escriba un SP para obtener la estad�stica de venta de un producto, que reciba como 
par�metro una variable @productoid int y asigne un id de producto.  
   
   Si no existe ese producto, imprima un mensaje y retorne un c�digo de error.  
   Si existe el producto, pero no se tienen ventas de ese producto, 
   imprima un mensaje con c�digo de error.
   Para obtener la estad�stica verifique el n�mero de �rdenes que se tienen y en cu�ntas 
   de esas �rdenes se ha incluido ese producto y lo presenta como porcentaje. 
   (ej.  50 �rdenes, 20 �rdenes con ese producto, 50/20 *100). Retorne esa estad�stica 
   como un par�metro de salida. */

/* 2. Escriba un SP que reciba como par�metro los valores necesarios para el ingreso 
de una orden: nombre de la compa��a cliente, nombre del empleado, y un valor de descuento. 
El SP debe ingresar la orden y obtener como salida el n�mero de �rdenes ingresadas 
para ese cliente */


/* 3. Escriba un SP que reciba como par�metro el nombre y apellido de un 
empleado y obtenga el n�mero de �rdenes que ese empleado ha atendido, as� 
como el n�mero de orden y la fecha, de la orden m�s reciente. */


/* 4. Escriba un SP para ingresar una orden de un cliente. Recibir� el 
nombre del cliente y el apellido y nombre del empleado que atiende 
la orden. La fecha de la orden est� dada por la fecha del sistema */


/* 5. Escriba un SP para insertar un detalle de una orden de pedido. Revise 
-- los par�metros que requiera para ingresar. En el SP debe actualizar 
-- la cantidad en existencia del producto incluido en el detalle. 

   -- SOBRE LA BD BANCO 

/* 6. Escriba un SP para registrar el pago de una mensualidad a un Pr�stamo. 
El SP recibe como par�metros el n�mero de pr�stamo y el valor que se va 
a pagar. Se debe ingresar el DETALLE_PRESTAMO considerando la fecha del
sistema para fecha_pago. Adem�s, actualizar el pr�stamo correspondiente, 
restando del saldo el valor pagado del pr�stamo. El SP devuelve el saldo
que queda luego del pago. Considere devolver un valor de retorno distinto 
de cero si no existe el n�mero de pr�stamo recibido como par�metro. Incluya
las sentencias COMMIT y ROLLBACK pertinentes. PROBAR EL SP.*/

/* 7. Escriba un SP para ordenar las cuentas abiertas por los clientes de modo 
que pertenezcan a sucursales que se encuentren en el sector en que vive el cliente.
El SP recibe como par�metro un nombre y apellido de un cliente y localiza al mismo. 
Si no existe el cliente retorna un mensaje y el c�digo 1. 
Si existe el cliente, examine si todas sus cuentas, sin importar si son o no activas
han sido abiertas en sucursales del sector donde vive el cliente. 
El SP debe mostrar la lista de numCta, tipo, sucursal y sector, de todas las cuentas 
abiertas por ese cliente. El SP obtiene como salida, el n�mero de cuentas que deben 
ser cambiadas de sucursal porque corresponden a sucursales en sectores distintos al que 
vive el cliente. PROBAR EL SP */

/* 8. Escriba un SP para ingresar un nuevo cliente al banco. El SP recibe como par�metros: 
c�dula, apellido, nombre, direcci�n, celular, tel�fono de casa (opcional) y tel�fono del trabajo (opcional)
y el nombre del sector donde vive el cliente. Adem�s, para asignarle el ejecutivo, considere 
al ejecutivo con el menor n�mero de clientes asignados. Si hay ejecutivos con el mismo n�mero 
de clientes, entonces de entre ellos, al primero en orden alfab�tico. PROBAR EL SP */


/* 9. Escriba un SP para realizar una transferencia entre cuentas. 
El SP recibe como par�metros: el n�mero de cuenta de origen, el valor a debitar de
esa cuenta, el n�mero de cuenta de destino. (Usar el saldo_contable en cuenta origen
y en cuenta destino). Tome como fecha del movimiento 
la fecha del sistema. Debe considerar que la transferencia genera un DETALLE_MOV de 
d�bito de la cuenta origen y otro de cr�dito en la cuenta destino. Adem�s, verifique
si la cuenta de origen tiene el saldo suficiente, en caso contrario rollback. Si hay
alg�n error, rollback a la transacci�n. La transferencia debe tratarse como 
una transacci�n para considerar el commit y el rollback respectivos */



/* 10. Escriba un SP para registrar el pago de una mensualidad a un Pr�stamo. 
El SP recibe como par�metros el n�mero de pr�stamo y el valor que se va 
a pagar. Se debe ingresar el DETALLE_PRESTAMO considerando la fecha del
sistema para fecha_pago. Adem�s, actualizar el pr�stamo correspondiente, 
restando del saldo el valor pagado del pr�stamo. El SP devuelve el saldo
que queda luego del pago. Considere devolver un valor de retorno distinto 
de cero si no existe el n�mero de pr�stamo recibido como par�metro. Incluya
las sentencias COMMIT y ROLLBACK pertinentes. 
 

