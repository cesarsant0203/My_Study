/*	
   BASES DE DATOS
   Ing. Rosa Navarrete							    */
/* SCRIPT DE CREACIÓN DE LA BASE DE DATOS BANCOS	*/
/* INCLUYE INSERCIÓN DE REGISTROS					*/
/*													*/

USE MASTER
GO

drop database banco;

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


SELECT * FROM DETALLE_PRESTAMOS


