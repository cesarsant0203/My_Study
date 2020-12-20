Rem
Rem mk_account.sql
Rem
Rem	This script is called by clone_accounts.sql
Rem     Do not modify
Rem
Rem	Created  02/05/02 ahunold
Rem   Modified 04/01/02 pgamer (to create 8i common schema objects needed by Forms course)
Rem

UNDEFINE account
UNDEFINE password
UNDEFINE db

PROMPT 
PROMPT specify account name as parameter 1:
DEFINE account     = &1
PROMPT 
PROMPT specify password as parameter 2:
DEFINE password    = &2
PROMPT 
PROMPT specifiy database to connect to as parameter 3:
DEFINE db = &3
PROMPT
PROMPT specify default tablespace as parameter 4:
DEFINE tbs         = &4
PROMPT
PROMPT specify temporary tablespace as parameter 5:
DEFINE temptbs     = &5
PROMPT

spool mk.&&account..log

PROMPT Creating user &&account
PROMPT

DROP USER &&account CASCADE;

CREATE USER &&account IDENTIFIED BY &&password
 DEFAULT TABLESPACE &&tbs
 TEMPORARY TABLESPACE &&temptbs
 QUOTA UNLIMITED ON &&tbs;

GRANT create session TO &&account;
GRANT create table TO &&account;
GRANT create procedure TO &&account;
GRANT create sequence TO &&account;
GRANT create trigger TO &&account;
GRANT create view TO &&account;
GRANT create synonym TO &&account;
GRANT alter session TO &&account;
GRANT create type TO &&account;

REM  connect to user account and invoke the scripts that create schema objects.

CONNECT &&account/&&password@&&db

ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;

--
-- create tables, sequences and constraint
--

@@hr8_cre
@@oe8_cre

-- 
-- populate tables
--

@@hr8_popul
@@oe8_p_pi  
@@oe8_p_pd
@@oe8_p_whs                      
@@oe8_p_cus
@@oe8_p_ord
@@oe8_p_itm 
@@oe8_p_inv                               

--
-- create indexes
--

@@hr8_idx
@@oe8_idx

--
-- create procedural objects
--

@@hr8_code

--
-- create views
-- 

@@oe8_views


--
-- add comments to tables and columns
--

@@hr8_comnt
@@oe8_comnt

-- create stored procedure to use in course demo
-- for the course Oracle9iForms: Build Internet Applications

@@select_departments
@@create_webutil_db
spool off
