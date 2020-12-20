Rem
Rem    NAME
Rem      clone_accounts.sql - clones Sample Schema objects into ora01... accounts
Rem
Rem    DESCRIPTION
Rem      In classrooms, there is sometimes the need to make the Sample
Rem      Schemas objects available within a series of individual schemas
Rem      This script makes this cloning process easier.
Rem
Rem    NOTES
Rem      - All parameters needed can be modified here
Rem      - 
Rem    MODIFIED   (MM/DD/YY)
Rem      ahunold   02/05/02 - Created
Rem      pgamer    04/03/02 - Modified so can run from client
Rem

UNDEFINE dbase
UNDEFINE syspw
PROMPT 
PROMPT specify database where accounts should be created as parameter 1:
DEFINE dbase     = &1
PROMPT 
PROMPT specify password for user SYSTEM as parameter 2:
DEFINE syspw     = &2
SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 132
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 999
SET ECHO OFF
SET CONCAT '.'
COLUMN object_name     FORMAT A25
COLUMN subobject_name  FORMAT A25
COLUMN owner           FORMAT A10

Rem
Rem  parameter 1: schema owner
Rem  parameter 2: schema password
Rem  parameter 3: schema database (tns name)
Rem  parameter 4: default tablespace
Rem  parameter 5: temp tablespace
Rem

--
-- BEGIN
--

CONNECT system/&&syspw@&&dbase
alter session set "_ORACLE_SCRIPT"=true;
@@mk_account ORA1 ORACLE &&dbase USERS TEMP
CONNECT system/&&syspw@&&dbase
--@@mk_account ORA2 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA3 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA4 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA5 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA6 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA7 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA8 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA9 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA10 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA11 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA12 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA13 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA14 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA15 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA16 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA17 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA18 ORACLE &&dbase USERS TEMP
--CONNECT system/&&syspw@&&dbase
--@@mk_account ORA19 ORACLE &&dbase USERS TEMP
---CONNECT system/&&syspw@&&dbase
--@@mk_account ORA20 ORACLE &&dbase USERS TEMP

--
-- END
--

CONNECT system/&&syspw@&&dbase

SPOOL verify_accounts.log

SELECT          owner, table_name, num_rows
 FROM           dba_tables
 WHERE owner like 'ORA%' and owner != 'ORASSO' 
 ORDER BY       2,1,3;

SPOOL OFF
