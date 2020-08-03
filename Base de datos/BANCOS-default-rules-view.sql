/*	
   BASES DE DATOS
   Ing. Rosa Navarrete							    */
/* SCRIPT DE CREACIÓN DE LA BASE DE DATOS BANCOS	*/
/* INCLUYE INSERCIÓN DE REGISTROS					*/
/*													*/

USE MASTER
GO
CREATE DATABASE BANCO
GO
USE BANCO
GO
create table Sector
(
  codSector int CONSTRAINT PK_Sector PRIMARY KEY IDENTITY(1,1) NOT NULL,
  ubicacion  varchar(50)NOT NULL,
  nombreSector  varchar(50)NOT NULL
)
create table Sucursal
(
  codSucursal int CONSTRAINT PK_Sucursal PRIMARY KEY IDENTITY(1,1) NOT NULL,
  nomSucursal  varchar(30)NOT NULL,
  sector int NOT NULL,
  direccion  varchar(50) NULL,
  CONSTRAINT FK_Sucursal_Sector FOREIGN KEY (sector) REFERENCES Sector(codSector)
)

create table Ejecutivos
(
  codEjecutivo int CONSTRAINT PK_Ejecutivo PRIMARY KEY IDENTITY(1,1) NOT NULL,
  cedula  char(10)UNIQUE,
  apellido  varchar(30)NOT NULL,
  nombre  varchar(30)NOT NULL,
  codSucursal int NULL,
  fono_Bco  varchar(9) NOT NULL,
  fono_Personal  varchar(9) NOT NULL,
  CONSTRAINT FK_Ejecutivos_Sucursal FOREIGN KEY (codSucursal) REFERENCES Sucursal(codSucursal)
)
create table Clientes
(
  codCliente int CONSTRAINT PK_Cliente PRIMARY KEY IDENTITY(1,1) NOT NULL,
  cedula  char(10) UNIQUE NOT NULL,
  apellido  varchar(30) NOT NULL,
  nombre  varchar(30) NOT NULL,
  fechaNac smalldatetime NULL,  
  direccion  varchar(50)NOT NULL,
  sector int  NOT NULL,
  fono_Ofic varchar(9) NULL,
  fono_Dom  varchar(9) NULL,
  fono_Cel  varchar(9) NULL,
  codEjecutivo int NOT NULL,
  CONSTRAINT FK_Clientes_Sector FOREIGN KEY (sector) REFERENCES Sector(codSector),
  CONSTRAINT FK_Clientes_Ejecutivos FOREIGN KEY (codEjecutivo) REFERENCES Ejecutivos(codEjecutivo)
)
create table Cuentas
(
  numCta int CONSTRAINT PK_Cuentas PRIMARY KEY IDENTITY(1,1) NOT NULL,
  titulo  varchar(50)NOT NULL,
  fecha_Apertura smalldatetime NOT NULL,  
  sucursal int  NOT NULL,
  tipo  char(10)NOT NULL,
  saldo_Contable  money NOT NULL,
  saldo_Efectivo money NOT NULL,
  cod_Ejecutivo int NOT NULL,
  CONSTRAINT FK_Cuentas_Sucursal FOREIGN KEY (sucursal) REFERENCES Sucursal(codSucursal),
  CONSTRAINT FK_Cuentas_Ejecutivos FOREIGN KEY (cod_Ejecutivo) REFERENCES Ejecutivos(codEjecutivo)
)

create table Detalle_Mov_Cta
(
  num_Mov int CONSTRAINT PK_DetalleMovCta PRIMARY KEY IDENTITY(1,1) NOT NULL,
  numCta int  NOT NULL,
  fecha_Mov smalldatetime NOT NULL,  
  tipo_Mov  char(1)NOT NULL,
  valor  money NOT NULL,
  CONSTRAINT FK_DetalleMovCta_Cuentas FOREIGN KEY (numCta) REFERENCES Cuentas(numCta)
)

create table ClientexCta
(
  codCliente int NOT NULL,
  numCta int  NOT NULL,
  activo bit NOT NULL,
  CONSTRAINT FK_ClientexCta_Clientes FOREIGN KEY (codCliente) REFERENCES Clientes(codCliente),
  CONSTRAINT FK_ClientexCta_Cuentas FOREIGN KEY (numCta) REFERENCES Cuentas(numCta)
)

ALTER TABLE ClientexCta WITH NOCHECK ADD 
	CONSTRAINT PK_ClientexCta PRIMARY KEY  CLUSTERED 
	(
		codCliente,
		numCta
	) 

create table Prestamos
(
  numPrestamo int CONSTRAINT PK_Prestamos PRIMARY KEY IDENTITY(1,1) NOT NULL,
  monto money NOT NULL,
  fecha_aproba smalldatetime NOT NULL,
  dividendos tinyint NOT NULL,
  saldo money NOT NULL,
  codSucursal int NOT NULL,
  codCliente int NOT NULL,
  CONSTRAINT FK_Prestamos_Clientes FOREIGN KEY (codCliente) REFERENCES Clientes(codCliente)
)

create table Detalle_Prestamo
(
  num_detalle_pres int CONSTRAINT PK_DetallePrestamo PRIMARY KEY IDENTITY(1,1) NOT NULL,
  fecha_pago smalldatetime NOT NULL,
  valor money NOT NULL,
  numPrestamo int NOT NULL,
  CONSTRAINT FK_DetallePrestamo_Prestamos FOREIGN KEY (numPrestamo) REFERENCES Prestamos(numPrestamo)
)


--INSERCION DE REGISTROS

INSERT INTO Sector VALUES ('NORTE','EL BOSQUE')
INSERT INTO Sector VALUES ('NORTE','EL GIRON')
INSERT INTO Sector VALUES ('CENTRO','PLAZA GRANDE')
INSERT INTO Sector VALUES ('CENTRO','STO.DOMINGO')
INSERT INTO Sector VALUES ('SUR','VILLAFLORA')

SELECT * FROM SECTOR


INSERT INTO Sucursal VALUES ('El Bosque',1,'Centro Comercial')
INSERT INTO Sucursal VALUES ('Palacio Arzobispal',2,'García Moreno')
INSERT INTO Sucursal VALUES ('Brasil',1,'Avenida Brasil')
INSERT INTO Sucursal VALUES ('Sto.Domingo',3,'Guayaquil y Robles')
INSERT INTO Sucursal VALUES ('Centro Comercial Sur',4,'Teniente Hugo Ortiz')

SELECT * FROM SUCURSAL

INSERT INTO Ejecutivos VALUES ('1719226258','Narvaez Suñiga','Jose Luis',4,'2456789','098538126')
INSERT INTO Ejecutivos VALUES ('0795225257','Montenegro Perez','Fabian Fernando',2,'2156489','098123456')
INSERT INTO Ejecutivos VALUES ('1977226258','Martinez Erazo','Luis Fabian',1,'2528413','098321987')
INSERT INTO Ejecutivos VALUES ('0512362547','Villa Soler','Marco Antonio',3,'2321987','098963147')
INSERT INTO Ejecutivos VALUES ('0412451245','Armedaris Ruiz','Martha Cecilia',4,'2147563','098020505')

SELECT * FROM EJECUTIVOS


INSERT INTO Clientes VALUES ('1919562536','Paucar Lopez','Juan Manuel','05/04/84','La Granja',1,'2414550','2343179','098456123',1)
INSERT INTO Clientes VALUES ('1236562365','Narváez Enriquez','Diego Fernando','17/07/79','El Pinar',2,'2654789','2225179','090556123',2)
INSERT INTO Clientes VALUES ('1419562123','Paz Navarro','Julio Jose','11/11/69','Amazonas y Naciones Unidas',3,'2357753','2987456','090512123',3)
INSERT INTO Clientes VALUES ('1719562654','Paucar Lopez','Roberto Gabriel','23/04/80','El Inca Madre Selva #529',4,'2159951','2363252','093256123',4)
INSERT INTO Clientes VALUES ('0419562963','Rivas Romero','Ivan Gustavo','12/12/80','Los Rosarios Andino #4565',5,'2931564','2125654','065456123',5)

SELECT * FROM CLIENTES


INSERT INTO Cuentas VALUES ('A','12/12/90',5,'Ahorro',550,1000,1)
INSERT INTO Cuentas VALUES ('B','22/10/92',1,'Corriente',850,2500,3)
INSERT INTO Cuentas VALUES ('C','04/12/94',4,'Corriente',700,1500,2)
INSERT INTO Cuentas VALUES ('D','01/09/96',2,'Ahorro',855,1900,4)
INSERT INTO Cuentas VALUES ('E','30/06/92',3,'Corriente',898,1200,5)

SELECT * FROM CUENTAS


INSERT INTO Detalle_Mov_Cta VALUES (1,'04/12/94','C',200)
INSERT INTO Detalle_Mov_Cta VALUES (2,'30/06/92','D',100)
INSERT INTO Detalle_Mov_Cta VALUES (3,'12/12/90','C',250)
INSERT INTO Detalle_Mov_Cta VALUES (4,'22/10/92','D',310)
INSERT INTO Detalle_Mov_Cta VALUES (5,'01/09/96','D',150)

SELECT * FROM Detalle_Mov_Cta
 
INSERT INTO ClientexCta VALUES (1,2,1)
INSERT INTO ClientexCta VALUES (2,1,0)
INSERT INTO ClientexCta VALUES (3,3,1)
INSERT INTO ClientexCta VALUES (4,5,1)
INSERT INTO ClientexCta VALUES (5,4,0)

SELECT * FROM CLIENTEXCTA


INSERT INTO Prestamos VALUES (1500,'10/10/02',100,1400,2,1)
INSERT INTO Prestamos VALUES (2500,'10/09/01',120,2380,2,2)
INSERT INTO Prestamos VALUES (3300,'10/08/03',150,3150,3,3)
INSERT INTO Prestamos VALUES (5000,'11/03/01',250,4750,4,4)
INSERT INTO Prestamos VALUES (3500,'09/10/02',200,3300,5,5)

SELECT * FROM PRESTAMOS

INSERT INTO Detalle_Prestamo VALUES ('10/01/02',1500,1)
INSERT INTO Detalle_Prestamo VALUES ('11/10/01',1500,2)
INSERT INTO Detalle_Prestamo VALUES ('10/05/02',1500,3)
INSERT INTO Detalle_Prestamo VALUES ('20/06/03',1500,4)
INSERT INTO Detalle_Prestamo VALUES ('25/02/03',1500,5)


SELECT * FROM DETALLE_PRESTAMO


---------

/*Crear los siguientes tipos de datos de usuario:
tipo_id , carácter de 7, no admita nulos.
tipo_isbn , carácter de 12 y no admita nulos.*/

exec sp_addtype tipo_id, 'char(7)', 'not null'
exec sp_addtype tipo_isbn, 'char(12)', 'not null'

/*Crear una regla llamada regla_id, que permita un dato con las sig. características : 
cuatro caracteres alfabéticos de la P a la Z, mayúsculas o minúsculas; 
el símbolo _ (subrayado); dos caracteres numéricos impares */

create rule regla_id as
@var like '[P-Zp-z][P-Zp-z][P-Zp-z][P-Zp-z]_[13579][13579]'  

/*Crear un default llamado default_id, con el valor ‘PVQY_33’*/

create default default_id as 'PVQY_33'

/*Asocie la regla al tipo de dato de usuario tipo_id*/

exec sp_bindrule regla_id, 'tipo_id'

/*Asocie el default_id, a la columna en la que se asignó el tipo_id*/

CREATE TABLE t1(id int, nombre varchar(20), campo tipo_id)

exec sp_bindefault default_id, 't1.campo'

/*Crear una regla, llamada regla_isbn que permita almacenar un identificador
 ISBN: primeros 3 caracteres alfabéticos que pueden ser una de las cadenas 
 ‘TEM’, ‘NEW’, ‘PRI’, ‘REE’, luego un guión medio, cuatro dígitos, un guión, 
 un carácter alfabético mayúscula entre A hasta H, luego dos dígitos.*/
 
 create rule regla_isbn as
 @var like 'TEM-[0-9][0-9][0-9][0-9]-[A-H][0-9][0-9]' OR
 @var like 'NEW-[0-9][0-9][0-9][0-9]-[A-H][0-9][0-9]' OR
 @var like 'PRI-[0-9][0-9][0-9][0-9]-[A-H][0-9][0-9]' OR
 @var like 'REE-[0-9][0-9][0-9][0-9]-[A-H][0-9][0-9]'
 
/* Asocie la regla al tipo de dato de usuario tipo_isbn */

exec sp_bindrule regla_isbn, tipo_isbn

/* Crear una tabla llamada “pruebadef”, con las columnas: (cola tipo_id, 
colb char(10), 
colc tipo_isbn)*/

create table pruebadef (
 cola int,
 colb char(10),
 colc tipo_isbn) 
 
/* Insertar varios registros y probar que funcionan las reglas y el default.*/

-- incorrecto
insert into pruebadef values (1,'abc','REE-123-A55')
-- correcto 
insert into pruebadef values (1,'abc','REE-1234-A55')
-- incorrecto 
insert into pruebadef values (2,'def','PRI-1234-M55')
-- probar el default en tabla t1

insert into t1 (id,nombre,campo) values (1, 'juan')


/*Probar con store procedures globales sp_help y sp_text 
para verificar los objetos default y rule creados.*/

exec sp_help regla_isbn
exec sp_helptext regla_isbn

/* Desasignar el default */

exec sp_unbindefault 't1.campo', default_id

/* Desasignar las reglas */

exec sp_unbindrule tipo_isbn, regla_isbn

/* Borrar los objetos default y rule creados.*/

drop default default_id 
drop rule regla_isbn

/* Borrar la tabla pruebadef*/
drop table t1
drop table pruebadef 

/*Creación de VISTAS

Sobre la BD BANCOS, crear las siguientes VISTAS y nombrarlas como VISTA_XX, 
reemplazando XX por el número de la pregunta (ejemplo: VISTA_05). 
En las consultas combinadas utilizar la cláusula JOIN. 
Luego de creada la vista pruebe un select * from vista_xx */

/* Un listado alfabético de los clientes, en el que consten su apellido 
y nombre (como una sola cadena, separada con blanco, en 40 caracteres), 
nombre del sector en el que viven y el nombre del ejecutivo que tienen asignado.*/
select * from clientes
select * from sector
select * from ejecutivos 

create view vista_1 (cli,sec,eja,ejn)
as
select cast ((c.apellido+' '+c.nombre) as char(40)), nombreSector, e.apellido,
e.nombre 
from clientes c join sector s
on (c.sector = s.codSector)
join ejecutivos e
on (c.codEjecutivo = e.codEjecutivo) 

select * from vista_1

/* Para cada cliente que tenga préstamo; la información del cliente 
(misma presentación), el monto del préstamo, fecha_aproba, y saldo.*/

select * from prestamos 

create view vista_2 (cli, presm,fecha,sal)
as 
select cast ((c.apellido+' '+c.nombre) as char(40)), monto,
fecha_aproba,saldo
from clientes c join prestamos p
on (p.codCliente = c.codCliente)

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
GROUP by apellido,nombre

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
on (s.sector = ss.codsector) 

select * from vista_4 

/* Para cada sector, el número de sucursales que tiene; presente codsector, 
ubicación y nombre_sector y número de sucursales.*/

select * from sector
select * from Sucursal order by sector 

create view vista_5 (cods,ub,noms,sucur)
as
select codsector, ubicacion, nombresector, COUNT(codsucursal)
from Sector s join Sucursal su
on s.codSector = su.sector
group by codsector, ubicacion, nombresector

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
where cta.tipo= 'Ahorro' and DATEDIFF (year, fecha_Apertura,getdate()) >=1

select * from vista_6 

/* Todas las cuentas tipo “Corriente”, el numcta, la suma de los valores 
en el movimiento de crédito (tipo_mov= ´C´) en Detalle_mov_cta 
y la suma de los valores en el movimiento de débito (tipo_mov = ‘D`).*/

select * from Cuentas
select * from Detalle_Mov_Cta
order by numcta

create view vista_7 (numc,tipomov,suma)
as 
select c.numCta, tipo_Mov, SUM(valor)
from Detalle_Mov_Cta d join Cuentas c
on (c.numCta = d.numCta)
where c.tipo = 'Corriente'
group by c.numCta, tipo_Mov 

select * from vista_7

/*Lista apellido y nombre de los clientes con edades superiores a 25 años.*/

select * from Clientes 

create view vista_8 (aa,nn,edad)
as
select apellido, nombre, DATEDIFF(year, fechaNac, getdate()) 
from Clientes
where DATEDIFF(year, fechaNac, getdate()) > 25

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
on (c.sector = sector.codSector) 

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
group by e.apellido + ' '+e.nombre, nomsucursal

select * from vista_10