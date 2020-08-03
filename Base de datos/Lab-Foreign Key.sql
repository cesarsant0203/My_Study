
USE master
GO
CREATE DATABASE CLASE
GO
USE CLASE
GO

CREATE TABLE SUCURSALES 
(CODSUC INT PRIMARY KEY, 
NOMSUC VARCHAR(30))

INSERT INTO SUCURSALES VALUES (1,'SUC1');

CREATE TABLE ARTICULOS 
(CODART CHAR(7) PRIMARY KEY, 
NOMART VARCHAR(30),
UNID CHAR(5))

INSERT INTO ARTICULOS VALUES (10, 'ART1', 'UNID'); 

DROP TABLE VENDEDOR 

CREATE TABLE VENDEDOR 
(CEDVEND CHAR(10) PRIMARY KEY, 
NOM CHAR(30),
APE CHAR(30));

INSERT INTO VENDEDOR VALUES ('1009876756', 'ROSA', 'PAZ')

-- EJEMPLO DEL USO DE PK COMPUESTA Y FK QUE ACEPTE VALORES NULL 

CREATE TABLE VENTAS_DIARIAS 
(CODSUC INT, 
CODART CHAR(7), 
UNIDVENTA SMALLINT, 
DIA DATETIME,
CEDVEND CHAR(10), 
PRIMARY KEY (CODSUC, CODART),
FOREIGN KEY (CODSUC) REFERENCES SUCURSALES(CODSUC),
FOREIGN KEY (CODART) REFERENCES ARTICULOS(CODART),
FOREIGN KEY (CEDVEND) REFERENCES VENDEDOR (CEDVEND)) 

INSERT INTO VENTAS_DIARIAS (CODSUC, CODART, UNIDVENTA, DIA) VALUES (1,10,10, GETDATE()) 

SELECT * FROM VENTAS_DIARIAS

EXEC SP_HELP VENTAS_DIARIAS

/* CASOS DE FK 
Uso de 
- NO ACTION
- CASCADE
- SET NULL
- DEFAULT
*/

-- Script 1: Create sample tables
-- Use required database
Use CLASE
GO
-- Create child table
IF EXISTS (SELECT * FROM sys.objects
WHERE name = 'EmpEducation' AND [type] = 'U')
DROP TABLE EmpEducation

CREATE TABLE EmpEducation
(
EduID SMALLINT IDENTITY(1,1) PRIMARY KEY,
empno SMALLINT NULL DEFAULT 100,
DegreeTitle VARCHAR(50)
)


GO
-- Create parent table
IF EXISTS (SELECT * FROM sys.objects
WHERE name = 'employees' AND [type] = 'U')
DROP TABLE employees

CREATE TABLE employees
(
empno SMALLINT PRIMARY KEY ,
EmpName VARCHAR(70)
)
GO

-- Script 2: Create FK relationship
-- Create FK relationship

IF EXISTS (SELECT * FROM sys.objects
WHERE name = N'FK_EmpEducation_Employees' AND [type] = 'F')
ALTER TABLE EmpEducation
DROP Constraint FK_EmpEducation_Employees
GO

ALTER TABLE EmpEducation
ADD CONSTRAINT [FK_EmpEducation_Employees]
FOREIGN KEY (empno)REFERENCES employees(empno)
GO

-- Script 3: Populate the tables with sample data

-- Insert records in parent table
INSERT INTO employees
SELECT 1, 'Atif' UNION ALL
SELECT 2, 'Shehzad' UNION ALL
SELECT 3, 'khurram' UNION ALL
SELECT 4, 'Ahmed' UNION ALL
SELECT 5, 'Uzair'
GO

SELECT * FROM employees

-- Insert records in parent table
INSERT INTO EmpEducation
SELECT 1, 'MS' UNION ALL
SELECT 2, 'MBA' UNION ALL
SELECT 1, 'BS' UNION ALL
SELECT 2, 'MS' UNION ALL
SELECT 3, 'BS'
GO

select * from EmpEducation

/* NO ACTION option
For our data with default specification (No Action) SQL Server would not allow an update or delete operation on
referenced values of the primary key table. Since we did not define a specification for our foreign key the default No Action
is used. So based on this, no update or delete should be allowed for values that are referenced in the child table.
Let's verify the effect of the No Action rule.
*/

-- Especificación NO ACTION

-- Script 4: Update and delete with 'No Action' rule
-- Try to update referenced PK
UPDATE Employees
SET empno = 100 WHERE empno = 1
GO
-- Try to delete record with referenced PK
DELETE FROM Employees
WHERE empno = 2
GO

/*  CASCADE option
Now let's change the default specification (No Action) to Cascade. Select the CASCADE rule from the SSMS GUI as
shown in the above screenshot or use this T-SQL code.
The following script adds "ON DELETE CASCADE ON UPDATE CASCADE" */

-- Script 5: Create FK relationship with CASCADE
-- Create FK relationship

IF EXISTS (SELECT * FROM sys.objects
WHERE name = N'FK_EmpEducation_Employees' AND [type] = 'F')
ALTER TABLE EmpEducation
DROP Constraint FK_EmpEducation_Employees
GO

ALTER TABLE EmpEducation
ADD CONSTRAINT [FK_EmpEducation_Employees]
FOREIGN KEY (empno)REFERENCES employees(empno)
ON DELETE CASCADE ON UPDATE CASCADE
GO

-- Script 4: Update and delete with 'No Action' rule
-- Try to update referenced PK
UPDATE Employees
SET empno = 100 WHERE empno = 1
GO
-- Try to delete record with referenced PK
DELETE FROM Employees
WHERE empno = 2
GO

SELECT * FROM employees
Select * from EmpEducation

/* SET NULL option
To utilize the SET NULL rule for update/delete operations the foreign key column should allow NULL values otherwise the
SET NULL specification would fail by generating an error message.
Run script # 1 - to recreate the objects
Run the following script which adds "ON DELETE SET NULL ON UPDATE SET NULL" */

IF EXISTS (SELECT * FROM sys.objects
WHERE name = N'FK_EmpEducation_Employees' AND [type] = 'F')
ALTER TABLE EmpEducation
DROP Constraint FK_EmpEducation_Employees
GO

ALTER TABLE EmpEducation
ADD CONSTRAINT [FK_EmpEducation_Employees]
FOREIGN KEY (empno)REFERENCES employees(empno)
ON DELETE SET NULL ON UPDATE SET NULL
GO