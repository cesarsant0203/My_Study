/*
BASES DE DATOS
Ing. Rosa Navarrete 


LABORATORIO DE INDICES
*/

/*  CREACION DE INDICES SOBRE LAS TABLAS DE LA BASE DE DATOS PEDIDOS */

-- Por defecto han sido creados como �ndices CLUSTERED, todos los campos de PRIMARY KEY de las tablas.


use PEDIDOS
go

-- Obs�rvese el detalle de los �ndices que ya existen en la tabla sysindexes

select name from sysindexes where name like 'PK%' 

-- Se crean por tanto los �ndices NONCLUSTERED, atendiendo a las recomendaciones 

-- Para b�squedas / ordenamiento por el nombre de la categor�a
create  NONCLUSTERED index nombrecat_ind
on categorias(nombrecat)

-- Para b�squedas / ordenamiento por el nombre de la compa��a cliente
create NONCLUSTERED index nombrecia_ind
on clientes(nombrecia)

-- Para b�squedas / ordenamiento por apellido, nombre del empleado.  Ordena ascendente por apellido y
-- dentro de apellido, por nombre
create NONCLUSTERED index nomape_ind
on empleados(apellido,nombre)

-- Para b�squedas / ordenamiento por el nombre del producto
create NONCLUSTERED index desc_ind
on productos(descripcion)

-- Para b�squedas / ordenamiento por el nombre del proveedor
create NONCLUSTERED index nomprov_ind
on proveedores(nombreprov)

-- Para b�squedas por clave for�nea hacia tabla empleados desde tabla ordenes
create NONCLUSTERED index ord_emp_ind
on ordenes(empleadoid)

-- Para b�squedas por clave for�nea hacia tabla clientes desde tabla ordenes
create NONCLUSTERED index ord_cli_ind
on ordenes(clienteid)

-- Para b�squedas por clave for�nea hacia tabla ordenes desde tabla detalle_ordenes
create NONCLUSTERED index detord_ord_ind
on detalle_ordenes(ordenid)

-- Se observan los �ndices creados
select name from sysindexes order by name

-- Observar los �ndices creados en una tabla 
exec sp_helpindex ordenes; 

-- Observar todas las restricciones
exec sp_helpconstraint ordenes;



/* CREACI�N DE INDICES SOBRE LA BASE DE DATOS PUBS */


Use pubs
go

/* A. Utilizar un �ndice sencillo
      El ejemplo siguiente crea un �ndice en la columna au_id de la tabla authors. */

/* Verifica si existe un �ndice ya creado con este nombre, verificando en la tabla
   del sistema SYSINDEXES; si existe, lo borra */

IF EXISTS (SELECT name FROM sysindexes 
WHERE name = 'au_id_ind')
DROP INDEX authors.au_id_ind
GO

-- Crea el �ndice llamado au_id_ind en la tabla authors, campo au_id

CREATE INDEX au_id_ind
ON authors (au_id)
GO


/*  B. Utilizar un �ndice agrupado �nico
    Este ejemplo crea un �ndice en la columna emp_ID de la tabla empleados, 
    que exige que sea �nico. Este �ndice ordena f�sicamente los datos del disco porque se 
    especifica la cl�usula CLUSTERED.  */


IF EXISTS (SELECT name FROM sysindexes 
WHERE name = 'empID_ind')
DROP INDEX emp_pay.employeeID_ind
GO

use pubs
go

CREATE TABLE empleados
(
emp_ID int NOT NULL,
base_sueldo money NOT NULL,
commision decimal(2, 2) NOT NULL
)
INSERT empleados
VALUES (1, 500, .10)
INSERT empleados 
VALUES (2, 1000, .05)
INSERT empleados 
VALUES (3, 800, .07)

GO

SET NOCOUNT OFF

CREATE UNIQUE CLUSTERED INDEX empID_ind
ON empleados (emp_ID)
GO

SELECT * FROM sysindexes 
WHERE name = 'empID_ind'

drop table empleados


/*  C. Utilizar un �ndice compuesto �nico
    En este ejemplo se crea un �ndice NONCLUSTERED en las columnas orderID y employeeID de la tabla order_emp. */

USE pubs
go

CREATE TABLE order_emp
(
orderID int IDENTITY(1000, 1),  -- empieza en 1000 con incrementos de 1
employeeID int NOT NULL,
orderdate datetime NOT NULL DEFAULT GETDATE(),
orderamount money NOT NULL
)

set dateformat dmy

INSERT order_emp (employeeID, orderdate, orderamount)
VALUES (5, '14/02/08', 315.19)
INSERT order_emp (employeeID, orderdate, orderamount)
VALUES (5, '5/03/08', 1929.04)
INSERT order_emp (employeeID, orderdate, orderamount)
VALUES (1, '01/03/08', 2039.82)
GO

select * from order_emp

SET NOCOUNT OFF

CREATE INDEX emp_order_ind
ON order_emp (orderID, employeeID)

select * from sysindexes where name='emp_order_ind'

drop table order_emp

/* D. Utilizar la opci�n FILLFACTOR
   Este ejemplo utiliza la opci�n FILLFACTOR establecida en 100. 
   Un valor de FILLFACTOR de 100 llena cada p�gina completamente y s�lo es �til 
   cuando se sabe que los valores de los �ndices de una tabla no cambiar�n nunca.*/

SET NOCOUNT OFF
USE pubs
go

IF EXISTS (SELECT name FROM sysindexes 
WHERE name = 'zip_ind')
DROP INDEX authors.zip_ind
GO

CREATE NONCLUSTERED INDEX zip_ind
ON authors (zip)
WITH FILLFACTOR = 100

/*  E. Utilizar IGNORE_DUP_KEY
    Este ejemplo crea un �ndice agrupado �nico en la tabla emp_pay. 
    Si se introduce una clave duplicada, las instrucciones INSERT y UPDATE se omiten.*/

SET NOCOUNT ON

USE pubs
go

CREATE TABLE emp_pay
(
employeeID int NOT NULL,
base_pay money NOT NULL,
commission decimal(2, 2) NOT NULL
)
INSERT emp_pay
VALUES (1, 500, .10)
INSERT emp_pay 
VALUES (2, 1000, .05)
INSERT emp_pay 
VALUES (3, 800, .07)
GO
SET NOCOUNT OFF
GO
select * from emp_pay

CREATE UNIQUE CLUSTERED INDEX employeeID_ind
ON emp_pay(employeeID)
WITH IGNORE_DUP_KEY

-- Observe el efecto cuando se trata de duplicar una clave

INSERT emp_pay 
VALUES (3, 1000, .08)

drop table emp_pay


