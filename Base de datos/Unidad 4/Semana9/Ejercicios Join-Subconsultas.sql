/*
BASES DE DATOS

EJERCICIOS DE CLASE 
*/
-- RESOLVER USANDO SUBQUERIES 

-- 1. Muestre a los clientes que han incluido en sus órdenes el 
--    producto 'salchichas de pollo'

use PEDIDOS
go

select * from clientes;
select * from ordenes;
select * from DETALLE_ORDENES;
select * from productos;

select nombrecia, o.ordenid, detalleid, productoid
from CLIENTES c join ORDENES o
on (c.CLIENTEID = o.CLIENTEID)
join DETALLE_ORDENES d
on (o.ORDENID = d.ORDENID)
where PRODUCTOID = 
   (select PRODUCTOID 
    from PRODUCTOS 
    where DESCRIPCION = 'salchichas de pollo')
    
use pedidos
go

select nombrecia
from CLIENTES
where CLIENTEID in 
	(select CLIENTEID
	 from ORDENES
	 where ORDENID in
		(select ORDENID
		 from DETALLE_ORDENES 
		 where PRODUCTOID in 
			(select PRODUCTOID
			 from PRODUCTOS
			 where DESCRIPCION= 'salchichas de pollo')) ) 
	 

    
-- 2. Muestre los productos que se incluyen en los pedidos de y los clientes que 
--    los han pedido. Ordene por producto.

select descripcion, nombrecia
from PRODUCTOS p join DETALLE_ORDENES d
on (p.PRODUCTOID = d.PRODUCTOID)
join ORDENES o
on (d.ORDENID = o.ORDENID)
join CLIENTES c
on (c.CLIENTEID = o.CLIENTEID)
order by descripcion


-- 3. Muestre los productos que se incluyen en cualquier pedido 
--    realizado por el cliente "supermercado dorado" o "supermercado descuento"  
    
select descripcion, nombrecia
from PRODUCTOS p join DETALLE_ORDENES d
on (p.PRODUCTOID = d.PRODUCTOID)
join ORDENES o
on (d.ORDENID = o.ORDENID)
join CLIENTES c
on (c.CLIENTEID = o.CLIENTEID)
where NOMBRECIA like 'SUPERMERCADO%'
ORDER BY NOMBRECIA

-- 4. Encuentre las compañías cliente que han comprado algún producto que también lo haya comprado la compañía EL ROSADO

select nombrecia
from CLIENTES
where CLIENTEID in
	(select CLIENTEID 
	 from ORDENES
	 where ORDENID in
		(select ORDENID 
		 from DETALLE_ORDENES 
		 where PRODUCTOID in
			(select productoid
			from DETALLE_ORDENES
			where ORDENID in
				(select ORDENID 
				from ORDENES
				where CLIENTEID in
					(select CLIENTEID
					from CLIENTES
					where NOMBRECIA = 'EL ROSADO'))))) 

	
	select  distinct nombrecia
	from CLIENTES c join ORDENES o 
	on (c.CLIENTEID = o.CLIENTEID)
	join DETALLE_ORDENES d
	on (d.ORDENID = o.ORDENID) 
	where PRODUCTOID in 	 
		(select productoid 
		from DETALLE_ORDENES d join ORDENES o
		on (d.ORDENID = o.ORDENID)
		join CLIENTES c
		on (o.CLIENTEID = c.CLIENTEID)
		and NOMBRECIA = 'EL ROSADO')
		  
		  
-- 5.  Encuentre los nombres de los productos que tienen el precio unitario más alto, dentro de los productos de su categoría

select * from PRODUCTOS 


select descripcion, preciounit
from PRODUCTOS pr1
where PRECIOUNIT = 
	(select MAX(preciounit) 
	 from PRODUCTOS pr2
	 where pr1.CATEGORIAID = pr2.CATEGORIAID) 
	 
-- 6. Cambie a 15 el valor de DESCUENTO de las órdenes que incluyan algún producto de la categoría COSMETICOS

update ORDENES 
set DESCUENTO = 15 
where ORDENID in 
	(select ORDENID
	 from ORDENES 
	 where ORDENID in
		(select ORDENID 
		 from DETALLE_ORDENES 
		 where PRODUCTOID in 
			(select PRODUCTOID 
			 from PRODUCTOS
			 where CATEGORIAID in
				(select CATEGORIAID 
				 from CATEGORIAS
				 where NOMBRECAT = 'COSMETICOS') ) ) )
				 
				 
update ORDENES
set DESCUENTO = 15
where ORDENID in
	(select o.ORDENID 
	 from ORDENES o join DETALLE_ORDENES d
	 on o.ORDENID = d.ORDENID
	 and PRODUCTOID in 
		(select p.PRODUCTOID 
		 from PRODUCTOS p join CATEGORIAS c
		 on p.CATEGORIAID = c.CATEGORIAID
		 and NOMBRECAT = 'COSMETICOS') )  

-- RESOLVER SIN SUBQUERIES 
				 
-- 7.  Liste los empleados en orden alfabético que tienen el mismo jefe que el empleado JUAN ANDRADE

select * from empleados

select apellido, nombre from empleados E1
where reporta_a = (select reporta_a from empleados E2 
where nombre like 'JUAN' and apellido like 'ANDRADE')

-- 8  Obtenga el número de orden (ordenid), detalleid, productoid, cantidad
       -- preciounit, PRECIO como etiqueta de (cantidad*preciounit)  

select * from ordenes
select * from detalle_ordenes

select * from productos

select do.ordenid, do.detalleid, DO.productoid, do.cantidad, p.preciounit, (do.cantidad*p.preciounit) as 'PRECIO'
from detalle_ordenes DO join productos P 
on DO.productoid = P.productoid 
order by do.ordenid



-- 9.  Obtenga un listado de los empleados con el nombre de su jefe. Etiquete cada columna

select * from empleados


select E.apellido as 'APELLIDO EMPLEADO', E.nombre as 'NOMBRE EMPLEADO', 
J.apellido AS 'APELLIDO JEFE',J.nombre as 'NOMBRE JEFE'
from Empleados E
left outer join Empleados J
on E.reporta_a = J.empleadoid


-- 10  Muestre el nombre de producto (descripcion) y la cantidad de unidades vendidas de todos los
       -- productos que han tenido ventas, ordenado alfabéticamente por producto*/


select * from detalle_ordenes

select * from productos

select P.descripcion, sum(cantidad)as 'CANTIDAD VENDIDA'
from detalle_ordenes D join productos P 
on (D.productoid = P.productoid)
group by P.descripcion
order by P.descripcion


