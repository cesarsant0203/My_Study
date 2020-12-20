Rem
Rem    NAME
Rem      drop_accounts.sql - drops student accounts
Rem
Rem    DESCRIPTION
Rem      In classrooms, there is sometimes the need to make the Sample
Rem      Schemas objects available within a series of individual schemas
Rem      This drops the schemas and schema objects.
Rem
Rem    NOTES
Rem      - All parameters needed can be modified here
Rem      - 
Rem    MODIFIED   (MM/DD/YY)
Rem      pgamer    04/03/02 - Created
Rem

UNDEFINE dbase
UNDEFINE syspw

PROMPT 
PROMPT specify database where accounts should be dropped as parameter 1:
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
Rem

--
-- BEGIN
--

CONNECT system/&&syspw@&&dbase
DROP USER ORA1 CASCADE;
DROP USER ORA2 CASCADE;
DROP USER ORA3 CASCADE;
DROP USER ORA4 CASCADE;
DROP USER ORA5 CASCADE;
DROP USER ORA6 CASCADE;
DROP USER ORA7 CASCADE;
DROP USER ORA8 CASCADE;
DROP USER ORA9 CASCADE;
DROP USER ORA10 CASCADE;
DROP USER ORA11 CASCADE;
DROP USER ORA12 CASCADE;
DROP USER ORA13 CASCADE;
DROP USER ORA14 CASCADE;
DROP USER ORA15 CASCADE;
DROP USER ORA16 CASCADE;
DROP USER ORA17 CASCADE;
DROP USER ORA18 CASCADE;
DROP USER ORA19 CASCADE;
DROP USER ORA20 CASCADE;

--
-- END
--


SPOOL verify_dropped_accounts.log

SELECT          owner, table_name, num_rows
 FROM           dba_tables
 WHERE owner like 'ORA%' and owner != 'ORASSO' 
 ORDER BY       2,1,3;

SPOOL OFF
