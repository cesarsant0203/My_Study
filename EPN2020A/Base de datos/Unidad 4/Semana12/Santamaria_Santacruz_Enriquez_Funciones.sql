/* BASES DE DATOS 
DRA. ROSA NAVARRETE
INTEGRANTES
	LIZBETH SANTAMARIA
	CESAR SANTACRUZ
	ADRIANA ENRIQUEZ
FUNCIONES*/

/*Sobre la BD PUBS*/
USE PUBS
GO

/*1.	Escriba una función escalar para calcular el valor que queda como saldo
luego de haber cubierto el valor advance, con respecto a la venta anual de los libros.
El título del libro ingresa como parámetro. */

SELECT * FROM titles;
GO
--SE CREA LA FUNCION AFTER_SALDO--------------------------------------------------
CREATE FUNCTION AFTER_SALDO (@TITLE_BOOK varchar(80))
	RETURNS MONEY
AS
BEGIN
--SE DECLARA LAS VARIABLES
	DECLARE @ADVANCE		MONEY
	DECLARE @VENTAS_ANUAL	MONEY
	DECLARE @SALDO			MONEY
--SE PRUEBA SI EXISTE EL TITULO
	IF EXISTS (SELECT TITLE_ID FROM TITLES
				WHERE TITLE = @TITLE_BOOK)
		BEGIN
--SE DA VALOR A LAS VARIABLES
			SELECT @ADVANCE = ADVANCE, @VENTAS_ANUAL = YTD_SALES
			FROM TITLES
			WHERE TITLE = @TITLE_BOOK

			SELECT @SALDO = @VENTAS_ANUAL - @ADVANCE
			FROM TITLES
			WHERE TITLE = @TITLE_BOOK
--SE DA VALOR AL RETURN 
			RETURN @SALDO
		END
	RETURN -1
END
GO
------------------------------------------------------------------------------------------
/*
drop FUNCTION AFTER_SALDO
*/

/*Prueba FUNCTION AFTER_SALDO*/
SELECT	TITLE_ID 'ID DEL TITULO',
		TITLE 'TITULO',
		dbo.AFTER_SALDO (TITLE) 'SALDO'
FROM TITLES
GO

/*2.	Escriba una función de tabla en línea que reciba como parámetro el nombre de una
tienda y devuelva la lista de títulos de los libros que se han vendido en esa tienda. */

SELECT * FROM stores
SELECT * FROM titles
GO
--SE CREA LA FUNCION LISTA_TITULOS-------------------------------------------------------
CREATE FUNCTION LISTA_TITULOS (@STORE_NAME varchar(40))
	RETURNS @TAB_LISTA TABLE (	TITLE varchar(80))
AS
BEGIN
	INSERT @TAB_LISTA
	SELECT TITLE
	FROM TITLES T JOIN SALES SA
	ON T.title_id = SA.title_id
	JOIN STORES ST
	ON SA.stor_id = ST.stor_id
	WHERE STOR_NAME = @STORE_NAME

	RETURN
END
GO
------------------------------------------------------------------------------------------
/*
drop FUNCTION LISTA_TITULOS
*/

/*Prueba FUNCTION LISTA_TITULOS*/
SELECT * FROM stores
SELECT * FROM titles
SELECT * FROM LISTA_TITULOS('Bookbeat')
GO

/*3.	Escriba una función de tabla de múltiples instrucciones que recibe como parámetro
el nombre de una editorial y devuelve una tabla que contiene la lista de libros publicados
por la editorial con el total (en dinero) que ha representado la venta anual de cada libro.*/
SELECT * FROM publishers
SELECT * FROM titles
GO
--SE CREA LA FUNCION LISTA_LIBROS-------------------------------------------------------
CREATE FUNCTION LISTA_LIBROS (@PUB_NAME varchar(40))
	RETURNS @TAB_X_PUB TABLE (	TITLE varchar(80), SALES MONEY)
AS
BEGIN
	INSERT @TAB_X_PUB
	SELECT TITLE, YTD_SALES
	FROM TITLES T JOIN PUBLISHERS P
	ON T.pub_id = P.pub_id
	WHERE PUB_NAME = @PUB_NAME

	RETURN
END
GO
------------------------------------------------------------------------------------------
/*
drop FUNCTION LISTA_LIBROS
*/

/*Prueba FUNCTION LISTA_LIBROS*/
SELECT * FROM publishers
SELECT * FROM titles
SELECT * FROM LISTA_LIBROS('New Moon Books')
GO
/*4.	Escriba una función de tabla en línea de múltiples instrucciones que entregue la venta
de una editorial, indicando el tipo de libro y el total vendido de ese tipo (la venta anual por
el precio del libro). La función recibe como parámetro el nombre de la editorial. */
SELECT * FROM publishers
SELECT * FROM titles
SELECT * FROM SALES
GO
--SE CREA LA FUNCION SALES_PUB-------------------------------------------------------
CREATE FUNCTION SALES_PUB (@PUB_NAME varchar(40))
	RETURNS @SALES_X_PUB TABLE (TYPEOFBOOK varchar(40), SALES MONEY)
AS
BEGIN
	DECLARE @TYPE_SALES MONEY
	DECLARE @QTY 	INT
	DECLARE @PRICE  MONEY
	DECLARE @TABLE TABLE (TYPE VARCHAR(40), TOTAL_SALES MONEY, pub_id CHAR(4))
	
	INSERT @TABLE
	SELECT TYPE, SUM(QTY)*PRICE, T.pub_id  FROM TITLES T JOIN SALES SA 
	ON T.title_id = SA.title_id
	JOIN PUBLISHERS PU
	ON PU.pub_id = T.pub_id
	WHERE PUB_NAME = @PUB_NAME
	GROUP BY TYPE, TITLE, T.pub_id, PRICE
	

	INSERT @SALES_X_PUB
	SELECT TYPE, SUM(TOTAL_SALES)
	FROM @TABLE GROUP BY TYPE
	RETURN
END
GO
------------------------------------------------------------------------------------------
/*
drop FUNCTION SALES_PUB
*/

/*Prueba FUNCTION SALES_PUB*/
SELECT * FROM publishers
SELECT * FROM titles
SELECT * FROM sales
SELECT * FROM SALES_PUB ('Binnet & Hardley')
GO

/*Sobre la BD BANCO */
USE BANCO
GO

/*5.	Escriba una función de tabla en línea de múltiples instrucciones que entregue 
la suma de saldo_Efectivo y la suma del saldo_Contable de todas las cuentas. 
Recibe como parámetro el tipo de cuenta (ahorros o corriente). */
SELECT * FROM Cuentas
GO
--SE CREA LA FUNCION SUMA_X_TIPO-------------------------------------------------------
CREATE FUNCTION SUMA_X_TIPO (@TIPO CHAR(10))
	RETURNS @TAB_X_TIPO TABLE (	TIPO varchar(80), SALDO_CONTABLE MONEY, SALDO_EFECTIVO MONEY)
AS
	BEGIN
		INSERT @TAB_X_TIPO
		SELECT TIPO, SUM(saldo_Contable),SUM(saldo_Efectivo)
		FROM Cuentas cu
		WHERE TIPO = @TIPO
		GROUP BY TIPO

		RETURN
	END
GO
------------------------------------------------------------------------------------------
/*
drop FUNCTION SUMA_X_TIPO
*/

/*Prueba FUNCTION SUMA_X_TIPO*/
SELECT * FROM Cuentas
SELECT * FROM SUMA_X_TIPO('Ahorro')
GO
/*6.	Escriba una función escalar que entregue el cálculo del impuesto al valor de capital.
Recibe como parámetro el apellido y nombre de un cliente y entrega el cálculo del 
3% del valor del monto de todos los préstamos que tiene ese cliente.*/
SELECT * FROM clientes;
select * from Prestamos
GO
--SE CREA LA FUNCION CAL_IMP--------------------------------------------------
CREATE FUNCTION CAL_IMP (@NOMBRE varchar(30), @APELLIDO varchar(30))
	RETURNS MONEY
AS
BEGIN
--SE DECLARA LAS VARIABLES
	DECLARE @CODIGO_CLI		MONEY
	DECLARE @MONTO_TOTAL	MONEY
	DECLARE @IMPUESTO		MONEY
--SE PRUEBA SI EXISTE EL CLIENTE
	IF EXISTS (SELECT * FROM Clientes
				WHERE nombre = @NOMBRE  AND apellido = @APELLIDO)
		BEGIN
--SE DA VALOR A LAS VARIABLES
			SELECT @CODIGO_CLI = codCliente
			FROM Clientes
			WHERE nombre = @NOMBRE  AND apellido = @APELLIDO

			SELECT @MONTO_TOTAL = SUM(monto)
			FROM PRESTAMOS JOIN CLIENTES
			ON CLIENTES.codCliente = PRESTAMOS.codCliente
			WHERE nombre = @NOMBRE  AND apellido = @APELLIDO

			SELECT @IMPUESTO = @MONTO_TOTAL*0.03
			FROM Clientes
			WHERE nombre = @NOMBRE  AND apellido = @APELLIDO
--SE DA VALOR AL RETURN 
			RETURN @IMPUESTO
		END
	RETURN -1
END
GO
------------------------------------------------------------------------------------------
/*
drop FUNCTION CAL_IMP
*/

/*Prueba FUNCTION CAL_IMP*/
SELECT * FROM Clientes
SELECT * FROM Prestamos
SELECT	NOMBRE 'NOMBRES DEL CLIENTE',
		APELLIDO 'APELLIDOS DEL CLIENTE',
		dbo.CAL_IMP (NOMBRE,APELLIDO) 'IMPUESTO AL CAPITAL'
FROM CLIENTES
GO
