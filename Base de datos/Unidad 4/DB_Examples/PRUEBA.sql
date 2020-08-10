/* -------------------------------------
BASES DE DATOS 
DRA. ROSA NAVARRETE

CREACIÓN DE BASE DE DATOS 
SENTENCIAS DDL: CREATE, ALTER, DROP 
*/--------------------------------------

/* CREAR BASE DE DATOS
Para crear una base de datos, la base de datos MASTER debe ser la base activa 
Luego de crear la BD se debe activarla con la sentencia USE 
*/

USE MASTER
GO

/* Usualmente las sentencias SQL terminan o se cierran con el símbolo punto y coma (;) 
   Si se trabaja en un ambiente de interacción, no se requiere el ; y puede sustituirse por la
   sentencia GO */



CREATE DATABASE PRUEBA;
GO

DROP DATABASE PRUEBA; 
GO

USE PRUEBA
GO

/* SENTENCIA CREATE */

-- Crear tablas relacionadas

CREATE TABLE CATEGORIAS 
(CodCat int, 
nombreCat varchar(30), 
PRIMARY KEY (CodCat));

CREATE TABLE PRODUCTOS 
(CodProd int,
nombreProd  varchar(30), 
unidades char(10), 
preciounit Money, 
CodCat int, 
PRIMARY KEY (CodProd), 
FOREIGN KEY (CodCat) references CATEGORIAS);

-- Al declarar el FOREIGN KEY si se omite el nombre del campo de la tabla referenciada, asume que es 
-- el mismo que en la tabla de origen. 
-- Es decir, FOREIGN KEY (CodCat) references CATEGORIAS (CodCat).


-- Crea tabla con un valor DEFAULT y restricción UNIQUE
-- Observe que si la PK es de una sola columna puede declararse a continuación del tipo 

CREATE TABLE CLIENTES 
(CodCli int PRIMARY KEY, 
cedula int UNIQUE,
nombre varchar(30) not null, 
apellido varchar(30) not null, 
direcc varchar(30) default 'NO SE CONOCE')


--	Crea tabla definiendo un CONSTRAINT de clave primaria (restricción) a la que se le da un nombre 
Create table Empleado (
emp_id int
CONSTRAINT PK_emp_id PRIMARY KEY,
Emp_nombre varchar(30))

-- Visualizar el objeto CONSTRAINT PK_emp_id en el panel 
-- correr un procedimiento almacenado del sistema que permite visualizar informacion de un objeto del sistema
-- exec es el abreviado de execute
EXEC sp_help Empleado;
EXEC sp_help CLIENTES;
EXEC sp_help productos;
-- Crea tablas relacionadas
CREATE TABLE SUCURSALES 
(CODSUC INT PRIMARY KEY,
NOMSUC VARCHAR(30))

CREATE TABLE ARTICULOS 
(CODART CHAR(7) PRIMARY KEY, 
NOMART VARCHAR(30), 
UNID CHAR(5))

-- Para una clave primaria compuesta, necesariamente debe indicarse al final de la 
-- descripción de campos

CREATE	TABLE VENTAS_DIARIAS 
(CODSUC	INT,	
CODART	CHAR(7),
UNIDVENTA SMALLINT, 
DIA DATE,
PRIMARY KEY (CODSUC, CODART), 
FOREIGN KEY (CODSUC) REFERENCES SUCURSALES(CODSUC),
FOREIGN KEY (CODART) REFERENCES ARTICULOS(CODART)); 
EXEC sp_help ventas_diarias;
-- Observe los objetos CONSTRAINT que crea el SQL SERVER con nombres asignados por el mismo SQL SERVER.

EXEC SP_HELP VENTAS_DIARIAS;

-- Para dar un nombre a los objetos CONSTRAINT que se crean en la base de datos

DROP TABLE VENTAS_DIARIAS
GO 

EXEC SP_HELP VENTAS_DIARIAS;

CREATE	TABLE VENTAS_DIARIAS 
(CODSUC	INT,	
CODART	CHAR(7),
UNIDVENTA SMALLINT, 
DIA DATE,
CONSTRAINT PK_VENTAS_DIARIAS PRIMARY KEY (CODSUC, CODART), 
CONSTRAINT FK_VD_SUC FOREIGN KEY (CODSUC) REFERENCES SUCURSALES(CODSUC),
CONSTRAINT FK_VD_ART FOREIGN KEY (CODART) REFERENCES ARTICULOS(CODART)); 

EXEC SP_HELP VENTAS_DIARIAS;

-- Crea tabla con campo calculado

CREATE TABLE tablaEj (
Valor1 int, 
Valor2 int,
promedio AS (valor1 + valor2)/2
)

-- Crea tabla con valor IDENTITY para campo de clave primaria
-- IDENTITY hace que el SQL SERVER asigne un valor numérico secuencial al campo. 
-- Por defecto empieza en 1 con incrementos de 1
-- Puede variar indicando, por ejemplo: IDENTITY (100, 2)

CREATE TABLE TABEJEM 
(CODIGO INT IDENTITY PRIMARY KEY, 
CAMPOA CHAR(10), 
CAMPOB DATETIME DEFAULT GETDATE());
EXEC SP_HELP tabejem;

-- Uso de la restricción CHECK -- 

CREATE TABLE Persons (
    ID int NOT NULL,
    Apellido varchar(255) NOT NULL,
    Nombre varchar(255),
    Edad int CHECK (Edad >=18)
);

EXEC SP_HELP persons;

CREATE TABLE employees
( employee_id INT NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50),
  salary MONEY,
  CONSTRAINT check_salary
    CHECK (salary > 0)
);
EXEC SP_HELP employees;
CREATE TABLE students
( student_id INT NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50),
  scolarship MONEY,
  CONSTRAINT check_
    CHECK (scolarship BETWEEN 150 and 400)
);

/*  CON CADENAS
(%) cualquier cadena de cero o más caracteres.
(_) cualquier caracter. 
[lista de caracteres] cualquier caracter en el conjunto
[caracter-caracter] un caracter dentro del rango

------------------------ */

CREATE TABLE Piezas (
    ID int NOT NULL,
    Bodega char (6) NOT NULL,
    Nombre varchar(255),
    Existencia int, 
	PRIMARY KEY (ID), 
	CONSTRAINT CHKBODEGA CHECK (Bodega like '[0-9][0-9][0-9][A-Z][NS][EO]')
);


CREATE TABLE proyectos
( ProyID INT NOT NULL,
  ProyCod CHAR(4) NOT NULL,
  ProyTitulo VARCHAR(50),
  ProyPresupuesto MONEY,
  CONSTRAINT check_cod
    CHECK (ProyCod in ('COMP', 'META', 'ALIM', 'MATE'))
);



/* SENTENCIA ALTER */

-- Permite modificar la estructura de la tabla, una vez creada

-- Añadir un campo a una tabla creada

USE PRUEBA
go

CREATE TABLE doc_exa 
(column_a INT) 
GO
SELECT * FROM doc_exa;

ALTER TABLE doc_exa ADD column_b VARCHAR(20) NULL, column_c bit 
GO

EXEC sp_help doc_exa 
go

DROP TABLE doc_exa
 
GO


-- Borrar una columna a una tabla
CREATE TABLE doc_exb ( column_a INT, column_b VARCHAR(20) NULL)
GO
ALTER TABLE doc_exb DROP COLUMN column_b
GO

EXEC sp_help doc_exb 
GO


/* Cambiar tipo de datos de una columna. 
En el ejemplo siguiente se modifica una columna de una tabla de INT a DECIMAL */

CREATE TABLE doc_exy ( column_a INT )
GO
INSERT INTO doc_exy (column_a) VALUES (10)
GO
SELECT * FROM doc_exy
GO
EXEC sp_help doc_exy 
GO

ALTER TABLE doc_exy ALTER COLUMN column_a DECIMAL (5,2)
GO
SELECT * FROM doc_exy
GO
EXEC sp_help doc_exy 
GO

--	Agregar restricción UNIQUE

CREATE TABLE doc_exc ( column_a INT)
GO
ALTER TABLE doc_exc ADD column_b VARCHAR(20) NULL 
CONSTRAINT exb_unique UNIQUE
GO

EXEC sp_help doc_exc
GO


--	Agregar una restricción DEFAULT
CREATE TABLE doc_exz ( column_a INT, column_b INT)
GO
INSERT INTO doc_exz (column_a) VALUES ( 7 );
GO
SELECT * from doc_exz;
ALTER TABLE doc_exz
ADD CONSTRAINT col_b_def DEFAULT 50 FOR column_b; 
GO
INSERT INTO doc_exz (column_a) VALUES ( 10 );
GO

SELECT * FROM doc_exz
GO
DROP TABLE doc_exz; 


 
/*	En el ejemplo siguiente se agregan varias columnas con CONSTRAINT asociadas. 
-- column_b tiene una propiedad IDENTITY y se declara PK.
-- column_c se declara como FK hacia la misma tabla en column_a.
-- column_d se declara con un constraint DEFAULT 
*/

CREATE TABLE doc_exe ( column_a INT CONSTRAINT column_a_un UNIQUE); 
GO
ALTER TABLE doc_exe ADD column_b INT IDENTITY
CONSTRAINT column_b_pk PRIMARY KEY,
column_c INT NULL
CONSTRAINT column_c_fk REFERENCES doc_exe(column_a),
column_d DECIMAL(3,3)
CONSTRAINT column_d_default DEFAULT .081 ;
GO

EXEC sp_help doc_exe; 
GO

DROP TABLE doc_exe;
DROP TABLE doc_exc;

-- Quitar una restricción (constraint)
CREATE TABLE doc_exc (column_a INT 
CONSTRAINT my_constraint UNIQUE) 
GO

ALTER TABLE doc_exc DROP CONSTRAINT my_constraint; 
GO

DROP TABLE doc_exc; 
GO

/* BORRAR LA BASE DE DATOS */

-- Para borrar una base de datos, no puede estar en uso 
-- Debe estar activa la BD MASTER

USE MASTER 
GO

DROP DATABASE PRUEBA; 
GO 
