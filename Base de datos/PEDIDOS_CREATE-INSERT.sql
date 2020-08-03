/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     28/06/2020 19:03:12                          */
/*==============================================================*/

USE MASTER
GO

DROP DATABASE PEDIDOS
GO

CREATE DATABASE PEDIDOS
GO

USE PEDIDOS 
GO

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_ORDENES') and o.name = 'FK_DETALLE__FK_DETALL_ORDENES')
alter table DETALLE_ORDENES
   drop constraint FK_DETALLE__FK_DETALL_ORDENES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_ORDENES') and o.name = 'FK_DETALLE__FK_DETALL_PRODUCTO')
alter table DETALLE_ORDENES
   drop constraint FK_DETALLE__FK_DETALL_PRODUCTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EMPLEADOS') and o.name = 'FK_EMPLEADO_REPORTA_A_EMPLEADO')
alter table EMPLEADOS
   drop constraint FK_EMPLEADO_REPORTA_A_EMPLEADO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ORDENES') and o.name = 'FK_ORDENES_FK_ORDENE_CLIENTES')
alter table ORDENES
   drop constraint FK_ORDENES_FK_ORDENE_CLIENTES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ORDENES') and o.name = 'FK_ORDENES_FK_ORDENE_EMPLEADO')
alter table ORDENES
   drop constraint FK_ORDENES_FK_ORDENE_EMPLEADO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTOS') and o.name = 'FK_PRODUCTO_FK_PRODUC_CATEGORI')
alter table PRODUCTOS
   drop constraint FK_PRODUCTO_FK_PRODUC_CATEGORI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTOS') and o.name = 'FK_PRODUCTO_FK_PRODUC_PROVEEDO')
alter table PRODUCTOS
   drop constraint FK_PRODUCTO_FK_PRODUC_PROVEEDO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CATEGORIAS')
            and   type = 'U')
   drop table CATEGORIAS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTES')
            and   type = 'U')
   drop table CLIENTES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_ORDENES')
            and   name  = 'FK_DETALLE__PROD_DETA_PRODUCTO_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_ORDENES.FK_DETALLE__PROD_DETA_PRODUCTO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_ORDENES')
            and   name  = 'FK_DETALLE__ORDEN_DET_ORDENES_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_ORDENES.FK_DETALLE__ORDEN_DET_ORDENES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLE_ORDENES')
            and   type = 'U')
   drop table DETALLE_ORDENES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EMPLEADOS')
            and   name  = 'REPORTA_A_FK'
            and   indid > 0
            and   indid < 255)
   drop index EMPLEADOS.REPORTA_A_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPLEADOS')
            and   type = 'U')
   drop table EMPLEADOS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ORDENES')
            and   name  = 'FK_ORDENES_EMPLE_ORD_EMPLEADO_FK'
            and   indid > 0
            and   indid < 255)
   drop index ORDENES.FK_ORDENES_EMPLE_ORD_EMPLEADO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ORDENES')
            and   name  = 'FK_ORDENES_CLIEN_ORD_CLIENTES_FK'
            and   indid > 0
            and   indid < 255)
   drop index ORDENES.FK_ORDENES_CLIEN_ORD_CLIENTES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ORDENES')
            and   type = 'U')
   drop table ORDENES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTOS')
            and   name  = 'FK_PRODUCTO_PROV_PROD_PROVEEDO_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTOS.FK_PRODUCTO_PROV_PROD_PROVEEDO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTOS')
            and   name  = 'FK_PRODUCTO_CATE_PROD_CATEGORI_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTOS.FK_PRODUCTO_CATE_PROD_CATEGORI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCTOS')
            and   type = 'U')
   drop table PRODUCTOS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROVEEDORES')
            and   type = 'U')
   drop table PROVEEDORES
go

/*==============================================================*/
/* Table: CATEGORIAS                                            */
/*==============================================================*/
create table CATEGORIAS (
   CATEGORIAID          int                  not null,
   NOMBRECAT            char(50)             not null,
   constraint PK_CATEGORIAS primary key nonclustered (CATEGORIAID)
)
go
SELECT * FROM CATEGORIAS

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES (
   CLIENTEID            int                  not null,
   CEDULA_RUC           char(10)             not null,
   NOMBRECIA            char(30)             not null,
   NOMBRECONTACTO       char(50)             not null,
   DIRECCIONCLI         char(50)             not null,
   FAX                  char(12)             null,
   EMAIL                char(50)             null,
   CELULAR              char(12)             null,
   FIJO                 char(12)             null,
   constraint PK_CLIENTES primary key nonclustered (CLIENTEID)
)
go

/*==============================================================*/
/* Table: DETALLE_ORDENES                                       */
/*==============================================================*/
create table DETALLE_ORDENES (
   ORDENID              int                  not null,
   DETALLEID            int                  not null,
   PRODUCTOID           int                  not null,
   CANTIDAD             int                  not null,
   constraint PK_DETALLE_ORDENES primary key nonclustered (ORDENID, DETALLEID)
)
go

/*==============================================================*/
/* Index: FK_DETALLE__ORDEN_DET_ORDENES_FK                      */
/*==============================================================*/
create index FK_DETALLE__ORDEN_DET_ORDENES_FK on DETALLE_ORDENES (
ORDENID ASC
)
go

/*==============================================================*/
/* Index: FK_DETALLE__PROD_DETA_PRODUCTO_FK                     */
/*==============================================================*/
create index FK_DETALLE__PROD_DETA_PRODUCTO_FK on DETALLE_ORDENES (
PRODUCTOID ASC
)
go

/*==============================================================*/
/* Table: EMPLEADOS                                             */
/*==============================================================*/
create table EMPLEADOS (
   EMPLEADOID           int                  not null,
   REPORTA_A		    int                  null,
   NOMBRE               char(30)             null,
   APELLIDO             char(30)             null,
   FECHA_NAC            datetime             null,
   EXTENSION            int                  null,
   constraint PK_EMPLEADOS primary key nonclustered (EMPLEADOID)
)
go

/*==============================================================*/
/* Index: REPORTA_A_FK                                          */
/*==============================================================*/
create index REPORTA_A_FK on EMPLEADOS (
REPORTA_A ASC
)
go

/*==============================================================*/
/* Table: ORDENES                                               */
/*==============================================================*/
create table ORDENES (
   ORDENID              int                  not null,
   CLIENTEID            int                  not null,
   EMPLEADOID           int                  not null,
   FECHAORDEN           datetime             not null,
   DESCUENTO            int                  null,
   constraint PK_ORDENES primary key nonclustered (ORDENID)
)
go

/*==============================================================*/
/* Index: FK_ORDENES_CLIEN_ORD_CLIENTES_FK                      */
/*==============================================================*/
create index FK_ORDENES_CLIEN_ORD_CLIENTES_FK on ORDENES (
CLIENTEID ASC
)
go

/*==============================================================*/
/* Index: FK_ORDENES_EMPLE_ORD_EMPLEADO_FK                      */
/*==============================================================*/
create index FK_ORDENES_EMPLE_ORD_EMPLEADO_FK on ORDENES (
EMPLEADOID ASC
)
go

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   PRODUCTOID           int                  not null,
   CATEGORIAID          int                  not null,
   PROVEEDORID          int                  not null,
   DESCRIPCION          char(50)             null,
   PRECIOUNIT           money                not null,
   EXISTENCIA           int                  not null,
   constraint PK_PRODUCTOS primary key nonclustered (PRODUCTOID)
)
go

/*==============================================================*/
/* Index: FK_PRODUCTO_CATE_PROD_CATEGORI_FK                     */
/*==============================================================*/
create index FK_PRODUCTO_CATE_PROD_CATEGORI_FK on PRODUCTOS (
CATEGORIAID ASC
)
go

/*==============================================================*/
/* Index: FK_PRODUCTO_PROV_PROD_PROVEEDO_FK                     */
/*==============================================================*/
create index FK_PRODUCTO_PROV_PROD_PROVEEDO_FK on PRODUCTOS (
PROVEEDORID ASC
)
go

/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES (
   PROVEEDORID          int                  not null,
   NOMBREPROV           char(50)             not null,
   CONTACTO             char(50)             not null,
   CELUPROV             char(12)             null,
   FIJOPROV             char(12)             null,
   constraint PK_PROVEEDORES primary key nonclustered (PROVEEDORID)
)
go

alter table DETALLE_ORDENES
   add constraint FK_DETALLE__FK_DETALL_ORDENES foreign key (ORDENID)
      references ORDENES (ORDENID)
go

alter table DETALLE_ORDENES
   add constraint FK_DETALLE__FK_DETALL_PRODUCTO foreign key (PRODUCTOID)
      references PRODUCTOS (PRODUCTOID)
go

alter table EMPLEADOS
   add constraint FK_EMPLEADO_REPORTA_A_EMPLEADO foreign key (REPORTA_A)
      references EMPLEADOS (EMPLEADOID)
go

alter table ORDENES
   add constraint FK_ORDENES_FK_ORDENE_CLIENTES foreign key (CLIENTEID)
      references CLIENTES (CLIENTEID)
go

alter table ORDENES
   add constraint FK_ORDENES_FK_ORDENE_EMPLEADO foreign key (EMPLEADOID)
      references EMPLEADOS (EMPLEADOID)
go

alter table PRODUCTOS
   add constraint FK_PRODUCTO_FK_PRODUC_CATEGORI foreign key (CATEGORIAID)
      references CATEGORIAS (CATEGORIAID)
go

alter table PRODUCTOS
   add constraint FK_PRODUCTO_FK_PRODUC_PROVEEDO foreign key (PROVEEDORID)
      references PROVEEDORES (PROVEEDORID)
go

use PEDIDOS
go


insert into categorias (categoriaid, nombrecat) values (100, 'CARNICOS')
insert into categorias (categoriaid, nombrecat) values (200, 'LACTEOS')
insert into categorias (categoriaid, nombrecat) values (300, 'LIMPIEZA')
insert into categorias (categoriaid, nombrecat) values (400, 'HIGINE PERSONAL')
insert into categorias (categoriaid, nombrecat) values (500, 'MEDICINAS')
insert into categorias (categoriaid, nombrecat) values (600, 'COSMETICOS')
insert into categorias (categoriaid, nombrecat) values (700, 'REVISTAS')

SELECT * FROM CATEGORIAS

insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values 
(10, 'DON DIEGO', 'MANUEL ANDRADE', '099234567','2124456')
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values 
(20, 'PRONACA', 'JUAN PEREZ', '0923434467','2124456')
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values 
(30, 'TONY', 'JORGE BRITO', '099234567','2124456')
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values 
(40, 'MIRAFLORES', 'MARIA PAZ', '098124498','2458799')
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values 
(50, 'ALMAY', 'PEDRO GONZALEZ', '097654567','2507190')
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values 
(60, 'REVLON', 'MONICA SALAS', '099245678','2609876')
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values 
(70, 'YANBAL', 'BETY ARIAS', '098124458','2450887')
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values 
(120, 'JURIS', 'MANUEL ANDRADE', '099234567','2124456')
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values 
(80, 'CLEANER', 'MANUEL ANDRADE', '099234567','2124456')
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values 
(90, 'BAYER', 'MANUEL ANDRADE', '099234567','2124456')
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values 
(110, 'PALMOLIVE', 'MANUEL ANDRADE', '099234567','2124456')


SELECT * FROM PROVEEDORES

INSERT INTO PRODUCTOS VALUES (1,100,10,'SALCHICHAS VIENESAS',$2.60,200);
INSERT INTO PRODUCTOS VALUES (2,100,10,'SALAMI DE AJO',$3.60,300);
INSERT INTO PRODUCTOS VALUES (3,100,10,'BOTON PARA ASADO',$4.70,400);
INSERT INTO PRODUCTOS VALUES (4,100,20,'SALCHICHAS DE POLLO',$2.90,200);
INSERT INTO PRODUCTOS VALUES (5,100,20,'JAMON DE POLLO',$2.80,100);
INSERT INTO PRODUCTOS VALUES (6,200,30,'YOGURT NATURAL',$4.30,80);
INSERT INTO PRODUCTOS VALUES (7,200,30,'LECHE CHOCOLATE',$1.60,90);
INSERT INTO PRODUCTOS VALUES (8,200,40,'YOGURT DE SABORES',$1.60,200);
INSERT INTO PRODUCTOS VALUES (9,200,40,'CREMA DE LECHE',$3.60,30);
INSERT INTO PRODUCTOS VALUES (10,600,50,'BASE DE MAQUILLAJE',$14.70,40);
INSERT INTO PRODUCTOS VALUES (11,600,50,'RIMMEL',$12.90,20);
INSERT INTO PRODUCTOS VALUES (13,600,60,'SOMBRA DE OJOS',$9.80,100);

SELECT * FROM PRODUCTOS

/* Se utiliza la sentencia
set dateformat dmy
Para asegurar que el valor de la cadena correspondiente al campo de tipo fecha, 
se interprete como día/mes/año */

set dateformat dmy

INSERT INTO EMPLEADOS VALUES (1,null,'JUAN', 'CRUZ', '18/01/67',231)
INSERT INTO EMPLEADOS VALUES (2,1,'MARIO', 'SANCHEZ', '01/03/79',144)
INSERT INTO EMPLEADOS VALUES (3,1,'VERONICA', 'ARIAS', '23/06/77',234)
INSERT INTO EMPLEADOS VALUES (4,2,'PABLO', 'CELY', '28/01/77',567)
INSERT INTO EMPLEADOS VALUES (5,2,'DIEGO', 'ANDRADE', '15/05/70',890)
INSERT INTO EMPLEADOS VALUES (6,3,'JUAN', 'ANDRADE', '17/11/76',230)
INSERT INTO EMPLEADOS VALUES (7,3,'MARIA', 'NOBOA', '21/12/79',261)

SELECT * FROM EMPLEADOS

INSERT INTO CLIENTES VALUES (1,'1890786576','SUPERMERCADO ESTRELLA','JUAN ALBAN','AV.AMAZONAS',NULL,NULL,NULL,NULL)
INSERT INTO CLIENTES VALUES (2,'1298765477','EL ROSADO','MARIA CORDERO','AV.AEL INCA',NULL,NULL,NULL,NULL)
INSERT INTO CLIENTES VALUES (3,'1009876567','DISTRIBUIDORA PRENSA','PEDRO PINTO','EL PINAR',NULL,NULL,NULL,NULL)
INSERT INTO CLIENTES VALUES (4,'1876090006','SU TIENDA','PABLO PONCE','AV.AMAZONAS',NULL,NULL,NULL,NULL)
INSERT INTO CLIENTES VALUES (5,'1893456776','SUPERMERCADO DORADO','LORENA PAZ','AV.6 DICIEMBRE',NULL,NULL,NULL,NULL)
INSERT INTO CLIENTES VALUES (6,'1678999891','MI COMISARIATO','ROSARIO UTRERAS','AV.AMAZONAS',NULL,NULL,NULL,NULL)
INSERT INTO CLIENTES VALUES (7,'1244567888','SUPERMERCADO DESCUENTO','LETICIA ORTEGA','AV.LA PRENSA',NULL,NULL,NULL,NULL)
INSERT INTO CLIENTES VALUES (8,'1456799022','EL DESCUENTO','JUAN TORRES','AV.PATRIA',NULL,NULL,NULL,NULL)
INSERT INTO CLIENTES VALUES (9,'1845677777','DE LUISE','JORGE PARRA','AV.AMAZONAS',NULL,NULL,NULL,NULL)
INSERT INTO CLIENTES VALUES (10,'183445667','YARBANTRELLA','PABLO POLIT','AV.REPUBLICA',NULL,NULL,NULL,NULL)

SELECT * FROM CLIENTES

INSERT INTO ORDENES VALUES(1,3,4,'17/06/07', 5)
INSERT INTO ORDENES VALUES(2,3,4,'02/06/07', 10)
INSERT INTO ORDENES VALUES(3,4,5,'05/06/07', 6)
INSERT INTO ORDENES VALUES(4,2,6,'06/06/07', 2)
INSERT INTO ORDENES VALUES(5,2,7,'09/06/07', NULL)
INSERT INTO ORDENES VALUES(6,4,5,'12/06/07', 10)
INSERT INTO ORDENES VALUES(7,2,5,'14/06/07', 10)
INSERT INTO ORDENES VALUES(8,3,2,'13/06/07', 10)
INSERT INTO ORDENES VALUES(9,3,2,'17/06/07', 3)
INSERT INTO ORDENES VALUES(10,2,2,'18/06/07', 2)

SELECT * FROM ORDENES

insert into detalle_ordenes values(1,1,1,2)
insert into detalle_ordenes values(1,2,4,1)
insert into detalle_ordenes values(1,3,6,1)
insert into detalle_ordenes values(1,4,9,1)

insert into detalle_ordenes values(2,1,10,10)
insert into detalle_ordenes values(2,2,13,20)
insert into detalle_ordenes values(3,1,3,10)
insert into detalle_ordenes values(4,1,9,12)

insert into detalle_ordenes values(5,1,1,14)
insert into detalle_ordenes values(5,2,4,20)
insert into detalle_ordenes values(6,1,3,12)
insert into detalle_ordenes values(7,1,11,10)

insert into detalle_ordenes values(8,1,2,10)
insert into detalle_ordenes values(8,2,5,14)
insert into detalle_ordenes values(8,3,7,10)
insert into detalle_ordenes values(9,1,11,10)

insert into detalle_ordenes values(10,1,1,5)

SELECT * FROM DETALLE_ORDENES