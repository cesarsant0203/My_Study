/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     7/23/2020 9:10:35 PM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CESTA') and o.name = 'FK_CESTA_RELATIONS_CLIENTE')
alter table CESTA
   drop constraint FK_CESTA_RELATIONS_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CESTA_LIBRO') and o.name = 'FK_CESTA_LI_RELATIONS_LIBRO')
alter table CESTA_LIBRO
   drop constraint FK_CESTA_LI_RELATIONS_LIBRO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CESTA_LIBRO') and o.name = 'FK_CESTA_LI_RELATIONS_CESTA')
alter table CESTA_LIBRO
   drop constraint FK_CESTA_LI_RELATIONS_CESTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LIBRO') and o.name = 'FK_LIBRO_RELATIONS_EDITOR')
alter table LIBRO
   drop constraint FK_LIBRO_RELATIONS_EDITOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LIBRO') and o.name = 'FK_LIBRO_RELATIONS_AUTOR')
alter table LIBRO
   drop constraint FK_LIBRO_RELATIONS_AUTOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LIBRO_ALMACEN') and o.name = 'FK_LIBRO_AL_RELATIONS_ALMACEN')
alter table LIBRO_ALMACEN
   drop constraint FK_LIBRO_AL_RELATIONS_ALMACEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LIBRO_ALMACEN') and o.name = 'FK_LIBRO_AL_RELATIONS_LIBRO')
alter table LIBRO_ALMACEN
   drop constraint FK_LIBRO_AL_RELATIONS_LIBRO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ALMACEN')
            and   type = 'U')
   drop table ALMACEN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AUTOR')
            and   type = 'U')
   drop table AUTOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CESTA')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index CESTA.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CESTA')
            and   type = 'U')
   drop table CESTA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CESTA_LIBRO')
            and   name  = 'RELATIONSHIP_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index CESTA_LIBRO.RELATIONSHIP_5_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CESTA_LIBRO')
            and   name  = 'RELATIONSHIP_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index CESTA_LIBRO.RELATIONSHIP_7_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CESTA_LIBRO')
            and   type = 'U')
   drop table CESTA_LIBRO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EDITOR')
            and   type = 'U')
   drop table EDITOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LIBRO')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index LIBRO.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LIBRO')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index LIBRO.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LIBRO')
            and   type = 'U')
   drop table LIBRO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LIBRO_ALMACEN')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index LIBRO_ALMACEN.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LIBRO_ALMACEN')
            and   name  = 'RELATIONSHIP_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index LIBRO_ALMACEN.RELATIONSHIP_6_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LIBRO_ALMACEN')
            and   type = 'U')
   drop table LIBRO_ALMACEN
go

/*==============================================================*/
/* Table: ALMACEN                                               */
/*==============================================================*/
create table ALMACEN (
   COD_ALM              char(10)             not null,
   NOMBRE_ALM           char(10)             not null,
   TELEFONO_ALM         char(10)             not null,
   constraint PK_ALMACEN primary key (COD_ALM)
)
go

/*==============================================================*/
/* Table: AUTOR                                                 */
/*==============================================================*/
create table AUTOR (
   COD_AU               char(10)             not null,
   NOMBRE_AU            char(10)             not null,
   DIRECCION_AU         char(10)             not null,
   constraint PK_AUTOR primary key (COD_AU)
)
go

/*==============================================================*/
/* Table: CESTA                                                 */
/*==============================================================*/
create table CESTA (
   COD_CLI              char(10)             not null,
   COD_CES              char(10)             not null,
   constraint PK_CESTA primary key (COD_CLI, COD_CES)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_4_FK on CESTA (COD_CLI ASC)
go

/*==============================================================*/
/* Table: CESTA_LIBRO                                           */
/*==============================================================*/
create table CESTA_LIBRO (
   ISBN_LI              char(10)             not null,
   COD_CLI              char(10)             not null,
   COD_CES              char(10)             not null,
   FECHA_REL            char(10)             not null,
   constraint PK_CESTA_LIBRO primary key (ISBN_LI, COD_CLI, COD_CES)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_7_FK on CESTA_LIBRO (COD_CLI ASC,
  COD_CES ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_5_FK on CESTA_LIBRO (ISBN_LI ASC)
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   COD_CLI              char(10)             not null,
   NOMBRE_CLI           char(10)             not null,
   TELEFONO_CLI         char(10)             not null,
   DIRECCION_CLI        char(10)             not null,
   CORREO_CLI           char(10)             not null,
   constraint PK_CLIENTE primary key (COD_CLI)
)
go

/*==============================================================*/
/* Table: EDITOR                                                */
/*==============================================================*/
create table EDITOR (
   COD_EDI              char(10)             not null,
   NOMBRE_EDI           char(10)             not null,
   DIRECCION_EDI        char(10)             not null,
   TELEFONO_EDI         char(10)             not null,
   URL_EDI              char(10)             not null,
   constraint PK_EDITOR primary key (COD_EDI)
)
go

/*==============================================================*/
/* Table: LIBRO                                                 */
/*==============================================================*/
create table LIBRO (
   ISBN_LI              char(10)             not null,
   COD_EDI              char(10)             not null,
   COD_AU               char(10)             not null,
   ANIO_LI              char(10)             not null,
   TITULO_LI            char(10)             not null,
   PRECIO_LI            char(10)             not null,
   constraint PK_LIBRO primary key (ISBN_LI)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_1_FK on LIBRO (COD_EDI ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_2_FK on LIBRO (COD_AU ASC)
go

/*==============================================================*/
/* Table: LIBRO_ALMACEN                                         */
/*==============================================================*/
create table LIBRO_ALMACEN (
   COD_ALM              char(10)             not null,
   ISBN_LI              char(10)             not null,
   constraint PK_LIBRO_ALMACEN primary key (COD_ALM, ISBN_LI)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_6_FK on LIBRO_ALMACEN (ISBN_LI ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_3_FK on LIBRO_ALMACEN (COD_ALM ASC)
go

alter table CESTA
   add constraint FK_CESTA_RELATIONS_CLIENTE foreign key (COD_CLI)
      references CLIENTE (COD_CLI)
go

alter table CESTA_LIBRO
   add constraint FK_CESTA_LI_RELATIONS_LIBRO foreign key (ISBN_LI)
      references LIBRO (ISBN_LI)
go

alter table CESTA_LIBRO
   add constraint FK_CESTA_LI_RELATIONS_CESTA foreign key (COD_CLI, COD_CES)
      references CESTA (COD_CLI, COD_CES)
go

alter table LIBRO
   add constraint FK_LIBRO_RELATIONS_EDITOR foreign key (COD_EDI)
      references EDITOR (COD_EDI)
go

alter table LIBRO
   add constraint FK_LIBRO_RELATIONS_AUTOR foreign key (COD_AU)
      references AUTOR (COD_AU)
go

alter table LIBRO_ALMACEN
   add constraint FK_LIBRO_AL_RELATIONS_ALMACEN foreign key (COD_ALM)
      references ALMACEN (COD_ALM)
go

alter table LIBRO_ALMACEN
   add constraint FK_LIBRO_AL_RELATIONS_LIBRO foreign key (ISBN_LI)
      references LIBRO (ISBN_LI)
go
select * from LIBRO;
