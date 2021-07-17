/* -------------------------------------
Ingenieria en Software
Cesar Santacruz
Lizbeth Santamaria
Adriana Enriquez
*/--------------------------------------

USE pedidos
go

/*1. Mostrar la lista de empleados por orden de fecha de nacimiento.
Debe aparecer, apellido y nombre del empleado (como una sola cadena),
fecha de nacimiento (en la forma de un char(12)), y el apellido y 
nombre de su jefe inmediato (en una sola cadena).*/


/*2. Inserte el registro */
insert into empleados 
(EMPLEADOID, NOMBRE, APELLIDO, FECHA_NAC, REPORTA_A, EXTENSION)
values (8, 'Ana', 'Andrade', '1989/02/05', 2, 222);


/*3. Actualice el registro insertado para que el apellido y nombre se cambien a mayúsculas. */


/*4. Use un SEMI JOIN IZQUIERDO PARA PRESENTAR A TODOS LOS EMPLEADOS, INCLUIDO AQUEL QUE NO TIENE JEFE INMEDIATO */


/*5.  Muestre el nombre de producto (descripcion) y la cantidad de unidades despachadas en las órdenes de pedido,
de todos los productos que han tenido un número de unidades vendidas mayor o igual que el máximo de unidades vendidas en su categoría.*/


/*6. Presentar el número de órdenes de pedidos que tiene cada cliente, indicando el nombre de la compañía cliente y el número de órdenes, solo de quienes tengan más de 3 órdenes. */


/*7.  Presentar para cada proveedor el precio promedio de los productos y el número de productos que provee. */


USE pubs
GO

/* 8. Cuente cuántos tipos distintos de libros se tiene. */
select   count(distinct type) as 'Tipos de libros'
from titles

/*9. Muestre el título y precio de los libros que tengan el precio NULL */
select title, price
from titles
where price is null

/*10. Muestre el id del libro, el título, el id de la editorial y nombre de la editorial de todos los libros. */
select title_id 'id del libro', title 'titulo', ti.pub_id 'id de la editorial', pub_name 'Nombre de la editorial'
from titles ti join publishers pu
on ti.pub_id = pu.pub_id
order by pub_name

/*11.  Muestre las ventas con el nombre de la tienda, el número de orden, la cantidad 
y el título del libro*/
select st.stor_name 'Nombre de la tienda', ord_num 'Numero de orden', qty 'Cantidad', title 'Titulo del libro'
from stores st join sales sa
on st.stor_id = sa.stor_id
join titles ti
on sa.title_id = ti.title_id
order by stor_name

/*12. Muestre el apellido y nombre del empleado, el nombre del job que desempeña 
y el nombre de la editorial donde trabaja. */
select fname 'Apellido', lname 'Nombre', job_desc 'Nombre del trabajo', pub_name 'Editorial donde trabaja'
from employee em join jobs jo
on em.job_id = jo.job_id
join publishers pu
on em.pub_id = pu.pub_id
order by Apellido

/*13. Muestre los empleados que han sido contratados en el año 1990*/
select fname 'Apellido', lname 'Nombre', YEAR(hire_date) 'Año de contratacion'
from employee
where YEAR(hire_date)  LIKE '1990%'
order by hire_date;

/*14. Muestre el apellido y nombre de los empleados y el cálculo del número de años y meses que lleva trabajando*/
select fname 'Apellido', lname 'Nombre',
datediff ( mm, hire_date , GETDATE() )/12 'Años trabajando',
case
	when (((datediff (month, hire_date , GETDATE())))-(datediff ( YEAR, hire_date , GETDATE() )*12)) < 0 then 12 +(((datediff (month, hire_date , GETDATE())))-(datediff ( YEAR, hire_date , GETDATE() )*12))
	else (((datediff (month, hire_date , GETDATE())))-(datediff ( YEAR, hire_date , GETDATE() )*12))
	END AS 'Meses trabajados'
from employee
order by hire_date

/*15. Muestre los tres primeros caracteres del código del libro y el nombre del libro */
SELECT substring(title_id,1,3), title
FROM titles

/*16. Muestre el id del libro en 10 caracteres seguido del símbolo dos puntos (:)
y el título del libro; etiquete la columna. Elija los libros cuyo id inicia con la letra P.*/
select title_id+'0000:' as 'ID del libro', title as 'Titulo'
from titles
where SUBSTRING(title_id,1,1) = 'p'

/*17. Muestre en una sola cadena el apellido del empleado en mayúsculas,
un espacio en blanco seguido de la primera letra del nombre y un punto;
el número de años que el empleado ha trabajado. */
select UPPER(lname)+ ' ' + SUBSTRING(fname,1,1)+'.' as 'Empleado', datediff ( mm, hire_date , GETDATE() )/12 'Años trabajando'
from employee
order by lname

/*18. Muestre el total de libros vendidos en cada tienda, indicando el nombre de la tienda.*/
select sum(qty), stor_name
from titles ti join sales sa
on ti.title_id = sa.title_id
join stores st
on sa.stor_id = st.stor_id
group by stor_name

/*19.  Muestre el valor total pagado por hora por cada tipo de cargo */
select job_desc, promediosueldo
from employee e 
join (select pub_id, sum(job_lvl) as promediosueldo 
      from employee e1
	  group by job_desc) eprom
on (e.pub_id = eprom.pub_id)
join publishers p
on e.pub_id = p.pub_id

/*20. Se quiere mostrar todos los libros y las ventas totales de cada uno.
Incluir los libros que no han tenido ventas.*/
select title, sum(qty) 
from titles ti join sales sa 
on ti.title_id = sa.title_id
group by title
order by title

