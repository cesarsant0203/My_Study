/* -------------------------------------
Ingenieria en Software
Cesar Santacruz
Lizbeth Santamaria
Adriana Enriquez
*/--------------------------------------

USE MASTER
GO

/*1.	Crear una base de datos llamada BDPROYECTOS.*/

CREATE DATABASE BDPROYECTOS;
GO

DROP DATABASE BDPROYECTOS; 
GO

USE BDPROYECTOS;
GO

/*2.	En BDPROYECTOS crear las siguientes tablas:
PROYECTOS, codProy (int) que debe ser de tipo IDENTITY) primary key y descProy (varchar 30)

CARGOS, codCargo (char (5)) primary key, nomCargo varchar (30) y sueldo money 
PERSONAS, cédula (char (10) primary key, apellidos varchar (20) y nombres (varchar(20)), fecha_nac (date), reporta_a char (10), codProy, codCargo.	
La creación de las tablas debe incluir las foreign key de PERSONAS a PROYECTOS y CARGOS.
*/

CREATE TABLE PROYECTOS 
(CodProy int IDENTITY PRIMARY KEY, 
DescProy varchar(30));

CREATE TABLE CARGOS 
(CodCargo char(5) PRIMARY KEY, 
NomCargo varchar(30),
Sueldo money
);

CREATE TABLE CARGO
(CodCargo char(5) PRIMARY KEY, 
NomCargo varchar(30),
Sueldo money
);

create table holitaw
(CodCargo char(5) , 
NomCargo varchar(30),
Sueldo money
PRIMARY KEY (CodCargo,sueldo)
);
select * from holitas

CREATE TABLE PERSONAS 
(Cedula char(10) PRIMARY KEY, 
Apellidos varchar(20),
Nombres varchar(20),
Fecha_nac date,
Reporta_a char(10),
CodProy int FOREIGN KEY REFERENCES PROYECTOS,
CodCargo char(5) FOREIGN KEY REFERENCES CARGOS
);

/*3.	El campo codCargo tiene un check con el siguiente patrón:  dos caracteres alfabéticos entre A..F seguido por tres caracteres dígitos.*/
DROP TABLE CARGOS

CREATE TABLE CARGOS 
(CodCargo char(5) PRIMARY KEY CHECK (CodCargo like '[A-F][A-F][0-9][0-9][0-9]'), 
NomCargo varchar(30),
Sueldo money
);

EXEC sp_help CARGOS;
/* 4.	Use ALTER TABLE para agregar el campo "presupuesto" de tipo money, a la tabla PROYECTOS.*/

ALTER TABLE PROYECTOS ADD Presupuesto money; 
GO
SELECT * FROM PROYECTOS;
-- terminaria siendo lo mismo que tener
DROP TABLE PROYECTOS
CREATE TABLE PROYECTOS 
(CodProy int IDENTITY PRIMARY KEY, 
DescProy varchar(30),
Presupuesto money
);
/*5.	Use ALTER TABLE para agregar CONSTRAINT de cláve foránea a la tabla PERSONAS, del campo reporta_a hacia el campo cedula (es una referencia recursiva).*/

ALTER TABLE PERSONAS ADD CONSTRAINT FK_Reporta_a FOREIGN KEY (Reporta_a) REFERENCES PERSONAS(cedula);
EXEC sp_help PERSONAS;
/* 6.	Inserte SEIS registros de prueba en las tablas PROYECTOS, CUATRO registros de prueba en la tabla CARGOS y SEIS registros de prueba en la tabla PERSONAS. */

insert into PROYECTOS (DescProy,Presupuesto)values('Proyecto de ciencias',$12000);
insert into PROYECTOS (DescProy,Presupuesto)values('Proyecto de artes',$5000);
insert into PROYECTOS (DescProy,Presupuesto)values('Proyecto de mate',$7000);
insert into PROYECTOS (DescProy,Presupuesto)values('Proyecto extracurricular',$400);
insert into PROYECTOS (DescProy,Presupuesto)values('Proyecto olvidado',$3460);
insert into PROYECTOS (DescProy,Presupuesto)values('Proyecto confidencial',$100000);
SELECT * FROM PROYECTOS;

insert into CARGOS values('AA123','Jefe',$4000);
insert into CARGOS values('CC124','Director',$2000);
insert into CARGOS values('DD125','Empleado',$400);
insert into CARGOS values('FF126','Investigador',$3500);
SELECT * FROM CARGOS;

insert CARGO values('AA123','Jefe',$4000);

insert CARGO values('AA123','Jefe',$4000);
insert CARGO values('CC124','Director',$2000);
insert into CARGOS values('DD125','Empleado',$400);
insert into CARGOS values('FF126','Investigador',$3500);
SELECT * FROM CARGO;
set dateformat ymd
go
insert into PERSONAS values('1723531017','Polainas Perez','Pepe Pino', '2002/01/01',NULL,1,'AA123');
insert into PERSONAS values('1723033175','Santamaria Herrera','Lizbeth Adriana','2000/09/02','1723531017',6,'FF126');
insert into PERSONAS values('1723021734','Santacruz Portilla','Cesar Joel','2000/08/27','1723531017',6,'FF126');
insert into PERSONAS values('1723601873','Espinoza Navo','Juan Esdulfo','1999/01/21','1723531017',1,'DD125');
insert into PERSONAS values('1723632573','Enriquez','Adriana','2000/04/19','1723531017',1,'DD125');
insert into PERSONAS values('0422452873','Paredes Navo','Armando Antonio','1996/09/01','1723531017',2,'CC124');
SELECT * FROM PERSONAS;

/* 7.	Use UPDATE para subir un 10% al PRESUPUESTO de los proyectos que tengan un presupuesto < $10000. */

UPDATE PROYECTOS
SET Presupuesto = Presupuesto*1.1
WHERE Presupuesto < $10000;
go
SELECT * FROM PROYECTOS;

/* 8.	Borre un registro de la tabla PROYECTOS (tome en cuenta que el registro que elija pueda borrarse, es decir no esté referenciado en una FK). */

-- borra todo el registro que coincida
DELETE FROM PROYECTOS WHERE DescProy='Proyecto de mate';
SELECT * FROM PROYECTOS;
