/*==============================================================*/
/* PROYECTO FINAL DDB                                           */
/* CESAR SANTACRUZ, LIZBETH SANTAMARIA                          */
/*==============================================================*/


alter table ACCIDENTE_AUTO
   drop constraint FK_ACCIDENT_ACCIDENTE_AUTO;

alter table ACCIDENTE_AUTO
   drop constraint FK_ACCIDENT_ACCIDENTE_ACCIDENT;

alter table AUTO
   drop constraint FK_AUTO_CLIENTE_A_CLIENTE;

alter table POLIZA
   drop constraint FK_POLIZA_POLIZA_AU_AUTO;

alter table PRIMA
   drop constraint FK_PRIMA_POLIZA_PR_POLIZA;

drop table ACCIDENTE cascade constraints;

drop index ACCIDENTE_AUTO_FK;

drop index ACCIDENTE_AUTO2_FK;

drop table ACCIDENTE_AUTO cascade constraints;

drop index CLIENTE_AUTO_FK;

drop table AUTO cascade constraints;

drop table CLIENTE cascade constraints;

drop index POLIZA_AUTO_FK;

drop table POLIZA cascade constraints;

drop index POLIZA_PRIMA_FK;

drop table PRIMA cascade constraints;

/*==============================================================*/
/* Table: ACCIDENTE                                             */
/*==============================================================*/
create table ACCIDENTE (
   ACC_NUMREPORTE       INTEGER               not null,
   ACC_FECHA            DATE                  not null,
   ACC_DESCRIPCION      CHAR(250),
   constraint PK_ACCIDENTE primary key (ACC_NUMREPORTE)
);

/*==============================================================*/
/* Table: ACCIDENTE_AUTO                                        */
/*==============================================================*/
create table ACCIDENTE_AUTO (
   AUT_PLACA            CHAR(6)               not null,
   ACC_NUMREPORTE       INTEGER               not null,
   constraint PK_ACCIDENTE_AUTO primary key (AUT_PLACA, ACC_NUMREPORTE)
);
/*==============================================================*/
/* Table: TIPO_ACCIDENTE                                        */
/*==============================================================*/
create table TIPO_ACCIDENTE (
   AUT_PLACA            CHAR(6)               not null,
   DETALLE              CHAR(30)              not null,
   constraint PK_TIPO_ACCIDENTE primary key (AUT_PLACA)
);

/*==============================================================*/
/* Index: ACCIDENTE_AUTO2_FK                                    */
/*==============================================================*/
create index ACCIDENTE_AUTO2_FK on ACCIDENTE_AUTO (
   ACC_NUMREPORTE ASC
);

/*==============================================================*/
/* Index: ACCIDENTE_AUTO_FK                                     */
/*==============================================================*/
create index ACCIDENTE_AUTO_FK on ACCIDENTE_AUTO (
   AUT_PLACA ASC
);

/*==============================================================*/
/* Table: AUTO                                                  */
/*==============================================================*/
create table AUTO (
   AUT_PLACA            CHAR(6)               not null,
   CLI_CED              CHAR(10)              not null,
   AUT_CHASIS           CHAR(12)              not null,
   AUT_MARCA            CHAR(20)              not null,
   AUT_MODELO           CHAR(30),
   AUT_COLOR            CHAR(20),
   constraint PK_AUTO primary key (AUT_PLACA)
);

/*==============================================================*/
/* Index: CLIENTE_AUTO_FK                                       */
/*==============================================================*/
create index CLIENTE_AUTO_FK on AUTO (
   CLI_CED ASC
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CLI_CED              CHAR(10)              not null,
   CLI_NOM              CHAR(30)              not null,
   CLI_APE              CHAR(30)              not null,
   CLI_DIREC            CHAR(50),
   constraint PK_CLIENTE primary key (CLI_CED)
);

/*==============================================================*/
/* Table: POLIZA                                                */
/*==============================================================*/
create table POLIZA (
   POLIZ_NUMCONTRATO    INTEGER               not null,
   AUT_PLACA            CHAR(6)               not null,
   POLIZ_TIPO           CHAR(30)              not null,
   constraint PK_POLIZA primary key (POLIZ_NUMCONTRATO)
);

/*==============================================================*/
/* Index: POLIZA_AUTO_FK                                        */
/*==============================================================*/
create index POLIZA_AUTO_FK on POLIZA (
   AUT_PLACA ASC
);

/*==============================================================*/
/* Table: PRIMA                                                 */
/*==============================================================*/
create table PRIMA (
   PRIMA_NUM            INTEGER               not null,
   POLIZ_NUMCONTRATO    INTEGER               not null,
   PRIMA_FECHAVENCE     DATE                  not null,
   PRIMA_MONTO          NUMBER(12,2)          not null,
   PRIMA_FECHAPAGO      NUMBER(12,2)          not null,
   constraint PK_PRIMA primary key (PRIMA_NUM)
);

/*==============================================================*/
/* Index: POLIZA_PRIMA_FK                                       */
/*==============================================================*/
create index POLIZA_PRIMA_FK on PRIMA (
   POLIZ_NUMCONTRATO ASC
);

/*==============================================================*/
/* Constraints                                                  */
/*==============================================================*/
alter table ACCIDENTE_AUTO
   add constraint FK_ACCIDENT_ACCIDENTE_AUTO foreign key (AUT_PLACA)
      references AUTO (AUT_PLACA);

alter table ACCIDENTE_AUTO
   add constraint FK_ACCIDENT_ACCIDENTE_ACCIDENT foreign key (ACC_NUMREPORTE)
      references ACCIDENTE (ACC_NUMREPORTE);

alter table AUTO
   add constraint FK_AUTO_CLIENTE_A_CLIENTE foreign key (CLI_CED)
      references CLIENTE (CLI_CED);

alter table POLIZA
   add constraint FK_POLIZA_POLIZA_AU_AUTO foreign key (AUT_PLACA)
      references AUTO (AUT_PLACA);

alter table PRIMA
   add constraint FK_PRIMA_POLIZA_PR_POLIZA foreign key (POLIZ_NUMCONTRATO)
      references POLIZA (POLIZ_NUMCONTRATO);

alter table cliente
add CHECK (CLI_DIREC='Quito');

alter table AUTO
add CHECK (aut_color='Rojo');

alter table poliza
add CHECK (POLIZ_TIPO='PREMIUM');

alter table prima
add CHECK (PRIMA_MONTO>= 800);
      
/*==============================================================*/
/* Insert: Clientes                                              */
/*==============================================================*/
insert into CLIENTE values ('1723521017','Cesar','Santacruz','Quito');
insert into CLIENTE values ('1724634243','Marco','Polo','Quito');
insert into CLIENTE values ('1723242755','Juan','Salazar','Quito');
insert into CLIENTE values ('1743223424','Domenica','Mino','Quito');
insert into CLIENTE values ('1732413443','Andrew','Reyes','Quito');

select * from cliente;

/*==============================================================*/
/* Insert: Autos                                                */
/*==============================================================*/
insert into AUTO values ('PBL123','1723521017','ASD32A3G8S3D','TESLA','MODEL S','Rojo');
insert into AUTO values ('PCB456','1724634243','ASD32A3FE3F3','CHEVY','BEAT','Rojo');
insert into AUTO values ('PPD432','1723242755','ASFDF9AS7DF7','CHEVY','SAIL','Rojo');
insert into AUTO values ('PCC234','1743223424','F7G9DF7GDDFG','NISSAN','XTRAIL','Rojo');
insert into AUTO values ('PCS203','1732413442','DFGD96DGDFG7','FORD','F150','Rojo');

select * from auto;

/*==============================================================*/
/* Insert: Polizas                                              */
/*==============================================================*/
insert into POLIZA values(1,'PBL123','PREMIUM');
insert into POLIZA values(2,'PCB456','PREMIUM');
insert into POLIZA values(3,'PPD432','PREMIUM');
insert into POLIZA values(4,'PCC234','PREMIUM');
insert into POLIZA values(5,'PCS203','PREMIUM');

select * from poliza;

/*==============================================================*/
/* Insert: Primas                                               */
/*==============================================================*/
insert into PRIMA values (1,1,TO_DATE('2020/03/28', 'yyyy/mm/dd'),800.00,300.50);
insert into PRIMA values (2,2,TO_DATE('2019/04/14', 'yyyy/mm/dd'),1400.00,500.00);
insert into PRIMA values (3,3,TO_DATE('2021/01/25', 'yyyy/mm/dd'),8000.00,3000.00);
insert into PRIMA values (4,4,TO_DATE('2018/01/28', 'yyyy/mm/dd'),12200.00,2199.99);
insert into PRIMA values (5,5,TO_DATE('2021/02/02', 'yyyy/mm/dd'),1500.00,31.00);

select * from prima;

/*==============================================================*/
/* Table: POLIZA                                                */
/*==============================================================*/
create table AUDITORIA_MASTER
  (user_name varchar2(20),
    fecha date,
    tipo_operacion varchar2(1),
    nombre_table varchar2(30),
    anterior varchar2(800),
    nuevo varchar2(800));
    

/*==============================================================*/
/* Triggers                                                     */
/*==============================================================*/
CREATE OR REPLACE TRIGGER audit_master_cliente
AFTER DELETE OR INSERT OR UPDATE ON CLIENTE
FOR EACH ROW
declare 
 v_op       varchar2(1);
 v_tabla varchar2(20);
 v_anterior varchar2(200);
 v_nuevo varchar2(200);
BEGIN
v_tabla :='CLIENTE';
if inserting then
 v_op := 'I';
 elsif updating then
 v_op := 'U';
 elsif deleting then
  v_op := 'D';
end if;
 v_anterior:=:OLD.CLI_CED ||'|'||:OLD.CLI_NOM||'|'||:OLD.CLI_APE||'|'||:OLD.CLI_DIREC;
 v_nuevo:= :OLD.CLI_CED ||'|'||:NEW.CLI_NOM||'|'||:NEW.CLI_APE||'|'||:NEW.CLI_DIREC;
  INSERT INTO AUDITORIA_MASTER(user_name, fecha, tipo_operacion, nombre_table,
    anterior,nuevo)
     VALUES (USER, SYSDATE,v_op,v_tabla, v_anterior,v_nuevo
     );
END;
/

CREATE OR REPLACE TRIGGER audit_master_auto
AFTER DELETE OR INSERT OR UPDATE ON AUTO
FOR EACH ROW
declare 
 v_op       varchar2(1);
 v_tabla varchar2(20);
 v_anterior varchar2(200);
 v_nuevo varchar2(200);
BEGIN
v_tabla :='AUTO';
if inserting then
 v_op := 'I';
 elsif updating then
 v_op := 'U';
 elsif deleting then
  v_op := 'D';
end if;
 v_anterior:=:OLD.AUT_PLACA ||'|'||:OLD.CLI_CED||'|'||:OLD.AUT_CHASIS||'|'||:OLD.AUT_MARCA||'|'||:OLD.AUT_MODELO||'|'||:OLD.AUT_COLOR;
 v_nuevo:= :NEW.AUT_PLACA ||'|'||:NEW.CLI_CED||'|'||:NEW.AUT_CHASIS||'|'||:NEW.AUT_MARCA||'|'||:NEW.AUT_MODELO||'|'||:NEW.AUT_COLOR;
  INSERT INTO AUDITORIA_MASTER(user_name, fecha, tipo_operacion, nombre_table,
    anterior,nuevo)
     VALUES (USER, SYSDATE,v_op,v_tabla, v_anterior,v_nuevo
     );
END;
/

CREATE OR REPLACE TRIGGER audit_master_poliza
AFTER DELETE OR INSERT OR UPDATE ON POLIZA
FOR EACH ROW
declare 
 v_op       varchar2(1);
 v_tabla varchar2(20);
 v_anterior varchar2(200);
 v_nuevo varchar2(200);
BEGIN
v_tabla :='POLIZA';
if inserting then
 v_op := 'I';
 elsif updating then
 v_op := 'U';
 elsif deleting then
  v_op := 'D';
end if;
 v_anterior:=:OLD.POLIZ_NUMCONTRATO ||'|'||:OLD.AUT_PLACA||'|'||:OLD.POLIZ_TIPO;
 v_nuevo:= :NEW.POLIZ_NUMCONTRATO ||'|'||:NEW.AUT_PLACA||'|'||:NEW.POLIZ_TIPO;
  INSERT INTO AUDITORIA_MASTER(user_name, fecha, tipo_operacion, nombre_table,
    anterior,nuevo)
     VALUES (USER, SYSDATE,v_op,v_tabla, v_anterior,v_nuevo
     );
END;
/

CREATE OR REPLACE TRIGGER audit_master_prima
AFTER DELETE OR INSERT OR UPDATE ON PRIMA
FOR EACH ROW
declare 
 v_op       varchar2(1);
 v_tabla varchar2(20);
 v_anterior varchar2(200);
 v_nuevo varchar2(200);
BEGIN
v_tabla :='PRIMA';
if inserting then
 v_op := 'I';
 elsif updating then
 v_op := 'U';
 elsif deleting then
  v_op := 'D';
end if;
 v_anterior:=:OLD.POLIZ_NUMCONTRATO ||'|'||:OLD.PRIMA_NUM||'|'||:OLD.PRIMA_FECHAVENCE||'|'||:OLD.PRIMA_FECHAPAGO||'|'||:OLD.PRIMA_MONTO;
 v_nuevo:= :NEW.POLIZ_NUMCONTRATO ||'|'||:NEW.PRIMA_NUM||'|'||:NEW.PRIMA_FECHAVENCE||'|'||:NEW.PRIMA_FECHAPAGO||'|'||:NEW.PRIMA_MONTO;
  INSERT INTO AUDITORIA_MASTER(user_name, fecha, tipo_operacion, nombre_table,
    anterior,nuevo)
     VALUES (USER, SYSDATE,v_op,v_tabla, v_anterior,v_nuevo
     );
END;
/

CREATE OR REPLACE TRIGGER audit_master_accidente
AFTER DELETE OR INSERT OR UPDATE ON ACCIDENTE
FOR EACH ROW
declare 
 v_op       varchar2(1);
 v_tabla varchar2(20);
 v_anterior varchar2(200);
 v_nuevo varchar2(200);
BEGIN
v_tabla :='ACCIDENTE';
if inserting then
 v_op := 'I';
 elsif updating then
 v_op := 'U';
 elsif deleting then
  v_op := 'D';
end if;
 v_anterior:=:OLD.ACC_NUMREPORTE ||'|'||:OLD.ACC_FECHA ||'|'||:OLD.ACC_DESCRIPCION;
 v_nuevo:= :NEW.ACC_NUMREPORTE ||'|'||:NEW.ACC_FECHA ||'|'||:NEW.ACC_DESCRIPCION;
  INSERT INTO AUDITORIA_MASTER(user_name, fecha, tipo_operacion, nombre_table,
    anterior,nuevo)
     VALUES (USER, SYSDATE,v_op,v_tabla, v_anterior,v_nuevo
     );
END;
/
CREATE OR REPLACE TRIGGER audit_master_accidente_auto
AFTER DELETE OR INSERT OR UPDATE ON ACCIDENTE_AUTO
FOR EACH ROW
declare 
 v_op       varchar2(1);
 v_tabla varchar2(20);
 v_anterior varchar2(200);
 v_nuevo varchar2(200);
BEGIN
v_tabla :='ACCIDENTE_AUTO';
if inserting then
 v_op := 'I';
 elsif updating then
 v_op := 'U';
 elsif deleting then
  v_op := 'D';
end if;
 v_anterior:=:OLD.ACC_NUMREPORTE ||'|'||:OLD.AUT_PLACA;
 v_nuevo:= :NEW.ACC_NUMREPORTE ||'|'||:NEW.AUT_PLACA;
  INSERT INTO AUDITORIA_MASTER(user_name, fecha, tipo_operacion, nombre_table,
    anterior,nuevo)
     VALUES (USER, SYSDATE,v_op,v_tabla, v_anterior,v_nuevo
     );
END;
/

CREATE OR REPLACE TRIGGER audit_master_tipo_accidente
AFTER DELETE OR INSERT OR UPDATE ON TIPO_ACCIDENTE
FOR EACH ROW
declare 
 v_op       varchar2(1);
 v_tabla varchar2(20);
 v_anterior varchar2(200);
 v_nuevo varchar2(200);
BEGIN
v_tabla :='TIPO_ACCIDENTE';
if inserting then
 v_op := 'I';
 elsif updating then
 v_op := 'U';
 elsif deleting then
  v_op := 'D';
end if;
 v_anterior:=:OLD.DETALLE ||'|'||:OLD.AUT_PLACA;
 v_nuevo:= :NEW.DETALLE ||'|'||:NEW.AUT_PLACA;
  INSERT INTO AUDITORIA_MASTER(user_name, fecha, tipo_operacion, nombre_table,
    anterior,nuevo)
     VALUES (USER, SYSDATE,v_op,v_tabla, v_anterior,v_nuevo
     );
END;
/
commit;

/*==============================================================*/
/* Tests                                                        */
/*==============================================================*/
insert into CLIENTE values ('1743223342','Emily','Mino','Quito');
insert into CLIENTE values ('1732413223','Pepe','Pina','Cuenta');
insert into AUTO values ('PCC254','1743223342','F7G9DF7SDFFG','NISSAN','SENTRA','Rojo');
insert into AUTO values ('PCS223','1743223342','DFGD96DGFD7S','FORD','MUSTANG','AZUL');
insert into POLIZA values(20,'PCC254','PREMIUM');
insert into PRIMA values (20,20,TO_DATE('2018/02/03', 'yyyy/mm/dd'),2300.00,301.00);
commit;
select * from auditoria_master;