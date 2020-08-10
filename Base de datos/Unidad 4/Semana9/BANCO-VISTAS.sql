-- BASES DE DATOS
-- DRA. ROSA NAVARRETE 

/*Creación de VISTAS

Sobre la BD BANCOS, crear las siguientes VISTAS y nombrarlas como VISTA_XX, 
reemplazando XX por el número de la pregunta (ejemplo: VISTA_05). 
En las consultas combinadas utilizar la cláusula JOIN. 
Luego de creada la vista pruebe un select * from vista_xx */

USE BANCO 
GO 

/* Un listado alfabético de los clientes, en el que consten su apellido 
y nombre (como una sola cadena, separada con blanco, en 40 caracteres), 
nombre del sector en el que viven y el nombre del ejecutivo que tienen asignado.*/


select * from clientes;
select * from sector;
select * from ejecutivos;
GO 
 

create view vista_1 (cli,sec,eja,ejn)
as
select cast ((c.apellido+' '+c.nombre) as char(40)), nombreSector, e.apellido,
e.nombre 
from clientes c join sector s
on (c.sector = s.codSector)
join ejecutivos e
on (c.codEjecutivo = e.codEjecutivo); 

 

/* Para cada cliente que tenga préstamo; la información del cliente 
(misma presentación), el monto del préstamo, fecha_aproba, y saldo.*/

select * from prestamos 

create view vista_2 (cli, presm,fecha,sal)
as 
select cast ((c.apellido+' '+c.nombre) as char(40)), monto,
fecha_aproba,saldo
from clientes c join prestamos p
on (p.codCliente = c.codCliente);

select * from vista_2

/* Para cada ejecutivo, (presente el apellido y nombre del ejecutivo, 
en una sola cadena), el total del saldo_efectivo, de las cuentas a su cargo.*/

select * from Ejecutivos
select * from Cuentas

create view vista_3 (aa,nn,ss)
as
select apellido,nombre, SUM(saldo_Efectivo)
from Ejecutivos e join Cuentas c
on (c.cod_Ejecutivo = e.codEjecutivo)
GROUP by apellido,nombre;

select * from vista_3
 
/* El listado de los ejecutivos que pertenecen a cada sucursal. 
Presente el nomsucursal, el nombre del sector en el que se ubica, 
apellido y nombre del ejecutivo, fono_bco y fono_personal del ejecutivo.*/

select * from Ejecutivos
select * from Sucursal 
select * from sector

create view vista_4 
as 
select nomSucursal, nombreSector, apellido, nombre 
from Ejecutivos e join sucursal s
on (e.codSucursal = s.codSucursal)
join Sector ss
on (s.sector = ss.codsector);

select * from vista_4 

/* Para cada sector, el número de sucursales que tiene; presente codsector, 
ubicación y nombre_sector y número de sucursales.*/

select * from sector;
select * from Sucursal order by sector; 

create view vista_5 (cods,ub,noms,sucur)
as
select codsector, ubicacion, nombresector, COUNT(codsucursal)
from Sector s join Sucursal su
on s.codSector = su.sector
group by codsector, ubicacion, nombresector;

select * from vista_5

/* Lista de los clientes que tienen cuentas de “Ahorros”, y que al menos 
tienen 1 año de haber abierto la cuenta. */

select * from Cuentas 

create view vista_6
as
select apellido, nombre, cta.numcta, cta.tipo 
from Clientes c join ClientexCta cxc
on (c.codCliente = cxc.codCliente)
join Cuentas cta
on (cta.numCta = cxc.numCta)
where cta.tipo= 'Ahorro' and DATEDIFF (year, fecha_Apertura,getdate()) >=1;

select * from vista_6 

/* Todas las cuentas tipo “Corriente”, el numcta, la suma de los valores 
en el movimiento de crédito (tipo_mov= ´C´) en Detalle_mov_cta 
y la suma de los valores en el movimiento de débito (tipo_mov = ‘D`).*/

select * from Cuentas;
select * from Detalle_Mov_Cta
order by numcta;

create view vista_7 (numc,tipomov,suma)
as 
select c.numCta, tipo_Mov, SUM(valor)
from Detalle_Mov_Cta d join Cuentas c
on (c.numCta = d.numCta)
where c.tipo = 'Corriente'
group by c.numCta, tipo_Mov ;

select * from vista_7

/*Lista apellido y nombre de los clientes con edades superiores a 25 años.*/

select * from Clientes 

create view vista_8 (aa,nn,edad)
as
select apellido, nombre, DATEDIFF(year, fechaNac, getdate()) 
from Clientes
where DATEDIFF(year, fechaNac, getdate()) > 25;

select * from vista_8 

/* Lista de los clientes (apellido y nombre, separados con blanco), 
nombre_sector donde viven, apellido y nombre (separado con blanco) del ejecutivo 
que los atiende.*/

select * from sector

create view vista_9 (clie,sec,eje)
as 
select c.apellido+ ' '+ c.nombre, nombresector, e.apellido+ ' '+e.nombre
from clientes c join ejecutivos e
on c.codejecutivo = e.codejecutivo 
join Sector
on (c.sector = sector.codSector) ;

select * from vista_9 

/* Para cada ejecutivo, apellido y nombre (separado con un blanco),
 nomsucursal y el total acumulado en saldo_efectivo, de las cuentas que maneja.*/
 
select * from Ejecutivos 
select * from Sucursal 
select * from Cuentas 

create view vista_10 (ej,noms,sumsaldo)
as
select e.apellido + ' '+e.nombre, nomsucursal, SUM(saldo_Efectivo)
from Ejecutivos e join Sucursal s
on (e.codSucursal = s.codSucursal)
join Cuentas c
on (c.cod_Ejecutivo = e.codEjecutivo)
group by e.apellido + ' '+e.nombre, nomsucursal;

select * from vista_10