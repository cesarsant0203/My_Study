rem
rem Header: oe8_p_whs.sql 09-jan-01
rem
rem Copyright (c) 2001 Oracle Corporation.  All rights reserved.
rem
rem Owner  : ahunold
rem
rem NAME
rem   oe8_p_whs.sql - populate OE Common Schema
rem
rem DESCRIPTON
rem   Table warehouses
rem
rem MODIFIED   (MM/DD/YY)
rem   ahunold   10/03/01 - 8i

INSERT INTO warehouses VALUES (1,'Southlake, Texas',1400); 
INSERT INTO warehouses VALUES (2,'San Francisco',1500); 
INSERT INTO warehouses VALUES (3,'New Jersey',1600); 
INSERT INTO warehouses VALUES (4,'Seattle, Washington',1700); 
INSERT INTO warehouses VALUES (5,'Toronto',1800);
INSERT INTO warehouses VALUES (6,'Sydney',2200);
INSERT INTO warehouses VALUES (7,'Mexico City',3200);
INSERT INTO warehouses VALUES (8,'Beijing',2000);
INSERT INTO warehouses VALUES (9,'Bombay',2100);

commit;

