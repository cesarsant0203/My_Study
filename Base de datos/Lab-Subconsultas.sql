-- BASES DE DATOS -- 
-- DRA. ROSA NAVARRETE --

--- SUBCONSULTAS ---

USE PUBS
GO

-- Muestre el apellido, nombre y ciudad de los autores que viven en la 
--  misma ciudad que la autora Livia Karsen

SELECT * 
FROM AUTHORS 
WHERE AU_LNAME = 'Karsen' and au_fname = 'Livia'

----
SELECT au_lname, au_fname, city
FROM authors
WHERE city =
 (SELECT city
 FROM authors
 WHERE au_fname = 'Livia'
 AND au_lname = 'Karsen')

 -- Consulta en join de una tabla consigo misma ---

 USE pubs
SELECT au1.au_lname, au1.au_fname, au1.city
FROM authors AS au1
WHERE au1.city =
(SELECT au2.city
FROM authors AS au2
WHERE au2.au_fname = 'Livia'
AND au2.au_lname = 'Karsen')

---
-- Muestre los títulos de los libros con precio superior 
-- al precio mínimo de los libros

select *
from titles

select min(price) as precio_minimo
from titles 

-- selecciona el titulo y precio de los que sean mayores que el minimo
SELECT title, price 
FROM titles
WHERE price >
(SELECT MIN(price)
FROM titles)

--- Muestre los títulos de los libros cuyo precio sea 
-- igual al mínimo precio de los libros 
SELECT title, price 
FROM titles
WHERE price =
(SELECT MIN(price)
FROM titles)

-- Muestre el nombre de los editores que hayan editado 
-- libros de tipo business
select * from titles
select * from publishers

select distinct pub_name
from titles t join publishers p
on t.pub_id = p.pub_id
where type = 'business' 



SELECT pub_name
FROM publishers
WHERE EXISTS
	(SELECT *
	FROM titles
	WHERE pub_id = publishers.pub_id
	AND type = 'business')


-- Muestre el apellido y nombre de los autores que hayan escrito 
-- libros del tipo popular_comp

select *
from authors

select *
from titleauthor ta

select *
from titles

select au_lname, au_fname
from authors a join titleauthor ta
on a.au_id = ta.au_id
join titles t
on ta.title_id = t.title_id
where type = 'popular_comp' 

----
-- Los ejemplos a continuación muestran el uso de subconsultas en 
-- operaciones de insert, delete y update

--  Duplicar el precio de los libros publicados por la 
--  editorial New Moon Books
use pubs

UPDATE titles
SET price = price * 2
WHERE pub_id =
	(SELECT pub_id
	FROM publishers
	WHERE pub_name = 'New Moon Books')

select * from titles 

use pedidos 
go

select * from productos 
select * from PROVEEDORES

-- Incrementar un 10% del precio unitario de los productos 
-- entregados por el proveedor 'Don Diego'

UPDATE PRODUCTOS 
SET PRECIOUNIT= PRECIOUNIT*1.1 WHERE PROVEEDORID IN
(SELECT PROVEEDORID FROM PROVEEDORES WHERE NOMBREPROV='Don Diego')


-- Mostrar los nombres de los productos que tienen un precio
-- unitario mayor que el precio unitario promedio de los 
-- productos. Use subconsultas (subqueries). 

SELECT * FROM PRODUCTOS

SELECT DESCRIPCION, PRECIOUNIT
FROM PRODUCTOS 
WHERE PRECIOUNIT >
	(SELECT AVG(PRECIOUNIT)
	FROM PRODUCTOS)


-- Borrar las ventas de los libros del tipo business
USE PUBS
GO 

SELECT * FROM SALES 

DELETE sales
WHERE title_id IN
	(SELECT title_id
	FROM titles
	WHERE type = 'business')

select * from authors
select *  from titleauthor
select * from titles
USE pubs
SELECT au_lname, au_fname
FROM authors
WHERE au_id IN
	(SELECT au_id
	FROM titleauthor
	WHERE title_id IN
		(SELECT title_id
		FROM titles
		WHERE type = 'popular_comp'))

select * from titleauthor 


-- SUBCONSULTAS CORRELACIONADAS

-- El select de la subconsulta tiene una referencia o correlación
-- al select externo. 

USE pubs
GO

-- Muestre los tipos de libros que son publicados 
-- por más de una editorial


SELECT DISTINCT t1.type
FROM titles t1
WHERE t1.type IN
   (SELECT t2.type
   FROM titles t2
   WHERE t1.pub_id <> t2.pub_id)

select * from titles order by type, pub_id 

-- Muestre los libros publicados por cada editorial 
-- que tienen el precio unitario mayor que el promedio 
-- del precio unitario de los libros publicados por esa editorial 

select pub_id, avg(price) 
from titles 
group by pub_id 

select pub_id, title_id, price 
from titles 
order by pub_id 


select title_id, title, price 
from titles t1
where price > 
  (select avg(price)
   from titles t2
   where t1.pub_id = t2.pub_id) 
order by t1.pub_id

-- Muestre los tipos de libros que tengan el valor máximo
-- de advence superior al doble del advance de ese tipo. 

select * from titles order by type 

SELECT advance, t1.type
FROM titles t1
GROUP BY t1.type, advance
HAVING MAX(t1.advance) >=
   (SELECT AVG(t2.advance)
   FROM titles t2
   WHERE t1.type = t2.type)


--- Ejemplos de uso de subqueries---

-- Usar un subquery en la clásula FROM para incuir una tabla construida en el query 
-- Se utiliza cuando dentro del select se requieren datos agrupados que provendrían de una tabla resumen.

USE PUBS
GO

-- Mostrar el código del libro, el título, el nombre de la editorial y el número de libros que esa editorial 
-- ha publicado para los libros que son del tipo business

select * from titles 
select * from publishers 

select t.title_id, title, pub_name, cantidad 
from publishers p, 
  (select pub_id, COUNT(*) cantidad
  from titles
  group by pub_id) p1,
titles t 
where p.pub_id = t.pub_id
and t.pub_id = p1.pub_id  
and t.type = 'Business'
order by pub_name


-- Mostrar el nombre del empleado, su sueldo y el sueldo promedio de los empleados en 
-- la editorial donde trabaja. 

select * from employee

select fname, lname, job_lvl, pub_name, promediosueldo
from employee e 
join (select pub_id, AVG(job_lvl) as promediosueldo 
      from employee e1
	  group by pub_id) eprom
on (e.pub_id = eprom.pub_id)
join publishers p
on e.pub_id = p.pub_id

-- Ejercicio: En la BD PEDIDOS.
-- Muestre el código del producto, el nombre del producto, el nombre de 
-- su proveedor  y 
-- el precio promedio de los productos entregados por ese proveedor
-- Ordene por nombre de producto.

use pedidos
go

select * from productos
select * from proveedores 

select p.productoid, descripcion, preciounit, precioprom 
from productos p
 join (select p1.PROVEEDORID, avg(preciounit) precioprom
       from productos p1 join proveedores pr
	   on (p1.proveedorid = pr.proveedorid)
	   group by p1.proveedorid) prov1
on p.proveedorid = prov1.proveedorid 

--- USO DE EXISTS y NOT EXISTS


-- Muestre las editoriales que publican libros del tipo business
use pubs
go


SELECT pub_name
FROM publishers
WHERE EXISTS
	(SELECT *
	FROM titles
	WHERE pub_id = publishers.pub_id
	AND type = 'business')

-- 

-- Muestre el nombre de las tiendas que vendieron el libro de código 
-- BU1032.Use un subquery con EXISTS

select * from sales
select * from stores  

select stor_name 
  from stores as st
  where exists
   (select * from sales as s
     where st.stor_id =s.stor_id
     and s.title_id ='BU1032');


-- OPERACIONES DE CONJUNTOS
-- UNION, EXCEPT, INTERSECT 


SELECT * FROM titles ORDER BY type
SELECT * FROM sales ORDER BY title_id
SELECT * FROM stores 


-- Los libros que son de tipo business más los libros que los 
-- ha vendido la editorial Eric the Read Books.

select title_id, title, price 
from titles 
where type = 'business'
UNION ALL
select title_id, title, price 
from titles 
where title_id in 
    (select title_id 
	from sales s
	join stores st
	on s.stor_id = st.stor_id 
	where stor_name = 'Eric the Read Books')

	-- ALL hace que los registros se presenten sin importar si se repiten.


-- Los libros que son de tipo business y que adem?s los ha vendido la editorial Eric the Read Books.


select title_id, title, price 
from titles 
where type = 'business'
INTERSECT 
select title_id, title, price 
from titles 
where title_id in 
    (select title_id 
	from sales s
	join stores st
	on s.stor_id = st.stor_id 
	where stor_name = 'Eric the Read Books')


-- Los libros que son de tipo business PERO QUE NO los ha vendido la editorial Eric the Read Books.


select title_id, title, price 
from titles 
where type = 'business'
EXCEPT 
select title_id, title, price 
from titles 
where title_id in 
    (select title_id 
	from sales s
	join stores st
	on s.stor_id = st.stor_id 
	where stor_name = 'Eric the Read Books')
-------

select title_id, title, price 
from titles 
where title_id in 
    (select title_id 
	from sales s
	join stores st
	on s.stor_id = st.stor_id 
	where stor_name = 'Eric the Read Books')
EXCEPT 
select title_id, title, price 
from titles 
where type = 'business'

