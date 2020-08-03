-- BASES DE DATOS 
-- DRA. ROSA NAVARRETE


/* EXAMEN - CONSULTAS SOBRE BASES DE DATOS  */

-- SINTAXIS DE LA SENTENCIA SELECT
-- Sobre la BD PUBS
USE pubs
go

-- 1. Copie y pegue el diagrama SQL de la BD PUBS
-- 2. Muestre el nombre de la tienda, el título del libro y el nombre de la editorial 
-- que ha publicado cada libro vendido en las tiendas. 
-- Presente ordenado por nombre de la tienda. 
select stor_name,title,pub_name
from titles t, stores s, publishers p, sales
where t.title_id = sales.title_id 
and t.pub_id = p.pub_id 
and s.stor_id = sales.stor_id
order by stor_name;


-- 3. Muestre el valor promedio del sueldo por hora que reciben los empleados, agrupados
-- por el nombre del cargo. Sólamente muestre los grupos que tengan más de 5 empleados. 
select job_desc, avg(job_lvl) as 'Sueldo promedio'
from employee e join jobs j
on e.job_id = j.job_id 
group by job_desc 
having  count(*) > 5

-- 4. Muestre el nombre del libro, el número de autores que tiene. Presente ordenado por nombre del libro.
select title, count(*) 'autores para el libro'
from titles t join titleauthor ta
on t.title_id = ta.title_id
group by title
order by title;

-- 5. Muestre el número de libros que se ha vendido en cada mes de cada año. 
select year(ord_date) 'year',
month(ord_date) 'month',
count(*) 'vendidos ese mes'
from sales
group by year(ord_date), month(ord_date)
order by month(ord_date)

-- 6. Muestre el valor total de sueldo por hora que paga cada editorial, sumando el sueldo de todos sus empleados. 
-- Presente ordenado por nombre de la editorial. 
select pub_name, sum(job_lvl) 'sueldo por hora editorial'
from employee em join publishers pub
on em.pub_id = pub.pub_id
group by pub_name
order by pub_name;

