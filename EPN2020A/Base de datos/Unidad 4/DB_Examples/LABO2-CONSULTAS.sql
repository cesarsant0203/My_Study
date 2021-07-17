-- BASES DE DATOS 
-- DRA. ROSA NAVARRETE


/* LABORATORIO 2 - CONSULTAS SOBRE BASES DE DATOS  */

-- SINTAXIS DE LA SENTENCIA SELECT

SELECT [ALL | DISTINCT] column1[,column2]
FROM table1[join table2 on...]
[WHERE "conditions"]
[GROUP BY "column-list"]
[HAVING "conditions]
[ORDER BY "column-list" [ASC | DESC] ]


-- EN LA BD PRUEBA 
-- Mostrar el nombre y apellido de los empleados --

USE BDPRUEBA
GO 

SELECT * FROM EMPLEADOS;

-- Equivalente al operador de Proyección (PI) en AR 
SELECT NOMBRE, APELLIDO FROM EMPLEADOS 

-- Muestre apellido y nombre de los empleados ordenado alfabéticamente
-- desc si se quiere descendente
SELECT NOMBRE, APELLIDO 
FROM EMPLEADOS 
ORDER BY APELLIDO, NOMBRE 

-- Muestre el apellido y nombre de los empleados que tienen un sueldo mayor a $1000
-- ordenado ascendentemente por sueldo 

SELECT APELLIDO,NOMBRE,SUELDO 
FROM EMPLEADOS 
WHERE SUELDO > 1000 
ORDER BY SUELDO  

select * from EMPLEADOS

-- Utilizar operador LIKE. 
-- Mostrar código, apellido y nombre y fecha de ingreso de los empleados cuyo apellido 
-- empiece con las letras AN. 

SELECT CodEmple, apellido, nombre, fechaingreso 
from EMPLEADOS 
where apellido LIKE 'AN%'

-- Mostrar el apellido, nombre y sueldo de los empleados cuyo apellido empieza con 
-- 'C' 

SELECT CodEmple, apellido, nombre, fechaingreso 
from EMPLEADOS 
where apellido LIKE 'C%'

-- operador between 
-- Mostrar el apellido, nombre y sueldo de los empleados cuyos sueldos están entre 
-- 800 a 1200 

SELECT apellido, nombre, sueldo 
from EMPLEADOS 
where sueldo BETWEEN 800 and 1200 

SELECT apellido, nombre, sueldo 
from EMPLEADOS 
where sueldo >= 800 and sueldo <= 1200 

select * from departamentos

select * from cargos 

USE PEDIDOS 
GO 

-- Probar la condición IS NULL 

select * from clientes 

-- Muestre los clientes que tienen un celular con valor nulo 


select NOMBRECIA 
from CLIENTES 
where CELULAR is null 

-- Muestre a las compañías clientes que son SUPERMERCADOS (su nombre incluye la 
-- palabra SUPERMERCADO. Despliegue en orden alfabético.

select * from clientes  
select NOMBRECIA 
FROM CLIENTES 
WHERE NOMBRECIA LIKE 'SUPERMERCADO%' 
ORDER BY NOMBRECIA 

-- Muestre la lista de los proveedores (todos los campos), que son de la ciudad de 
-- Quito 
CREATE table PROVEEDORES
(
stor_id        char(4) primary key
)

ALTER TABLE PROVEEDORES ADD CIUDAD CHAR(30)
SELECT * FROM PROVEEDORES

UPDATE PROVEEDORES 
SET CIUDAD = 'QUITO' 
WHERE PROVEEDORID < 50 

UPDATE PROVEEDORES 
SET CIUDAD = 'GUAYAQUIL' 
WHERE PROVEEDORID > 50 

SELECT * FROM PROVEEDORES 
WHERE CIUDAD = 'QUITO' 

-- JUNTURA ENTRE TABLAS 
-- JOIN: OPERADOR DE JUNTURA EN SQL 

-- Muestre el código, el nombre del producto, el código de la categoría
-- y el nombre de la categoría 

select * from productos 
select * from CATEGORIAS

select productoid, proveedorid, P.categoriaid, descripcion, preciounit, nombrecat
from CATEGORIAS C join PRODUCTOS P 
ON (C.CATEGORIAID = P.CATEGORIAID)
ORDER BY DESCRIPCION 

-- Muestre el código del producto, su descripción, su precio unitario y el nombre
-- de su proveedor 

SELECT productoid, descripcion, preciounit, nombreprov 
from PRODUCTOS P join PROVEEDORES Pv
on (P.PROVEEDORID = Pv.PROVEEDORID)

-- Muestre el código del producto, su descripción, su precio unitario, el nombre 
-- de la categoría a la que pertenece y el nombre de su proveedor.

SELECT productoid, descripcion, preciounit, nombrecat, nombreprov 
from PRODUCTOS P join CATEGORIAS C
on (P.CATEGORIAID = C.CATEGORIAID)
join PROVEEDORES Pv
on (P.PROVEEDORID = Pv.PROVEEDORID)
 
-- Muestre el número de orden, fecha de la orden, nombre de la compañía cliente 
-- apellido y nombre del empleado que atendió la orden 

select ORDENID, fechaorden, nombrecia, apellido, nombre 
from ORDENES O JOIN CLIENTES C
ON (O.CLIENTEID = C.CLIENTEID)
JOIN EMPLEADOS E
ON (O.EMPLEADOID = E.EMPLEADOID) 
ORDER BY ORDENID 

select ORDENID, fechaorden AS 'Fecha de orden', nombrecia as 'CLIENTE', 
apellido AS 'APELLIDO EMPLEADO', nombre AS 'NOMBRE EMPLEADO' 
from ORDENES O JOIN CLIENTES C
ON (O.CLIENTEID = C.CLIENTEID)
JOIN EMPLEADOS E
ON (O.EMPLEADOID = E.EMPLEADOID) 
ORDER BY ORDENID 

-- Mostrar las órdenes de pedidos realizados por el cliente SUPERMERCADO DORADO. 

select ORDENID, fechaorden, nombrecia, apellido, nombre 
from ORDENES O JOIN CLIENTES C
ON (O.CLIENTEID = C.CLIENTEID)
JOIN EMPLEADOS E
ON (O.EMPLEADOID = E.EMPLEADOID) 
WHERE NOMBRECIA = 'SUPERMERCADO DORADO' 
ORDER BY ORDENID 


select ORDENID, fechaorden, apellido, nombre 
from ORDENES O JOIN CLIENTES C
ON (O.CLIENTEID = C.CLIENTEID)
JOIN EMPLEADOS E
ON (O.EMPLEADOID = E.EMPLEADOID) 
WHERE NOMBRECIA = 'SUPERMERCADO DORADO' 
ORDER BY ORDENID 

--- En relaciones recursivas 

select * from EMPLEADOS 

-- Mostrar el apellido y nombre de los empleados y el apellido y nombre 
-- de su jefe inmediato. 

select E.apellido as 'Apellido Emp.', E.nombre as 'Nombre Emp.',
J.apellido as 'Apellido Jefe', J.nombre as 'Nombre Jefe' 
from EMPLEADOS E join EMPLEADOS J 
on (E.REPORTA_A = J.EMPLEADOID) 

-- Muestre el apellido y nombre del empleado que es el Jefe máximo (que 
-- no tiene a un jefe inmediato)

select apellido, nombre 
from empleados 
where REPORTA_A is NULL 

-- En la BD PRUEBA

USE PRUEBA
GO 

select * from departamentos  

--1. Muestre a los empleados (apellido y nombre) que tienen el cargo ANALISTA.
select apellido, nombre, nomcargo 
from empleados e join cargos c
on e.cargo = c.CodCargo 
where nomcargo = 'ANALISTA' 

--2. Muestre a los empleados que tienen el cargo de GERENTE y que ganan más 
--   de 1200. 

select apellido, nombre 
from empleados e join cargos c
on e.cargo = c.CodCargo 
where nomcargo = 'GERENTE' and sueldo > 1200   

--3. Muestre el apellido y nombre de los empleados, el nombre del cargo que 
--   ocupan y el nombre del departamento donde trabajan 

select apellido, nombre, nomcargo, nomDepar
from empleados e join cargos c
on e.cargo = c.CodCargo 
join departamentos d
on e.departamento = d.CodDepar

--4. Muestre a los empleados que trabajan en el departamento de COMERCIALIZACION

select apellido, nombre, nomDepar
from empleados e join departamentos d
on e.departamento = d.CodDepar
where nomDepar = 'COMERCIALIZACION'

--5. Muestre a los empleados que tienen un sueldo menor al sueldo máximo del 
--   cargo que desempeñan

select apellido, nombre, sueldo, nomcargo, sueldomax 
from empleados e join cargos c
on (e.cargo = c.CodCargo) 
where sueldo < sueldomax

-- OPERACIONES CON VARIAS TABLAS USANDO CONDICION WHERE 

--1. Muestre a los empleados (apellido y nombre) que tienen el cargo ANALISTA.

select apellido, nombre, nomcargo 
from empleados e join cargos c
on e.cargo = c.CodCargo 
where nomcargo = 'ANALISTA' 

select apellido, nombre, nomcargo 
from empleados e, cargos c 
where e.cargo = c.CodCargo 
and nomcargo = 'ANALISTA' 

--2. Muestre a los empleados que tienen el cargo de GERENTE y que ganan más 
--   de 1200. 

select apellido, nombre 
from empleados e join cargos c
on e.cargo = c.CodCargo 
where nomcargo = 'GERENTE' and sueldo > 1200 

select apellido, nombre 
from empleados e, cargos c
where  e.cargo = c.CodCargo 
and nomcargo = 'GERENTE' and sueldo > 1200   

USE PEDIDOS 
GO 

-- Utilizando condiciones WHERE realice las siguientes consultas 

-- Muestre el número de orden, el nombre del cliente y el apellido y nombre 
-- del empleado que atendió la orden 
select * from ordenes

select ordenid, nombrecia, apellido, nombre 
from ordenes, clientes, empleados 
where ordenes.clienteid = clientes.clienteid 
and ordenes.empleadoid = empleados.empleadoid 
order by ordenid 

--- USO DE FUNCIONES 

select * from empleados 

-- Concatenar cadenas (operador +) 

select nombre, apellido 
from empleados 

select nombre + apellido as 'Nombre del empleado'
from empleados 

select rtrim(nombre) + ' ' + apellido as 'Nombre del empleado'
from empleados 

select * from ordenes

select ordenid, nombrecia, cast (fechaorden as char(12)) as 'Fecha de orden'  
from ordenes, clientes 
where ordenes.clienteid = clientes.clienteid 

---- CONSULTAS CON FUNCIONES DE AGREGACIÓN 

use pubs
go

SELECT * from titles

-- FUNCIONES DE AGREGACIÓN: COUNT(), SUM, AVG, MAX, MIN
-- Pueden aplicarse a toda la tabla o a grupos de registros que cumplen condiciones

select * from titles 
order by type 

-- Cuál es el precio promedio de los libros 

select avg(price) as 'precio promedio'
from titles

-- Cuántos registros tiene la tabla de libros 

select count(*) as 'número de libros en la tabla'
from titles  

-- Cuál es el precio máximo de los libros 

select max(price) as 'máximo precio'
from titles 


select title_id, title, ytd_sales 
from titles 

-- Calcule el valor total de venta de todos los libros 

select sum(ytd_sales) as 'Número total de ejemplares vendidos'
from titles

-- Cláusula GROUP BY permite agrupar registros por ciertos criterios 

-- Muestre el precio promedio de los libros agrupados por tipo 

select type, avg(price) as 'precio promedio'
from titles
group by type 
order by type

-- Muestre el número de libros en cada tipo 

select type, count(*) as 'Número de libros'
from titles 
group by type 

-- Muestre el número total de ejemplares vendidos por cada editorial 

select pub_id, sum(ytd_sales) as 'Número de ejemplares vendidos'
from titles 
group by pub_id 

-- Agrupaciones basadas en condiciones where

-- Mostrar el precio promedio de los libros cuyo título empieza con 'The'

select avg(price) 
from titles 
where title like 'The%'

-- Usar agrupación por niveles 

-- Muestre el número de libros, por tipo y editorial 

select type, pub_id, count(*) 
from titles
group by type, pub_id 
order by type, pub_id 

-- Agrupación con tablas en juntura 

-- Muestre el número de libros vendidos por cada editorial, con el nombre de la 
-- editorial 

select * from titles 
select * from publishers

select t.pub_id, pub_name, sum(ytd_sales) as 'Número de libros vendidos'
from titles t join publishers p
on t.pub_id = p.pub_id 
group by t.pub_id, pub_name
order by pub_name 

-- Muestre el precio promedio por tipo de libros. Incluya el nombre del tipo. 

select type, avg(price) as 'Precio prom'
from titles 
group by type 

--
select * from employee
select * from jobs

-- Muestre el número de empleados que están en cada tipo de job
-- Muestre el nombre del job

select job_id, count(*) as 'Número de empleados'
from employee 
group by job_id 


select e.job_id, job_desc, count(*) as 'Número de empleados'
from employee e join jobs j
on e.job_id = j.job_id 
group by e.job_id, job_desc 

-- Mostrar el sueldo promedio de los empleados por cada job. Use el 
-- nombre del job 

select job_desc, avg(job_lvl) as 'Sueldo promedio'
from employee e join jobs j
on e.job_id = j.job_id 
group by job_desc 

-- EJERCICIOS: 
-- Muestre el número total de unidades registradas como ventas (sales)
-- por cada título de libro. Muestre el nombre del título

select title, sum(qty) as 'Total libros vendidos'
from titles t join sales s 
on t.title_id = s.title_id 
group by title 


-- Muestre el número de unidades registradas como ventas (sales)
-- agrupando por nombre de la tienda y nombre del libro 

select stor_name, title, sum(qty) as 'libros vendidos'
from sales s join stores st 
on s.stor_id = st.stor_id 
join titles t
on s.title_id = t.title_id 
group by stor_name, title 
order by stor_name, title 

-- Cuente cuántos libros ha escrito un autor, con el apellido y nombre
-- del autor. 

select au_lname,au_fname, count(ta.title_id) 
from authors a join titleauthor ta
on a.au_id = ta.au_id
join titles t
on t.title_id = ta.title_id 
group by au_lname, au_fname


--- USO DE LA CLÁSULA HAVING 

-- La clásula HAVING habilita la presentación de grupos y funciones de agregación que 
-- cumplen una condición. 

-- Sobre la BD PUBS. Mostrar el número de libros que se tiene en cada tipo. 

use pubs
go

select * from titles

select type, count(*) as 'Número de libros'
from titles 
group by type 
order by type

-- Usando la cláusula HAVING, mostrar de la consulta anterior únicamente los grupos
-- que tengan más de 1 libro 

select type, count(*) as 'Número de libros'
from titles 
group by type
having count(*) > 1 
order by type

-- Mostrar el número de libros por tipo y el precio promedio. 

select type, count(*) as 'Número de libros', avg(price) as 'Precio promedio' 
from titles 
group by type 
order by type

-- Del ejemplo anterior mostrar únicamente los grupos que tienen más de 3 libros 
-- y un precio promedio mayor a $15

select type, count(*) as 'Número de libros', avg(price) as 'Precio promedio' 
from titles 
group by type 
having count(*) > 3 and avg(price) > 15
order by type

-- De la tabla empleados mostrar el nombre de la editorial y el sueldo promedio (job_lvl) 
-- de los empleados de esa editorial. 

select * from employee
select * from publishers

select pub_name, avg(job_lvl) as 'Sueldo promedio'
from employee e join publishers p 
on e.pub_id = p.pub_id 
group by pub_name 

-- Del ejemplo anterior solo muestre las editoriales que tengan más de 5 empleados. 

select pub_name, avg(job_lvl) as 'Sueldo promedio'
from employee e join publishers p 
on e.pub_id = p.pub_id 
group by pub_name 
having count(*) > 5 
order by pub_name 

--- 

select * from titles 

-- Muestre el nombre de la editorial, el precio promedio y el royalty promedio
-- sin considerar los registros que tienen un valor NULL en los campos price y 
-- royalty. 
-- Solo despliegue los grupos que tienen un precio promedio > 15

select pub_name, count(*) as 'NUM.LIBROS', avg(price) as 'PRECIO PROMEDIO', avg(royalty)as 'ROYALTY PROMEDIO' 
from titles t join publishers p 
on t.pub_id = p.pub_id 
where price is NOT NULL and royalty is NOT NULL 
group by pub_name 
having avg(price) > 15 



--- USO DE SEMIJOIN 

-- JOIN, RIGHT JOIN, LEFT JOIN 

USE PUBS 
GO 

SELECT * FROM AUTHORS
SELECT * FROM PUBLISHERS 


USE pubs
GO 

-- Presenta nombre y apellido de los autores y la ciudad en la que existen editoriales 
SELECT a.au_fname, a.au_lname, p.pub_name
FROM authors a LEFT OUTER JOIN publishers p
ON a.city = p.city
ORDER BY p.pub_name ASC, a.au_lname ASC, a.au_fname ASC

-- Presente todas las editoriales y la coincidencia con las ciudades donde viven 
-- los autores 
SELECT a.au_fname, a.au_lname, p.pub_name
FROM authors a RIGHT OUTER JOIN publishers p
ON a.city = p.city
ORDER BY p.pub_name, a.au_lname, a.au_fname 

-- FULL OUTER JOIN 

SELECT a.au_fname, a.au_lname, p.pub_name
FROM authors a FULL OUTER JOIN publishers p
ON a.city = p.city
ORDER BY p.pub_name, a.au_lname, a.au_fname 





















































