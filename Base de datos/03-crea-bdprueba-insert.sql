/*

BASES DE DATOS 

* CREACION DE LA BASE DE DATOS PRUEBA 
  Incluye inserción de registros en las tablas
  
*/

use master
go

drop database BDPRUEBA
go 

create database BDPRUEBA
go

use BDPRUEBA
go

/*  Se crean las tablas declarando el constraint de primary key 
 luego de la descripción del campo.
 Los constraint de foreitn key también se incluyen en la declaración
 de la tabla, luego de la lista de campos. 

*/

create table departamentos(
CodDepar smallint primary key, 
NomDepar varchar(30), 
piso tinyint);
go

create table cargos (
CodCargo int primary key, 
nomCargo varchar(30), 
sueldomax money);
go

create table empleados (
CodEmple int primary key, 
cedula varchar(10) unique, 
nombre varchar(50),
apellido varchar(50), 
fechaingreso date, 
sueldo money, 
cargo int references cargos(CodCargo),
departamento smallint references departamentos(CodDepar));
go 


/*nombre_DB.nombre_esquema.nombre_tabla*/


/*  Se muestra algunos usos para el alter table */

alter table departamentos add edificio varchar(20);
alter table cargos add fecha_creacion date;
alter table cargos add constraint uniq_nomcargo unique(nomcargo);
alter table empleados add constraint fecha_actual default getdate() for fechaingreso;

---- insertar registros

/* Un ejemplo de inserción escribiendo todos los registros entre () separados por comas */

insert into departamentos values (1,'RRHH', 1, 'GIRON'), (2,'COMERCIALIZACION', 6, 'FONTANA'), (3,'FINANCIERO', 2, 'GIRON'), 
(4,'RELACIONES PUBLICAS', 4, 'FONTANA'), (5,'MARKETING', 2, 'RIO');

go
select * from departamentos
go

--Establece el formato para ingreso de fechas aaaa/mm/dd

set dateformat ymd
go

insert into cargos values(100,'GERENTE', $3800, '2002/01/01');
insert into cargos values(200,'ASISTENTE JUNIOR', $800, '2003/01/01')
insert into cargos values(300,'SECRETARIA EJECUTIVA', $500, '2003/06/01')
insert into cargos values(400,'JEFE DE SISTEMAS', $1500, '2002/05/01')
insert into cargos values(500,'ANALISTA', $700, '2004/07/01')

go
select * from cargos
go


insert into empleados values(1,'1001345678','JUAN','PEREZ','2004/01/01',$2000,100,1)
insert into empleados values(2,'1899995678','MARIA','PAZ','2004/02/01',$380,300,1)
insert into empleados values(3,'1612995678','PEDRO','LOPEZ','2005/03/01',$680,200,1)
insert into empleados values(4,'0801345672','MILTON','ANDRADE','2004/01/01',$2300,100,2)
insert into empleados values(5,'0799455674','LETICIA','MERA','2004/02/01',$400,300,2)
insert into empleados values(6,'1612395675','SARA','GARCOA','2003/03/01',$1200,400,3)
insert into empleados values(7,'1123234534','PABLO','RAMIREZ','2002/03/01',$2400,100,3)
insert into empleados values(8,'0934234456','MONICA','PALACIOS','2004/03/01',$600,500,3)
insert into empleados values(9,'0567834223','ANDRES','RAMOS','2002/03/01',$1600,100,4)
insert into empleados values(10,'0123434679','MARTHA','BENAVIDES','2005/03/01',$490,300,4)
insert into empleados values(11,'1723438764','ANDREA','CASTRO','2005/02/01',$490,300,5)
insert into empleados values(12,'1847343872','ANITA','SUAREZ','2005/02/01',$300,300,5)
insert into empleados values(13,'0976825341','SILVIA','ANDRADE','2003/11/01',$2300,100,5)
insert into empleados values(14,'1701303674','MARIA','PAREDES','2004/02/01',$400,300,2)
go
select * from empleados
go

insert into empleados (CodEmple,cedula, nombre, apellido,sueldo,cargo,departamento)
values(15,'1701304774','MARIA','PORTILLA',$400,500,2)
go