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

/*2.	Se debe presentar dos ejemplos de uso de STORED PROCEDURES
(que utilicen argumentos de entrada y salida).
Explicar qué hace el SP, mostrar el script incluyendo comentarios
sobre el so de las sentencias y los resultados de ejecución. */
/*
A. Un stored procedure que recibe como parametro de entrada
el id de un cliente y devuelve como salida la ciudad del cliente y su nombre.
*/

SELECT * FROM customers;
-- se crea el SP con sus paramtros de entrada y salida
CREATE OR REPLACE PROCEDURE print_contact(
    in_customer_id in NUMBER,
    out_customer_city out VARCHAR2,
    out_customer_name out VARCHAR2
)
AS BEGIN
-- se gaurda los datos dentro de los parametros
SELECT CITY INTO out_customer_city
FROM CUSTOMERS 
WHERE CUSTOMER_ID = in_customer_id;
SELECT CONTACT_NAME INTO out_customer_NAME 
FROM CUSTOMERS 
WHERE CUSTOMER_ID = in_customer_id;
END;
------------------------------------------------------------------
------------------------------------------------------------------
--	DROP PROCEDURE print_contact
------------------------------------------------------------------
------------------------------------------------------------------

--PRUEBA DE EJECUCION
DECLARE
CTY VARCHAR2(15 BYTE); NME VARCHAR2(30 BYTE);
BEGIN
print_contact(10, CTY, NME);
dbms_output.put_line(CTY);
dbms_output.put_line(NME);
END;

/*
B. Un stored procedure que recibe como parametro de entrada
el id de un producto y devuelve el coste total de la cantidad en
stock de ese producto.
*/

SELECT * FROM products;
-- se crea el SP con sus paramtros de entrada y salida
CREATE OR REPLACE PROCEDURE print_total_left(
    in_product_id in NUMBER,
    in_product_quantity in NUMBER,
    out_total_available out number
)
AS BEGIN
-- si se quiere anadir mas de 10 unidades se lo hace
-- si son menos de 10 no se actualizan y solo calcula el total
IF in_product_quantity < 10 THEN
    SELECT products.unit_price * units_in_stock INTO out_total_available 
    FROM PRODUCTS
    WHERE PRODUCT_ID = in_product_id;
    dbms_output.put_line('Son muy pocas unidades para actualizar');
  ELSE
  -- actualizamos el valor de la cantidad en stock
    UPDATE products SET products.units_in_stock = products.units_in_stock + in_product_quantity;
  -- asignamos al parametro de salida el valor del total
  -- con el nuevo numero en stock
    SELECT products.unit_price * units_in_stock INTO out_total_available 
    FROM PRODUCTS
    WHERE PRODUCT_ID = in_product_id;
    dbms_output.put_line('Se actualizaran las unidades');
  END IF;

END;
------------------------------------------------------------------
------------------------------------------------------------------
--	DROP PROCEDURE print_total_left
------------------------------------------------------------------
------------------------------------------------------------------

--PRUEBA DE EJECUCION
DECLARE
total number; quantity number;
BEGIN
print_total_left(17,24, total,quantity);
dbms_output.put_line('total por vender en stock');
dbms_output.put_line(total);
END;
SELECT * FROM products;

/*3.	Mostrar 2 ejemplos de uso de TRIGGERS. 
Debe explicar que hace el TRIGGER, mostrar el script
incluyendo comentarios sobre el uso de las sentencias y 
probar el TRIGGER de acuerdo a las operaciones con las que se ha asociado. */

/*A. Un trigger que funciona antes de realizar un INSERT o un UPDATE
    la cual verifique que la fecha de ingreso de un empleado no sea mayor
    a la fecha actual del sistema*/
-- se crea el trigger
CREATE TRIGGER TRG_EMP_BIRTHDATE
-- se selecciona al tipo de trigger en este caso
-- un trigger para insert o update del birthdate
BEFORE INSERT OR UPDATE
OF BIRTHDATE
ON EMPLOYEES 
-- referenciamos la que sera la nueva y antigua tabla
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
    if :New.birthdate > trunc(sysdate) then
    -- se ejecuta esta parte del codigo solo si la fecha de birthdate es mas reciente
    -- a la fecha actual
          RAISE_APPLICATION_ERROR (num => -20000, msg => 'Birthdate cannot be in the future');
    end if;
end;
------------------------------------------------------------------
------------------------------------------------------------------
--	DROP TRIGGER TRG_EMP_BIRTHDATE;
------------------------------------------------------------------
------------------------------------------------------------------

--PRUEBA DE EJECUCION
select * from employees;

Insert into EMPLOYEES(EMPLOYEE_ID, LASTNAME, FIRSTNAME,
                    TITLE, TITLE_OF_COURTESY, BIRTHDATE, 
                    HIREDATE, ADDRESS, CITY, POSTAL_CODE,
                    COUNTRY, HOME_PHONE, EXTENSION, PHOTO,
                    NOTES, REPORTS_TO)
Values(10, 'Dunkin', 'Pinky', 'Sales Representative',
'Ms.', TO_DATE('09/02/2021 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
TO_DATE('11/15/2010 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
'7 Houndstooth Rd.', 'London', 'WG2 7LT', 'UK', '(71) 555-4444',
'452', 'anne.jpg', 'Pinky is awesome', 5);

/*B. Un trigger que funciona antes de realizar un INSERT or UPDATE
    la cual verifique que las unidades en stock nunca 
    sean menores a 0 o mayores a 1000*/
-- se crea el trigger
CREATE TRIGGER TRG_PRD_STOCK
-- se selecciona al tipo de trigger en este caso
-- un trigger para insert o update del STOCK
BEFORE INSERT OR UPDATE
OF UNITS_IN_STOCK
ON PRODUCTS 
-- referenciamos la que sera la nueva y antigua tabla
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
    if :New.UNITS_IN_STOCK > 1000 then
    -- se ejecuta esta parte del codigo solo si los productos en stock estan fuera del
    -- rango
          RAISE_APPLICATION_ERROR (num => -20000, msg => 'The units in stock are out of range');
    end if;
    if :New.UNITS_IN_STOCK < 0 then
    -- se ejecuta esta parte del codigo solo si los productos en stock estan fuera del
    -- rango
          RAISE_APPLICATION_ERROR (num => -20000, msg => 'The units in stock are under of range');
    end if;
end;
------------------------------------------------------------------
------------------------------------------------------------------
--	DROP TRIGGER TRG_PRD_STOCK;
------------------------------------------------------------------
------------------------------------------------------------------

--PRUEBA DE EJECUCION
select * from products;

Insert into PRODUCTS
   (PRODUCT_ID, PRODUCT_NAME, SUPPLIER_ID, CATEGORY_ID,
   QUANTITY_PER_UNIT, UNIT_PRICE, UNITS_IN_STOCK,
   UNITS_ON_ORDER, REORDER_LEVEL, DISCONTINUED)
 Values
   (78, 'Queso La queserita', 5, 4, '1 lb pkg.', 
    21, 2200, 30, 30, 'N');
    
/*4.	Mostrar 2 ejemplos de funciones de usuario. 
        Debe explicar que hace la función, mostrar el script incluyendo 
        comentarios sobre el uso de las sentencias y probar la invocación 
        a la función y los resultados de ejecución.*/
        
/*A. Hacer una funcion que reciba el id de una orden y un producto y nos muestre
todos los detalles de la misma esto lo podemos presentar con un select o un 
DBMS_OUTPUT.PUT_LINE*/

--creating function get_complete_order
select * from orders;
select * from order_details;

create or replace FUNCTION get_complete_order(in_order_id IN NUMBER, in_product_id IN NUMBER)
   -- lo que nos va a retornar
   RETURN VARCHAR2 IS person_details VARCHAR2(400);

   BEGIN
   -- el select toma los datos de las tablas que requiere para devolver lo especificado
	  SELECT 'ID de la orden- '||ordenes.order_id ||' '||',Ship via- '||
      ordenes.ship_via ||',Precio unitario- '|| details.unit_price ||
      ', Cantidad- '||details.quantity || ', Total orden- ' ||
      details.unit_price * details.quantity
   -- se guarda dentro de la nueva tabla
      INTO person_details
      FROM orders ordenes, order_details details
      WHERE ordenes.order_id = in_order_id
      AND details.order_id = ordenes.order_id
      AND details.product_id = in_product_id;

      RETURN(person_details);

    END get_complete_order;

SELECT get_complete_order(10248, 11) AS "Order details" FROM DUAL;

/*B. Una funcion que nos permita recibir como parametro de entrada
    el id del producto inicial y el final y nos imprima dentro del
    output la informacion de todos los productos dentro del rango
    que hayamos ingresado. Nos muetra el id del producto, nombre
    del producto, nombre de la empresa, ciudad y categoria*/

--creating function get_until_product
select * from products;
select * from suppliers;
select * from categories;

create or replace FUNCTION get_until_product(in_product_id_first IN NUMBER, 
                                            in_product_id_last IN NUMBER)
   -- lo que nos va a retornar
   RETURN VARCHAR2 IS product_analisis VARCHAR2(400);
   BEGIN
   -- creamos un loop que nos permita mostrar la informacion de n productos
   FOR i IN in_product_id_first .. in_product_id_last LOOP
   -- el select toma los datos de las tablas que requiere para devolver lo especificado
      SELECT 'ID del producto- '|| productos.product_id ||' '||',Nombre del producto- '||
      productos.product_name ||',Nombre de la empresa- '|| proveedores.company_name ||
      ', Ciudad- '|| proveedores.city || ', Categoria- ' || cat.category_name ||
      ', Total Stock $- ' || productos.unit_price * productos.units_in_stock
   -- se guarda dentro de la nueva tabla
      INTO product_analisis
      FROM products productos, suppliers proveedores, categories cat
      WHERE productos.product_id = i
      AND proveedores.supplier_id = productos.supplier_id
      AND cat.category_id = productos.category_id ;
   -- imprimimos en consola la informacion de los n productos
      dbms_output.put_line(product_analisis);
      END LOOP;
      RETURN(0);

    END get_until_product;

SET SERVEROUTPUT ON;
EXECUTE dbms_output.put_line(get_until_product(1, 11));


















create or replace function datails_customers (customer varchar2) return t_table as
  v_ret   t_table;
begin
 -- llamamos al constructor que crea la variable de retorno
    v_ret  := t_table();
 -- Add one record after another to the returned table.
 -- Note: the »table« must be extended before adding
 -- another record:
 --
    v_ret.extend; v_ret(v_ret.count) := t_record(1, 'one'  );
    v_ret.extend; v_ret(v_ret.count) := t_record(2, 'two'  );
    v_ret.extend; v_ret(v_ret.count) := t_record(3, 'three');

 --
 -- Return the record:
 --
    return v_ret;

end return_table;

select * from table(return_table);





























