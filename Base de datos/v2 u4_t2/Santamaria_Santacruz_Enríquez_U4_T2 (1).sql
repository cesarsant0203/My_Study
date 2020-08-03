/* -------------------------------------
Ingenieria en Software
Cesar Santacruz
Lizbeth Santamaria
Adriana Enriquez
*/--------------------------------------

USE pedidos
go

--1. Mostrar la lista de empleados por orden de fecha de nacimiento. Debe aparecer, apellido y nombre del empleado (como una sola cadena), fecha de nacimiento (en la forma de un char(12)), y el apellido y nombre de su jefe inmediato (en una sola cadena).  

SELECT cast((RTRIM(e.APELLIDO)+ ' '+e.NOMBRE) as char(60)) AS 'Nombre empleado', cast((e.FECHA_NAC) as char (12)) as 'Fecha de nacimiento',
cast ((RTRIM(j.apellido)+' '+j.nombre) as char(60)) AS 'Nombre de Jefe'
FROM EMPLEADOS e JOIN EMPLEADOS j
ON (j.EMPLEADOID = e.REPORTA_A)
ORDER BY e.FECHA_NAC;

--2. Inserte el registro 

insert into empleados 
(EMPLEADOID, NOMBRE, APELLIDO, FECHA_NAC, REPORTA_A, EXTENSION)
values (8, 'Ana', 'Andrade', '1989/02/05', 2, 222);

--3. Actualice el registro insertado para que el apellido y nombre se cambien a mayúsculas. 

select * from EMPLEADOS

update empleados
set NOMBRE =UPPER(NOMBRE) 
where EMPLEADOID = 8 ;
update empleados
set APELLIDO =UPPER(APELLIDO) 
where EMPLEADOID = 8 ;

--4. Use un SEMI JOIN IZQUIERDO PARA PRESENTAR A TODOS LOS EMPLEADOS, INCLUIDO AQUEL QUE NO TIENE JEFE INMEDIATO 

select * from EMPLEADOS

SELECT e.nombre, e.apellido
FROM empleados e
LEFT JOIN empleados j ON e.NOMBRE = j.NOMBRE and e.APELLIDO = j.APELLIDO
ORDER BY apellido;

--5.  Muestre el nombre de producto (descripcion) y la cantidad de unidades despachadas en las órdenes de pedido, de todos los productos que han tenido un número de unidades vendidas mayor o igual que el máximo de unidades vendidas en su categoría.
SELECT * FROM PRODUCTOS;
SELECT * FROM CATEGORIAS;
SELECT * FROM ORDENES;
SELECT * FROM DETALLE_ORDENES;


--6. Presentar el número de órdenes de pedidos que tiene cada cliente, indicando el nombre de la compañía cliente y el número de órdenes, solo de quienes tengan más de 3 órdenes. 

SELECT * FROM CLIENTES;
SELECT * FROM ORDENES;

select distinct NOMBRECIA, COUNT(O.CLIENTEID)
from CLIENTES c join ORDENES o
on (c.CLIENTEID = o.CLIENTEID)
GROUP BY NOMBRECIA
HAVING COUNT(O.CLIENTEID) >= 3;

--7.  Presentar para cada proveedor el precio promedio de los productos y el número de productos que provee. 

SELECT * FROM PRODUCTOS;
SELECT * FROM PROVEEDORES;

SELECT NOMBREPROV, COUNT(PRODUCTOID) AS 'NUM Productos', AVG(PRECIOUNIT) AS 'Precio promedioProductos'
FROM PROVEEDORES PV JOIN PRODUCTOS PR
ON (PV.PROVEEDORID = PR.PROVEEDORID)
GROUP BY NOMBREPROV;


USE pubs
GO

/* 8. Cuente cu�ntos tipos distintos de libros se tiene. */
select   count(distinct type) as 'Tipos de libros'
from titles

/*9. Muestre el t�tulo y precio de los libros que tengan el precio NULL */
select title, price
from titles
where price is null

/*10. Muestre el id del libro, el t�tulo, el id de la editorial y nombre de la editorial de todos los libros. */
select title_id 'id del libro', title 'titulo', ti.pub_id 'id de la editorial', pub_name 'Nombre de la editorial'
from titles ti join publishers pu
on ti.pub_id = pu.pub_id
order by pub_name

/*11.  Muestre las ventas con el nombre de la tienda, el n�mero de orden, la cantidad 
y el t�tulo del libro*/
select st.stor_name 'Nombre de la tienda', ord_num 'Numero de orden', qty 'Cantidad', title 'Titulo del libro'
from stores st join sales sa
on st.stor_id = sa.stor_id
join titles ti
on sa.title_id = ti.title_id
order by stor_name

/*12. Muestre el apellido y nombre del empleado, el nombre del job que desempe�a 
y el nombre de la editorial donde trabaja. */
select fname 'Apellido', lname 'Nombre', job_desc 'Nombre del trabajo', pub_name 'Editorial donde trabaja'
from employee em join jobs jo
on em.job_id = jo.job_id
join publishers pu
on em.pub_id = pu.pub_id
order by Apellido

/*13. Muestre los empleados que han sido contratados en el a�o 1990*/
select fname 'Apellido', lname 'Nombre', YEAR(hire_date) 'A�o de contratacion'
from employee
where YEAR(hire_date)  LIKE '1990%'
order by hire_date;

/*14. Muestre el apellido y nombre de los empleados y el c�lculo del n�mero de a�os y meses que lleva trabajando*/
select fname 'Apellido', lname 'Nombre',
datediff ( mm, hire_date , GETDATE() )/12 'A�os trabajando',
case
	when (((datediff (month, hire_date , GETDATE())))-(datediff ( YEAR, hire_date , GETDATE() )*12)) < 0 then 12 +(((datediff (month, hire_date , GETDATE())))-(datediff ( YEAR, hire_date , GETDATE() )*12))
	else (((datediff (month, hire_date , GETDATE())))-(datediff ( YEAR, hire_date , GETDATE() )*12))
	END AS 'Meses trabajados'
from employee
order by hire_date

/*15. Muestre los tres primeros caracteres del c�digo del libro y el nombre del libro */
select left(title_id,3) as tres_caracteres, title
from titles


/*16. Muestre el id del libro en 10 caracteres seguido del s�mbolo dos puntos (:)
y el t�tulo del libro; etiquete la columna. Elija los libros cuyo id inicia con la letra P.*/
select 'NOMBRE DEL LIBRO'= RTRIM(title_id)+'0000'+ ' : '+ RTRIM(title)
from titles
where left(title_id,1) = 'P'

/*17. . Muestre en una sola cadena el apellido del empleado en 
mayúsculas, un espacio en blanco seguido de la primera letra del 
nombre y un punto; el número de años que el empleado ha trabajado.  */
select 'NOMBRE'= RTRIM(UPPER(E.lname)) + ' '+ left(E.fname,1)+'.',year(GETDATE()) - datepart(yy,hire_date) as 'numero de años trabajando'
from employee E 
 select datepart(yy, hire_date), lname, fname from employee

/*18. Muestre el total de libros vendidos en cada tienda, indicando el nombre de la tienda.*/
select stor_name, sum(qty) as 'Total de libros vendidos '
from sales s join stores st
on(s.stor_id = st.stor_id)
group by stor_name

/*19.  Muestre el valor total pagado por hora por cada tipo de cargo */
select job_desc, sum(job_lvl) as 'Salario total pagado por hora' 
from employee e join jobs j 
on e.job_id =  j.job_id
group by job_desc
/*20. Se quiere mostrar todos los libros y las ventas totales de cada uno.
Incluir los libros que no han tenido ventas.*/
select title,ISNULL(sum(qty),0)  as 'Total de libros vendidos segun libro'
 from titles t left join sales s
 on(t.title_id = s.title_id)
 group by title