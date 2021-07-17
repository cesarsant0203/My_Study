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
