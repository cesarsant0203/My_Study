-- BASES DE DATOS 
-- DRA. ROSA NAVARRETE

-- CONSULTAS CON FUNCIONES DE AGRUPACIÓN
--count(*), sum,avg,max,min

-- Uso de group by y having 
use pubs;

select * from titles

-- Mostrar el precio promedio de los libros 
select avg(price) as 'Precio promedio'
from titles 

-- Mostrar el número de empleados que se tiene 
 select * from employee
select e.pub_id, pub_name, count(*) as 'Número de empleados' 
from employee e join publishers p
on e.pub_id = p.pub_id
group by e.pub_id, pub_name
order by pub_name;

select count(*) as Empleados
from employee 


-- Total de libros vendidos 
select sum(qty) as 'Total de libros vendidos '
from sales 
--muestre cuantos empleados trabajan en cada editorial
--pud_id indica el codigo de la editorial, este es criterio
--de agrupacion

select pub_id, count(*)
from employee
group by pub_id;

select * from sales
order by stor_id;
-- Muestre el total de libros vendidos por tienda 

select * from sales;
select * from stores;
Select sales.stor_id, stor_name, sum(qty) as 'Total libros'
from sales, stores
where sales.stor_id = stores.stor_id
group by sales.stor_id, stor_name; 

-- Muestre cuántos libros hay en cada tipo de libro 

select * from titles 

select type, count(*) as 'NUmero de libros'
from titles 
group by type 

select * from titles;
select * from publishers;

-- Muestre por nombre de editorial, la suma del total anual de libros
-- que se han vendido (ytd_sales) 

select pub_name, sum(ytd_sales) as 'Libros vendidos'
from titles t join publishers p 
on t.pub_id = p.pub_id 
group by pub_name;

-- distinct permite identificar los valores unicos de un
-- campo o columna de la table.

select distinct pub_id 
from titles

select type
from titles;

select distinct type
from titles;
-- Mostrar el promedio de sueldo por hora (job_lvl) 
-- de los empleados, agrupando por nombre de la editorial
-- donde trabajan.

select * from employee;
select * from jobs;

select pub_name, avg(job_lvl) as 'Salario promedio' 
from employee e join publishers p 
on e.pub_id = p.pub_id 
group by pub_name 
order by pub_name;


--- Uso de distinct en funciones de agregación

use pubs
go

select * from titles 

-- Número de registros en la tabla 
select count(*) from titles 

-- Número de tipos diferentes de libros 

select count(distinct type) as 'Tipos de libros' 
from titles 

select  'Tipos de libros' = count(distinct type) 
from titles 

-- Muestre el sueldo mínimo (job_lvl) que tienen los empleados
-- que tienen el job 'Publisher' 
-- La condición where es la que produce la agrupación de registros 
-- sobre los cuales se aplica la función de agregado. 

select 'Sueldo mínimo' = min(job_lvl) 
from employee e join jobs j
on (e.job_id = j.job_id)
where job_desc = 'Publisher' 

-- Muestre el sueldo máximo que se tiene en cada tipo de job (job_id)
-- Incluya el nombre del job (job_desc) 

select e.job_id, job_desc, 'Sueldo máximo'=max(job_lvl) 
from employee e join jobs j
on (e.job_id = j.job_id)
group by e.job_id, job_desc
order by job_desc

-- Incluya el promedio de sueldo y la suma de los sueldos de los empleados 
-- por editorial y dentro de editorial por la descripción del job

select * from stores;
select * from sales;

-- Muestre el numero de libros vendidos por tienda Eric the read books incluyendo el
--nombre de ka tienda.

select stor_name, 'Numero de libros vendidos'= sum(qty)
from stores st join sales sa
on st.stor_id =  sa.stor_id
where st.stor_name = 'Eric the Read Books'
group by stor_name;


-- Cláusula HAVING 
-- Permite establecer un criterio que debe cumplir el resultado 
-- de una función de agregación, para aparecer publicado 

-- Muestre el número de libros que se tiene en cada tipo de libro

select type, 'Número libros'= count(*) 
from titles 
group by type 

-- Muestre el número de libros que se tiene en cada tipo de libro
-- Solo muestre los grupos donde el número de libros es mayor a 4 

select type, 'Número libros'= count(*) 
from titles 
group by type 
having count(*) > 4 

-- Muestre la descripción del trabajo y el sueldo promedio 
-- de los empleados en cada descripción. Solo se muestran los grupos
-- que tengan al menos 3 empleados. 

select job_desc, avg(job_lvl) 
from employee e join jobs j
on e.job_id = j.job_id
group by job_desc 
having count(*) >= 3 

-- Cuando se aplica una condición where, esto condiciona a los registros
-- que se consideran para aplicar la función de agregado. 
-- Cuando se aplica una condición having, esto condiciona a los grupos 
-- que se muestran como resultado. 

-- Muestre la descripción del trabajo y el sueldo promedio 
-- de los empleados en cada descripción. Solo se consideran
-- los registros que tienen más de $10 como job_lvl. 
-- Solo se muestran los grupos que tengan al menos 3 empleados. 

select job_desc, avg(job_lvl) 
from employee e join jobs j
on e.job_id = j.job_id
where job_lvl > 10
group by job_desc 
having count(*) >= 3 

-- Muestre la suma del total de libros vendidos (ytd_sales) 
-- por cada editorial. Solo los grupos que tengan más de 
-- 3 libros se consideran 

select pub_id, sum(ytd_sales) 
from titles 
group by pub_id 
having count(*) > 3

-- EN LA BD PEDIDOS 

-- Muestre el nombre del producto y la suma de unidades de productos incluidos en las órdenes de pedido.

use pedidos 

SELECT * FROM ORDENES; 
SELECT * FROM DETALLE_ORDENES; 
SELECT * FROM PRODUCTOS; 

select descripcion, sum(cantidad) 'Número unidades'
from DETALLE_ORDENES d join PRODUCTOS p
on d.PRODUCTOID = p.PRODUCTOID
group by descripcion
order by descripcion;

-- Muestre el número de órdenes que ha sido atendida por cada empleado. 
-- Muestre el número de órdenes que ha sido atendida por cada empleado. Despliegue solo a los 
-- empleados que han atendido más de 3 órdenes. 
select * from ordenes
select * from EMPLEADOS

select  APELLIDO, NOMBRE, count(*) 'Número de órdenes'
from empleados E join ordenes O
on e.EMPLEADOID = o.EMPLEADOID
group by APELLIDO, NOMBRE  
HAVING COUNT(*) > 3

use pedidos
go
select  'NOMBRE'= RTRIM(APELLIDO) + ' '+ RTRIM(NOMBRE), count(*) 'Número de órdenes'
from empleados E join ordenes O
on e.EMPLEADOID = o.EMPLEADOID
group by RTRIM(APELLIDO) + ' '+ RTRIM(NOMBRE) 
HAVING COUNT(*) > 3

--  BD PUBS. Muestre el número de empleados contratados por año (hire_date). 

USE PUBS 
GO 
select * from EMPLOYEE 
 -- muestre el numero de empleados que fueron contratados por cada año

select 'AÑO'= datepart(yy/*anio*/,hire_date/*criterio*/), 'Número empleados'= count(*) 
from EMPLOYEE 
group by datepart(yy,hire_date)

-- muestre el numero de libros vendidos por cada anio y cada mes del anio
select * from sales;

select datepart(yy/*anio*/,ord_date/*criterio*/) as 'Anio', datepart(mm, ord_date) as 'mes',
sum (qty) as 'libros vendidos'
from sales
group by datepart(yy,ord_date), datepart(mm,ord_date);

--numero de empleados por la primera letra del nombre

select 'letra'= substring(1,1,lname), 'Número empleados'= count(*) 
from EMPLOYEE 
group by substring(1,1,lname)

-- BD PEDIDOS 
-- Cuántas órdenes de pedidos tienen los clientes que son SUPERMERCADOS. 
USE PEDIDOS
GO 

SELECT * FROM ORDENES 
SELECT * FROM CLIENTES 

-- Contaría todas las órdenes que van a SUPERMERCADOS 
SELECT COUNT(*)
FROM ORDENES O JOIN CLIENTES C
ON O.CLIENTEID = C.CLIENTEID 
WHERE NOMBRECIA LIKE 'SUPERMERCADO%'

-- Muestra al cliente y el número de órdenes que tiene. Forma los grupos y restring
-- su presentación 

SELECT NOMBRECIA, COUNT(*)
FROM ORDENES O JOIN CLIENTES C
ON O.CLIENTEID = C.CLIENTEID
GROUP BY NOMBRECIA 
HAVING NOMBRECIA LIKE 'SUPERMERCADO%'

SELECT NOMBRECIA, COUNT(*)
FROM ORDENES O JOIN CLIENTES C
ON O.CLIENTEID = C.CLIENTEID
WHERE NOMBRECIA LIKE 'SUPERMERCADO%'
GROUP BY NOMBRECIA 

-- USO DE LA CLÁUSULA DISTINCT (identificar los valores de columnas una única vez,
-- excluyendo valores repetidos)

-- BD PEDIDOS. Cuántos clientes tienen órdenes de pedidos?

select * from ORDENES

SELECT COUNT(DISTINCT CLIENTEID) AS 'CLIENTES QUE TIENEN ORDENES'
FROM ORDENES 