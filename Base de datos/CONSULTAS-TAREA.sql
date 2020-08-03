-- BASES DE DATOS 
-- DRA. ROSA NAVARRETE


/* LABORATORIO : CONSULTAS EN BD */

USE MASTER
GO 

USE PEDIDOS 
GO 


SELECT [ALL | DISTINCT] column1[,column2]
FROM table1[join table2 on...]
[WHERE "conditions"]
[GROUP BY "column-list"]
[HAVING "conditions]
[ORDER BY "column-list" [ASC | DESC] ]

SELECT * FROM PRODUCTOS; 

SELECT * FROM PRODUCTOS 
WHERE PRECIOUNIT > 5  

-- Mostrar solo el id y la descripción

SELECT PRODUCTOID, DESCRIPCION FROM PRODUCTOS
WHERE PRECIOUNIT > 5

-- Mostrar solo id, descripcion y precio 
-- de los productos de la categoria 100 
SELECT PRODUCTOID, DESCRIPCION,PRECIOUNIT 
FROM PRODUCTOS
WHERE CATEGORIAID = 100

-- ORDER BY 

select * from clientes 

-- Muestre el código del cliente, el nombre de la compañía y el 
-- nombre del contacto, ordenando por nombre de la compañía

select clienteid, nombrecia, nombrecontacto
from clientes
order by nombrecia desc

-- asc es la opción por defecto (de menor a mayor) 
-- y desc en orden inverso

select * from empleados

-- Mostrar la lista de empleados por orden de fecha de nacimiento. 
-- Incluir apellido, nombre y fecha de nacimiento 

select apellido, nombre, fecha_nac
from empleados 
order by fecha_nac 

-- Mostrar la selección anterior solo de los empleados que hayan nacido
-- en el año 1979 
  
select apellido, nombre, fecha_nac
from empleados 
where year(fecha_nac) = 1979
order by fecha_nac 

-- Muestre los productos con precio menor a $5, indicando el código 
-- y la descripción. Ordene por descripción. 

select descripcion, preciounit
from productos 
where preciounit < 5
order by descripcion 

-- El ordenamiento puede admitir más de un campo, en cuyo caso ordena
-- para el primer campo y luego para el segundo. 

select * from empleados 
select apellido, nombre
from empleados 
order by apellido, nombre 

insert into empleados (EMPLEADOID, NOMBRE, APELLIDO, FECHA_NAC, REPORTA_A,
EXTENSION)
values (8, 'Ana', 'Andrade', '1989/02/05', 2, 222)

update empleados 
set apellido = upper(apellido), nombre = upper(nombre) 
where apellido = 'Andrade' and nombre = 'Ana' 

-- operador between 

select * from productos 

-- Muestre los productos (productoid, descripción y precio unitario)
-- para aquellos cuyo precio unitario esté entre 5 y 10 

select productoid, descripcion, preciounit 
from productos 
where preciounit between 5 and 10 

-- IN (pertenencia a un conjunto) 

-- Mostrar los productos que pertenecen a las categorías 100, 200 o 300

select * from productos 

select descripcion, categoriaid 
from productos 
where categoriaid IN (100,200,300) 

-- like. Compara con un patrón 

-- Muestre los empleados cuyo apellido empieza con A 

select apellido, nombre 
from empleados 
where apellido like 'A%'

-- DISTINCT 

use pubs 
go

select * from titles 

select type from titles 

select distinct(type) from titles

-- Usando where para verificar valores null 

select title, price 
from titles 
where price is null

select title, price 
from titles 
where price is not null  

-- Uso de la clásula TOP 
use AdventureWorks2012
go 

select * from Production.Product

select ProductID, Name, ListPrice
from Production.Product

select top 10 * 
from Production.Product

select top 10 ProductID, Name, ListPrice 
from Production.Product

select top 10 percent ProductID, Name, ListPrice 
from Production.Product


--- CONSULTAS CON JOIN 

USE PUBS
GO

SELECT * FROM TITLES; 
SELECT * FROM PUBLISHERS;

SELECT * 
FROM TITLES, PUBLISHERS 

-- CON EL PRODUCTO CARTESIANO BASADO EN EQUIJOIN

SELECT TITLE_ID, TITLE, TITLES.PUB_ID, PUB_NAME
FROM TITLES, PUBLISHERS
WHERE TITLES.PUB_ID = PUBLISHERS.PUB_ID

SELECT TITLE_ID, TITLE, T.PUB_ID, PUB_NAME
FROM TITLES T, PUBLISHERS P
WHERE T.PUB_ID = P.PUB_ID

-- JOIN 

SELECT TITLE_ID, TITLE, T.PUB_ID, PUB_NAME
FROM TITLES T JOIN PUBLISHERS P
ON T.PUB_ID = P.PUB_ID

SELECT * FROM TITLES 
SELECT * FROM SALES
SELECT * FROM STORES 

-- Muestre las ventas con el nombre de la tienda, el número de orden, la cantidad 
-- y el título del libro 

select stor_name, ord_num, qty, title
from sales s join stores st 
on (s.stor_id = st.stor_id) 
join titles t 
on (s.title_id = t.title_id)

-- Escribirlo sin usar join 
select stor_name, ord_num, qty, title
from sales s, titles t, stores st 
where (s.title_id = t.title_id and 
	   s.stor_id = st.stor_id) 

-- Muestre el apellido y nombre del empleado, el nombre del job que desempeña 
-- y el nombre de la editorial donde trabaja 

select * from employee
select * from publishers
select * from jobs 

select lname, fname, job_desc, pub_name 
from employee e join publishers p 
on e.pub_id = p.pub_id 
join jobs j
on e.job_id = j.job_id 
order by pub_name, lname, fname 

-- Mostrar el título del libro y el apellido y nombre de los autores

select title, au_lname, au_fname
from titles t join titleauthor ta
on (t.title_id = ta.title_id)
join authors a 
on (ta.au_id = a.au_id) 

-- Mostrar el título de los libros y el nombre de la editorial 
-- que los publicó. Solo para los libros del tipo 'Business'

select title, pub_name 
from titles t join publishers p
on t.pub_id = p.pub_id 
where type = 'Business' 


-- Uso de funciones de SQL Server 

select * from employee

-- Funciones de fecha 

-- Muestre los empleados que han sido contratados en el año 1990

select fname, lname, cast(hire_date as char(12)) 
from employee 
where year(hire_date) = 1990 

-- Muestre el apellido y nombre de los empleados y 
-- el tiempo en años y meses que llevan trabajando 

select fname, lname, 
'Años'= DATEDIFF(yy, hire_date, GETDATE()), 
'Meses'= DATEDIFF(mm, hire_date, GETDATE())
from employee 

-- Muestre los tres primeros caracteres del código del 
-- libro y el nombre del libro 

select substring(title_id, 1,3), title
from titles 

SELECT ( CAST(Title_id AS CHAR(10)) + ': ' + Title ) AS 'Id del libro' 
FROM Titles
Where Title_id like 'P%'

select (upper(lname)+ ' '+ substring(fname,1,1)+ '.') as 'Empleado', 
datediff (yy,hire_date, getdate()) as 'años de trabajo'
from employee


-- SEMI JOIN 

-- LEFT JOIN, RIGHT JOIN

-- Se quiere mostrar todos los libros y las ventas de cada uno. Incluir los libros que no han tenido ventas
USE PUBS 
GO 

select * from sales order by title_id
select * from titles 

select t.title_id, ord_num, qty
from titles t left join sales s
on t.title_id = s.title_id 
order by t.title_id

--- Se puede usar el operador join para empatar los valores de campos que no son
--  necesariamente una PK y FK. 
--- Mostrar los autores que viven en la misma ciudad que las editoriales.

select * from publishers
select * from authors 

Select au_lname, au_fname, a.city, pub_name, p.city
from authors a join publishers p 
on a.city = p.city 

-- Usando semijoin izquierdo mostrar todos los autores y la ciudad en la 
-- que viven, contra las editoriales y la ciudad en la que se encuentran.
-- Observe que se muestran todos los autores, aunque no tengan una editorial 
-- cuya ciudad empate con la ciudad del autor.  

Select au_lname, au_fname, a.city, pub_name, p.city
from authors a left join publishers p 
on a.city = p.city 

-- Usando semijoin izquierdo mostrar todos los autores y la ciudad en la 
-- que viven, contra las editoriales y la ciudad en la que se encuentran.
-- Observe que se muestran todas las editoriales, aunque no tengan un autor 
-- cuya ciudad empate con la ciudad de la editorial.  

Select au_lname, au_fname, a.city, pub_name, p.city
from authors a right join publishers p 
on a.city = p.city 

--- Producto cartesiano, puede representarse con un full join 

Select au_lname, au_fname, a.city, pub_name, p.city
from authors a full join publishers p 
on a.city = p.city 



USE PEDIDOS 
GO 


-- Obtenga un listado de los empleados con el nombre de su jefe. 
-- Etiquete cada columna



SELECT * FROM EMPLEADOS 

SELECT CAST (RTRIM(E.NOMBRE)+ ' '+ E.APELLIDO AS CHAR(40)) AS 'EMPLEADO', 
CAST(RTRIM(J.NOMBRE) + ' '+J.APELLIDO AS CHAR(40)) AS 'JEFE INMEDIATO'
FROM EMPLEADOS E JOIN EMPLEADOS J
ON (E.REPORTA_A = J.EMPLEADOID)

-- SEMI JOIN IZQUIERDO PARA PRESENTAR A TODOS LOS EMPLEADOS, 
-- INCLUIDO AQUEL QUE NO TIENE JEFE INMEDIATO 
SELECT CAST (RTRIM(E.NOMBRE)+ ' '+ E.APELLIDO AS CHAR(40)) AS 'EMPLEADO', 
CAST(RTRIM(J.NOMBRE) + ' '+J.APELLIDO AS CHAR(40)) AS 'JEFE INMEDIATO'
FROM EMPLEADOS E LEFT JOIN EMPLEADOS J
ON (E.REPORTA_A = J.EMPLEADOID)
























 