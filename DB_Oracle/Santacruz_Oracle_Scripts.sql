/*b.	Usar ALTER TABLE para borrar y añadir
constraint de FK con las cláusulas ON UPDATE CASCADE ON DELETE CASCADE. 
Probar el uso del FK con update y delete.*/
---1---
ALTER TABLE EMPLOYEES
DROP CONSTRAINT FK_REPORTS_TO;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT FK_REPORTS_TO FOREIGN KEY (REPORTS_TO) REFERENCES EMPLOYEES(EMPLOYEE_ID) ON DELETE CASCADE;
---2---
ALTER TABLE PRODUCTS
DROP CONSTRAINT FK_CATEGORY_ID;

ALTER TABLE PRODUCTS
ADD CONSTRAINT FK_CATEGORY_ID FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES(CATEGORY_ID) ON DELETE CASCADE;
---3---
ALTER TABLE PRODUCTS
DROP CONSTRAINT FK_SUPPLIER_ID;

ALTER TABLE PRODUCTS
ADD CONSTRAINT FK_SUPPLIER_ID FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIERS(SUPPLIER_ID) ON DELETE CASCADE;
---4---
ALTER TABLE ORDERS
DROP CONSTRAINT FK_CUSTOMER_ID;

ALTER TABLE ORDERS
ADD CONSTRAINT FK_CUSTOMER_ID FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)ON DELETE CASCADE;
---5---
ALTER TABLE ORDERS
DROP CONSTRAINT FK_EMPLOYEE_ID ;
    
ALTER TABLE ORDERS
ADD CONSTRAINT FK_EMPLOYEE_ID FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID) ON DELETE CASCADE;
---6---
ALTER TABLE ORDERS
DROP CONSTRAINT FK_SHIPPER_ID ;

ALTER TABLE ORDERS
ADD  CONSTRAINT FK_SHIPPER_ID FOREIGN KEY (SHIP_VIA) REFERENCES SHIPPERS(SHIPPER_ID) ON DELETE CASCADE;
---7---   
ALTER TABLE ORDER_DETAILS
DROP CONSTRAINT FK_ORDER_ID ;
    
ALTER TABLE ORDER_DETAILS
ADD  CONSTRAINT FK_ORDER_ID FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ORDER_ID) ON DELETE CASCADE;
---8--- 
ALTER TABLE ORDER_DETAILS
DROP CONSTRAINT FK_PRODUCT_ID ;
    
ALTER TABLE ORDER_DETAILS
ADD  CONSTRAINT FK_PRODUCT_ID FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID) ON DELETE CASCADE;


-- Probar ejemplos de consultas sobre la BD NORTHWIND, teniendo en cuenta el número mínimo de ejemplos de cada caso que se solicita: 
    
--1) 4 ejemplos de SELECT con cláusula condicional where (incluyendo between, like, in). ?Incluya order by.? 
        -- 1 --
--Muestre el nombre de los productos, la cantidad por unidad y el precio por unidad, cuyo precio unitario este entre 20 y 100
SELECT product_name,quantity_per_unit,unit_price 
from products
where unit_price BETWEEN 20 and 100
order by unit_price;

        -- 2 --
--Muestre el codigo del proveedor, ciudad y nombre de la compañia de proveedores cuyo nombre de contacto inicie con C
SELECT supplier_id, company_name, contact_name, city
from suppliers
where contact_name LIKE 'C%'
order by city;

        -- 3  --
--Mostrar los datos de proveedores de los paises(USA o GERMANY o ITALY)
SELECT * FROM suppliers WHERE country In ('USA', 'Germany', 'Italy')
order by company_name;
        -- 4 --  
--Mostrar el nombre del contacto ,el cargo y numero telefonico de la empresa cliente cuya ciudad sea London 
SELECT  contact_name,contact_title,phone,city 
from customers
where city LIKE 'London'
order by contact_name;

--2) 6 ejemplos de SELECT con uso de funciones integradas sobre tipos de datos  (fecha (3), caracter (2), numérico(1)) 
        -- 1 --
--Mostrar el nombre del remitente y año de envio de las ordenes 
SELECT Ship_name, TO_CHAR (SHIPPED_DATE, 'YYYY') "Año de envio"
FROM ORDERS
order by ship_name;

        -- 2 --
--Mostrar en minuscula el codigo del cliente con codigo igual a 1
SELECT LOWER (CUSTOMER_CODE) "CUSTOMER_CODE-MINUSCULA"
FROM CUSTOMERS
Where customer_id ='1';

        -- 3 --
--Mostrar el nombre completo del empleado, su cargo y un resumen de las notas con los primeros 85 caracteres
SELECT RTRIM(LASTNAME ||' '||FIRSTNAME) "Nombre_Empleado",TITLE,SUBSTR(notes,1,85) "Resumen-Notas"                         
FROM employees
order by  "Nombre_Empleado";

       -- 4 --
--Mostrar el numero de empleados contratados por año
select TO_CHAR (HIREDATE, 'YYYY') "AÑO",  count(*) "Número empleados"
from EMPLOYEES
group by TO_CHAR (HIREDATE, 'YYYY');

        -- 5 --
--Mostrar el nombre del empleado, cargo y edad actual
select RTRIM(LASTNAME ||' '||FIRSTNAME) "Nombre_Empleado",title,to_char(sysdate,'yyyy') - to_char(BIRTHDATE,'yyyy') "Edad de los empleados"
from employees
order by "Nombre_Empleado";
        -- 6 --
--mostrar el codigo del producto y el precio total sin decimales de las ordenes por codigo de producto 
SELECT PRODUCT_ID,sum(TRUNC (unit_price*quantity)) "PRECIO TOTAL POR PRODUCTO"
FROM order_details
group by product_id
ORDER by PRODUCT_ID;

--3) 2 ejemplos de SELECT con uso de la clásula DISTINCT. 
    -- 1 --
--Mostrar los cargos que puede tener un contacto de la empresa cliente
    SELECT DISTINCT contact_title
    from customers
    order by contact_title;
    
    -- 2 --
--Mostrar la ciudad y pais del remitente de las ordenes 
    SELECT DISTINCT SHIP_CITY,SHIP_COUNTRY
    from ORDERS
    order by SHIP_CITY
    
 --4) 4 ejemplos de SELECT con funciones de agregado y cláusula group by  
        -- 1 --
-- Mostrar el precio total de carga por pais
        select ship_country, sum(freight) "Carga"
        from orders
        group by  ship_country
        
        -- 2 --
--Mostrar el cargo y total de empleados por cargo 
        select title, count(*) "Número de empleados"
        from employees
        group by title;

        -- 3 --    
--Mostrar el codigo de la orden y el precio promedio total por orden
        select order_id,ROUND(avg(unit_price*quantity ),2)"Promedio por orden"
        from order_details
        group by order_id
        order by order_id;
        
        -- 4 --
--Mostrar el pais y total de empresas clientes por pais
     select COUNTRY, COUNT(COUNTRY) "NUMERO EMPRESAS CLIENTES"
        from customers
        group by COUNTRY
        order by COUNTRY
        
        
--5) 4 ejemplos de SELECT con cláusula group by y having 
        -- 1 --
-- Muestre la suma del precio de los pedidos 
-- por cada codigo de producto. Solo los grupos que tengan más de 
-- 4000 en el precio total de pedidos(ordenes) 
        SELECT product_id,sum(unit_price*quantity) "Precio total pedidos"
        from order_details
        group by product_id
        having sum(unit_price*quantity) > 4000
        order by "Precio total pedidos";
               
        -- 2 --
-- Muestre el nombre del reminte y el total de ordenes
-- por nombre de remitente. Solo los grupos que tengan más de 
-- 10 ordenes por nombre de remitente. 
        select ship_name,count(ship_name) "Remitentes Totales"
        from orders
        group by ship_name 
        having count(ship_name) > 10 
        order by "Remitentes Totales";
        -- 3 --
-- Muestre el cargo de los contactos de las empresas clientes y el total de contactos
-- por cargo. Solo los grupos que tengan más de 
-- 10 contactos. 
        select contact_title,count(contact_title) "Numero de contactos"
        from customers
        group by contact_title
        having count(contact_title) > 10
        order by "Numero de contactos"

        -- 4 --
--Muestre el pais de los proveedores y el tota de proveedores por pais
-- Solo los grupos que tengan más de 2 paises. 
        select COUNTRY, COUNT(COMPANY_NAME) "NUMERO DE COMPAÑIAS"
        from suppliers
        group by COUNTRY
        having COUNT(COUNTRY) > 2
        order by COUNTRY
        
--6) 4 ejemplos de SELECT con Join. ?Una consulta debe ser un join de tres tablas. 
        -- 1 -- 
--Mostrar el nombre del producto, la categoria a la que pertenece y el nombre de la empresa de proveedores que contiene el producto
    select category_name,product_name,company_name
    from products p join categories c
    on p.category_id = c.category_id
    join suppliers s
    on p.supplier_id = s.supplier_id;
    
    -- 2 --
--Mostrar el codigo de la orden ,el nombre contacto de la empresa cliente y el nombre completo del empleado a cargo 
    select order_id,contact_name,RTRIM(LASTNAME ||' '||FIRSTNAME) "Nombre_Empleado"
    from orders o join customers c
    on o.customer_id = c.customer_id
    join employees e
    on o.employee_id = e.employee_id;
    
    -- 3 --
--Mostrar el nombre del producto, el numero de ordenes por producto y el precio total de la carga por producto 
    SELECT product_name, sum(quantity) "Numero de ordenes", sum(FREIGHT) "Precio total de carga"
    from products p join order_details o
    on p.product_id = o.product_id
    join orders ord
    on ord.order_id = o.order_id
     group by product_name;
    -- 4 --
--  Mostrar el nombre de la compañia de cargadores, el numero total de ordenes por compañia, y el precio total por ordenes
    select s.company_name "Compañias de caragadores",sum(quantity) "Ordenes totales", 
    sum(unit_price*quantity) "Precio total de ordenes"
    from shippers s join orders o
    on s.shipper_id = shipper_id
    join order_details ord
    on ord.order_id=o.order_id
    group by s.company_name;
    
    
-- 7) 4 ejemplos de SELECT con subconsultas anidadas. Dos deben ser subconsultas correlativas.  

-- Muestre los productos que son de la categoria condiments (2) y que ademas los ha vendido la compañia de proveedores "Grandma Kelly's Homestead" .

        -- 1 --
select product_id,product_name, unit_price 
    from products 
    where category_id = '2'
INTERSECT 
select product_id,product_name, unit_price 
    from products 
    where product_id in 
        (select product_id 
            from products p
            join suppliers su
            on p.supplier_id = su.supplier_id 
            where su.company_name = 'Grandma Kelly''s Homestead')
    
    -- 2 --
--1. Muestre las compañias de proveedores que contienen el producto de codigo 48, ademas mostrar el nombre del producto 
--  y el codigo del ordenes del producto 

    select company_name, order_id,product_name
    from SUPPLIERS s join PRODUCTS p
    on (s.supplier_id = p.supplier_id)
    join order_details ord
    on (ord.product_id = p.product_id)
    where PRODUCT_name = 
       (select PRODUCT_name
        from PRODUCTS 
        where PRODUCT_id = 48)
        
        -- 3 --
-- 5.  Encuentre los nombres de los productos que tienen el precio unitario más alto, dentro de los productos de su categoría

select distinct product_name, o.unit_price "Precio unitario maximo"
    from PRODUCTS pr1 join order_details o
    on pr1.product_id = o.product_id
where o.UNIT_PRICE = 
	(select MAX(unit_price) 
         from PRODUCTS pr2
        where pr1.CATEGORY_ID = pr2.CATEGORY_ID) 
        order by "Precio unitario maximo";
     -- 4 --
-- Muestre los tipos de produtos que son pedidos
-- por mas de una compañia cliente
SELECT DISTINCT p1.product_name,customer_code
from products p1 join order_details su
on p1.product_id=su.product_id
join orders o
on o.order_id = su.order_id
join customers cu1
on cu1.customer_id = o.customer_id
WHERE p1.product_name IN
   (SELECT product_name
   from products p2 join order_details su
    on p2.product_id=su.product_id
    join orders o
    on o.order_id = su.order_id
    join customers cu2
    on cu2.customer_id = o.customer_id
   WHERE cu1.customer_id <> cu2.customer_id)
order by product_name

--------------------------
select *FROM categories;
select *FROM products;
select *FROM suppliers;
select *FROM customers;
select *FROM employees;
select *FROM orders;
select *FROM order_details;
select *FROM shippers;

