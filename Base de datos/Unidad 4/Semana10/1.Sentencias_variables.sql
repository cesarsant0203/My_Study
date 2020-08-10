/*SENTENCIAS DE CONTROL DE FLUJO

	Las sentencias de control de flujo permiten al usuario controlar el flujo de ejecución de las sentencias de SQL
	Permiten transformar al SQL en un lenguaje de programación de alto nivel, permitiendo a las sentencias ser conectadas, y relacionadas.
	Las sentencias de control de flujo pueden ser utilizadas en sentencias SQL , en batchs, en procedimientos almacenados, en triggers y transacciones. 

IF .. ELSE

IF expresión_boolean
           	{ bloque de sentencias SQL }
[ELSE [expresión_boolean]
   	{ bloque de sentencias SQL } ]

	IF introduce una condición que determina si la siguiente sentencia es ejecutada
	ELSE introduce una sentencia SQL alternativa que es ejecutada cuando la condición de IF no es satisfecha.

Ejemplo :
*/

/*
IF EXISTS ( SELECT  num_emple FROM empleados
	   WHERE num_emple = 1)
BEGIN
     DELETE empleados
	 WHERE num_emple = 1
	 PRINT 'Empleado encontrado y borrado'
END
ELSE PRINT 'No se encuentra el empleado'
*/
/*
Las sentencias BEGIN ..  END, identifican el inicio y el fin de un bloque de sentencias
Observaciones
Se pueden utilizar construcciones IF…ELSE en lotes, en procedimientos almacenados (en los que se utilizan a menudo estas construcciones para probar la existencia de algún parámetro) y en consultas "ad hoc". 
Las pruebas IF pueden estar anidadas, después de otro IF o a continuación de un ELSE. No hay límite en el número de niveles anidados.

Ejemplos
A. Utilizar un bloque IF…ELSE
En este ejemplo se muestra una condición IF con un bloque de instrucciones. Si el precio promedio del título no es menor de 15 dólares, se imprime el texto: "El precio promedio del título es mayor que 15 dólares".
*/
USE pubs
IF (SELECT AVG(price) FROM titles WHERE type = 'mod_cook') < $15
BEGIN
PRINT 'Los siguientes títulos son libros de cocina excelentes:'
PRINT ' '
SELECT SUBSTRING(title, 1, 35) AS Title, price
FROM titles
WHERE type = 'mod_cook' 
END
ELSE
PRINT ' El precio promedio del título es mayor que 15 dólares'
GO
/*
B. Utilizar más de un bloque IF…ELSE
En este ejemplo se utilizan dos bloques IF. Si el precio promedio del título no es menor de 15 dólares, se imprime el texto: "El precio promedio del título es mayor de 15 dólares". Si el precio promedio de los libros de cocina moderna es mayor que 15 dólares, se ejecuta la instrucción que imprime el mensaje que indica que los libros de cocina moderna son caros.
*/
USE pubs
IF (SELECT AVG(price) FROM titles WHERE type = 'mod_cook') < $15
BEGIN
PRINT 'Los siguientes títulos son libros de cocina excelentes:'
PRINT ' '
SELECT SUBSTRING(title, 1, 35) AS Title
FROM titles
WHERE type = 'mod_cook' 
END
ELSE
IF (SELECT AVG(price) FROM titles WHERE type = 'mod_cook') > $15
BEGIN
PRINT 'Estos libros de cocina moderna son caros:'
PRINT ' '
SELECT SUBSTRING(title, 1, 35) AS Title
FROM titles
WHERE type = 'mod_cook' 
END
/*
CASE 

Evalúa una lista de condiciones y devuelve como resultado una de las distintas expresiones posibles. 

CASE tiene dos formatos: 
•	La función CASE sencilla compara una expresión con un conjunto de expresiones sencillas para determinar el resultado. 
•	La función CASE de búsqueda evalúa un conjunto de expresiones booleanas para determinar el resultado. 

Ambos formatos aceptan el argumento ELSE opcional. 
Ejemplos
A. Utilizar una instrucción SELECT con una función CASE sencilla
En una instrucción SELECT, una función CASE sencilla sólo permite una comprobación de igualdad; no se pueden hacer otras comparaciones. Este ejemplo utiliza la función CASE para modificar la presentación de una clasificación de libros con el fin de hacerla más comprensible.
*/

USE pubs
GO
SELECT Category = 
CASE type
WHEN 'popular_comp' THEN 'Computación Popular'
WHEN 'mod_cook' THEN 'Cocina Moderna'
WHEN 'business' THEN 'Negocios'
WHEN 'psychology' THEN 'Sicología'
WHEN 'trad_cook' THEN 'Cocina Tradicional'
ELSE 'No tiene categoría'
END,
CAST(title AS varchar(25)) AS 'Título corto',
price AS Precio
FROM titles
WHERE price IS NOT NULL
ORDER BY type, price
GO

/*	
B. Utilizar una instrucción SELECT con una función CASE sencilla y otra de búsqueda
En una instrucción SELECT, la función CASE de búsqueda permite sustituir valores en el conjunto de resultados basándose en los valores de comparación. Este ejemplo presenta el precio (una columna money) como comentario basado en el intervalo de precio de cada libro.	
*/

USE pubs
GO
SELECT 'Categoría de precios' = 
CASE 
WHEN price IS NULL THEN 'No tiene precio'
WHEN price < 10 THEN 'Libro barato'
WHEN price >= 10 and price < 20 THEN 'Precio regular'
ELSE 'Libro muy costoso'
END,
CAST(title AS varchar(20)) AS 'Título corto'
FROM titles
ORDER BY price
GO
/*
C. Utilizar CASE con SUBSTRING y SELECT
Este ejemplo utiliza CASE y THEN para producir una lista de autores, los números de identificación de los libros y los tipos de libros que cada autor ha escrito. 
*/

USE pubs
SELECT SUBSTRING((RTRIM(a.au_fname) + ' '+ RTRIM(a.au_lname) + ' '), 1, 25) AS Nombre, a.au_id, ta.title_id,  Type = 
CASE 
WHEN SUBSTRING(ta.title_id, 1, 2) = 'BU' THEN 'Business'
WHEN SUBSTRING(ta.title_id, 1, 2) = 'MC' THEN 'Modern Cooking'
WHEN SUBSTRING(ta.title_id, 1, 2) = 'PC' THEN 'Popular Computing'
WHEN SUBSTRING(ta.title_id, 1, 2) = 'PS' THEN 'Psychology'
WHEN SUBSTRING(ta.title_id, 1, 2) = 'TC' THEN 'Traditional Cooking'
END
FROM titleauthor ta JOIN authors a ON ta.au_id = a.au_id
GO

/*

WHILE  
Establece una condición para la ejecución repetida de una instrucción o bloque de instrucciones de SQL. Las instrucciones se ejecutan repetidamente mientras la condición especificada sea verdadera. Se puede controlar la ejecución de instrucciones en el bucle WHILE con las palabras clave BREAK y CONTINUE.
Sintaxis
WHILE expresiónBooleana 
{instrucciónSQL | bloqueInstrucción}
[BREAK]
{instrucciónSQL | bloqueInstrucción}
[CONTINUE]
Argumentos
expresiónBooleana 
Es una expresión que devuelve TRUE (verdadero) o FALSE (falso). Si la expresión booleana contiene una instrucción SELECT, la instrucción SELECT debe ir entre paréntesis. 
{instrucciónSQL | bloqueInstrucción} 
Se trata de cualquier instrucción o grupo de instrucciones de Transact-SQL definidos con un bloque de instrucciones. Para definir un bloque de instrucciones, utilice las palabras clave de control de flujo BEGIN y END. 
BREAK 
Hace que se salga del bloque WHILE más interno. Se ejecutan las instrucciones que aparecen después de la palabra clave END, que marca el final del bucle. 
CONTINUE 
Hace que se reinicie el bucle WHILE e omite las instrucciones que haya después de la palabra clave CONTINUE. 
Observaciones
Si dos o más bucles WHILE están anidados, la instrucción BREAK interna sale al siguiente bucle más externo. Primero se ejecutan todas las instrucciones que haya después del final del bucle interno y, a continuación, se reinicia el siguiente bucle más externo.
Ejemplo
Utilizar BREAK y CONTINUE con IF…ELSE y WHILE anidados
En este ejemplo, si el promedio de precio es menor de 30 $, el bucle WHILE dobla los precios y, a continuación, selecciona el precio máximo. Si el precio máximo es menor o igual que 50 $, el bucle WHILE se reinicia y dobla los precios de nuevo. Este bucle continúa la duplicación de precios hasta que el precio máximo sea mayor que 50 $ y, a continuación, sale del bucle WHILE e imprime un mensaje.
*/
USE pubs
GO
WHILE (SELECT AVG(price) FROM titles) < $30
BEGIN
UPDATE titles
SET price = price * 2
SELECT MAX(price) FROM titles
IF (SELECT MAX(price) FROM titles) > $50
BREAK
ELSE
CONTINUE
END
PRINT 'Se han actualizado los precios'
/*
GOTO, RETURN Y WAITFOR

	GOTO etiqueta , desvía la ejecución a la etiqueta
	RETURN (expresión entera) , devuelve un valor
	WAITFOR , aplaza una acción por tiempo específico, evento, intervalo

Ejemplos :

Etiqueta_backup :

    WAITFOR TIME '10:00:00'
    EXECUTE backup_system
    PRINT 'BACKUP COMPLETO'
    GOTO Etiqueta_backup
	*/
	/*
DEFINICIÓN DE VARIABLES
VARIABLES LOCALES 

	Se declaran, asignan un valor y utilizan dentro del mismo procedimiento
	Pueden ser utilizadas en sentencias SQL, y como parámetros para PRINT o RAISERROR
	Debe tenerse en cuenta su alcance de batch o bloque de procedimiento

Sintaxis :

DECLARE @nombre_variable  tipo_dato 

Ejemplos :
*/
DECLARE @cadena char(20)
SET @cadena  = 'Es una prueba'
SELECT @cadena
GO


USE pubs
GO
DECLARE @estado char(2)
SET @estado = 'UT'
SELECT RTRIM(au_fname) + ' ' + RTRIM(au_lname) AS 'NOMBRE', state
FROM authors
WHERE state = @estado
GO


USE Pedidos
GO
DECLARE @filas int
SET @filas = (SELECT COUNT(*) FROM Clientes)
SELECT @filas as filas


DECLARE @var INT
SET @var = 1
--GO 
/* con el go @var queda fuera de alcance y no existe más
    esta sentencia da un error de sintaxis por  la referencia a la variable @var */

SELECT *
FROM Empleados
WHERE EmpleadoId = @var
/* debe probar eliminando el go */


/* Se crea la tabla */
CREATE TABLE TablaPrueba (cola INT, colb CHAR(3))
GO
SET NOCOUNT ON
GO
-- Declara la variable Conta
DECLARE @Conta INT
-- Inicializa la variable 
SET @Conta = 0

WHILE (@Conta  < 16)
BEGIN
-- Inserta una fila a la tabla.
INSERT INTO TablaPrueba VALUES
 (@Conta, CHAR( ( @Conta + ASCII('a') ) ))
-- Incrementa la variable 

SET @Conta = @Conta + 1
END
GO
SET NOCOUNT OFF
GO

/*
VARIABLES GLOBALES

	Son suministradas por el sistema, variables predeclaradas
	Preceden de @@nombre  
*/
 select @@CONNECTIONS 
/*
Devuelve el número de conexiones o intentos de conexión desde la última vez que se inició SQL 
Ejemplo:
Este ejemplo muestra el número de intentos de inicio de sesión hasta la fecha y hora actuales.
*/
SELECT GETDATE() AS 'Fecha y hora de hoy', 
@@CONNECTIONS AS 'Intentos de login'
/*
@@CPU_BUSY 
Devuelve el tiempo en milisegundos (basado en la resolución del temporizador del sistema) que la CPU ha estado funcionando desde que se inició SQL Server por última vez.

Para mostrar un informe que contenga varias estadísticas de SQL Server, incluida la actividad de CPU, se ejecuta sp_monitor.
Ejemplos
Este ejemplo muestra la actividad de la CPU para SQL Server hasta la fecha y hora actuales.
*/
SELECT @@CPU_BUSY AS 'CPU miliseg', GETDATE() AS 'Fecha'
/*
@@CURSOR_ROWS 
Devuelve el número de filas seleccionadas que hay actualmente en el último cursor abierto en la conexión..
Ejemplos

En este ejemplo se declara un cursor y se utiliza SELECT para mostrar el valor de @@CURSOR_ROWS.
La opción tiene el valor 0, porque el cursor está abierto y el valor -1 indica que el conjunto de claves del cursor se está rellenando de forma asincrónica.
*/
use pubs
SELECT @@CURSOR_ROWS 
DECLARE cursor_autores CURSOR FOR
SELECT au_lname as APELLIDO FROM authors

OPEN cursor_autores

FETCH NEXT FROM cursor_autores
SELECT @@CURSOR_ROWS
CLOSE cursor_autores
DEALLOCATE cursor_autores
/*
@@DATEFIRST (T-SQL)
Devuelve el valor actual del parámetro SET DATEFIRST, que indica el primer día de la semana: 1 para lunes, 2 para martes y así hasta 7 para el domingo.
Ejemplos
En este ejemplo se establece como primer día de la semana el 5 (viernes) y se supone que el día actual es sábado. La instrucción SELECT devuelve el valor de DATEFIRST y el número del día de la semana actual.
*/
SET DATEFIRST 1
SELECT @@DATEFIRST AS 'Primer día', DATEPART(dw, GETDATE()) AS 'Hoy'
/*
@@DBTS 
Devuelve el valor del tipo de datos timestamp actual de la base de datos actual. Está garantizado que el valor de timestamp es único en la base de datos.
Ejemplos
Este ejemplo devuelve el valor actual de timestamp de la base de datos pubs.
*/
USE pubs
SELECT @@DBTS
/*
@@ERROR 
Devuelve el número de error de la última instrucción Transact-SQL ejecutada.
Cuando SQL completa con éxito la ejecución de una instrucción Transact-SQL,
en @@ERROR se establece el valor 0. Si se produce un error, se devuelve un mensaje de error.
@@ERROR devuelve el número del mensaje de error, hasta que se ejecute otra instrucción Transact-SQL.
Puede ver el texto asociado a un número de error @@ERROR en la tabla de sistema sysmessages.

Al restablecerse @@ERROR con cada instrucción ejecutada, debe comprobarlo inmediatamente después de la instrucción que desea validar o guardarlo en una variable local para examinarlo posteriormente.
Ejemplos

En este ejemplo se utiliza @@ERROR para comprobar si se viola una restricción (error #547) en una instrucción UPDATE.
*/
USE pubs
GO
UPDATE authors SET au_id = '172 32 1176'
WHERE au_id = '172-32-1176'
IF @@ERROR = 547
print 'Ocurrió una violación de check, no cumple la regla'
/*
Este ejemplo depende de la ejecución con éxito de las instrucciones INSERT y DELETE. 
Se establece el valor de @@ERROR en variables locales después de cada instrucción y 
se utilizan las variables en una rutina de tratamiento de errores común para la operación.
*/
USE pubs
GO
DECLARE @del_error int, @ins_error int
BEGIN TRAN
DELETE authors
WHERE au_id = '409-56-7088'
-- Pone el valor de @@ERROR en la variable de control de error en delete , @del_error
SELECT @del_error = @@ERROR

INSERT authors
VALUES('409-56-7088', 'Bennet', 'Abraham', '415 658-9932',
'6223 Bateman St.', 'Berkeley', 'CA', '94705', 1)
-- Pone el valor de @@ERROR en la variable de control de error en insert , @ins_error

SELECT @ins_error = @@ERROR

-- Prueba los valores de error
IF @del_error = 0 AND @ins_error = 0
BEGIN
	-- No hay errores, commit a la transacción
	PRINT 'Se reemplazo la información del autor'
	COMMIT TRAN
END
ELSE
BEGIN
	-- Ocurrió un error,  roll back a la transacción
	IF @del_error <> 0 
		PRINT 'Ocurrió un error en DELETE ' 
	IF @ins_error <> 0
		PRINT 'Ocurrió un error en INSERT ' 
	ROLLBACK TRAN
END
GO
/*
@@FETCH_STATUS 
Devuelve el estado de la última instrucción FETCH de cursor ejecutada sobre cualquier cursor que la conexión haya abierto.

Valor devuelto
Descripción
0	La instrucción FETCH se ejecutó correctamente.
-1	La instrucción FETCH falló o la fila estaba más allá del conjunto de resultados.
-2	Falta la fila recuperada.

Al ser @@FETCH_STATUS global para todos los cursores de una conexión, debe usarse con cuidado. Después de ejecutar una instrucción FETCH, la comprobación de @@FETCH_STATUS se debe realizar antes de que se ejecute otra instrucción FETCH sobre otro cursor. 
El valor de @@FETCH_STATUS no está definido antes de producirse las recuperaciones en la conexión.
Ejemplos
Este ejemplo utiliza @@FETCH_STATUS para controlar las actividades del cursor en un lazo WHILE.
*/
USE Northwind
go
DECLARE Employee_Cursor CURSOR FOR
SELECT LastName, FirstName FROM Employees

OPEN Employee_Cursor
FETCH NEXT FROM Employee_Cursor

WHILE @@FETCH_STATUS = 0
BEGIN
      FETCH NEXT FROM Employee_Cursor
END
CLOSE Employee_Cursor
DEALLOCATE Employee_Cursor
/*
@@IDENTITY 
Devuelve el último valor de identidad insertado. 
Ejemplos
Este ejemplo inserta una fila en una tabla con una columna de identidad y utiliza @@IDENTITY para mostrar el valor de identidad empleado en la nueva fila.
*/
use pubs
INSERT INTO jobs (job_desc,min_lvl,max_lvl) VALUES ('Contador',12,125)
SELECT @@IDENTITY AS 'Identity'
/*
@@IDDLE 
Devuelve el tiempo durante el que SQL Server ha estado inactivo desde su último inicio. El resultado se indica en incrementos de tiempo de la CPU o "pulsos" y es acumulativo para todas las CPU, de modo que puede superar el tiempo transcurrido real. Multiplique por @@TIMETICKS para convertir a microsegundos.
*/
SELECT @@IDLE * CAST(@@TIMETICKS AS FLOAT) AS 'microsegundos inactivo', GETDATE() AS 'fecha'
/*
@@IO_BUSY
Devuelve el tiempo que Microsoft SQL Server ha invertido en realizar operaciones de entrada y salida desde la última vez que se inició SQL Server. El resultado se expresa en incrementos de tiempo de CPU ("pulsos") y se acumula para todas las CPU, por lo que puede superar el tiempo que ha transcurrido realmente. Multiplique por @@TIMETICKS para convertir a microsegundos.
*/
SELECT @@IO_BUSY*@@TIMETICKS AS 'IO microsegundos', GETDATE() AS 'fecha'
/*
@@LANGID
Devuelve el identificador (Id.) de idioma local del idioma que se está utilizando actualmente.
*/
SET LANGUAGE 'English'
SELECT @@LANGID AS 'Language ID'
/*
@@LANGUAGE
Devuelve el nombre del idioma en uso.
*/
SELECT @@LANGUAGE AS 'Language Name';
/*
@@MAX_CONNECTIONS
Devuelve el número máximo de conexiones de usuario simultáneas que se permiten en una instancia de SQL Server. El número devuelto no es necesariamente el número configurado actualmente.
El número real de conexiones de usuario permitidas depende también de la versión de SQL Server instalada, y de los límites de las aplicaciones y del hardware.
*/
SELECT @@MAX_CONNECTIONS AS 'Número máximo de conexiones'

/*
@@ROWCOUNT 
Devuelve el número de filas afectadas por la última instrucción. 
Ejemplos
Este ejemplo ejecuta la instrucción UPDATE y utiliza @@ROWCOUNT para detectar si se ha modificado alguna fila.
*/

UPDATE authors SET au_lname = 'Jones'
WHERE au_id = '999-888-7777'
IF @@ROWCOUNT = 0
print 'No se modificó ninguna fila'
/*
@@SERVERNAME 
Devuelve el nombre del servidor local 
Ejemplo
*/
SELECT @@SERVERNAME


/*
@@TEXTSIZE
Devuelve el valor actual de la opción TEXTSIZE de la instrucción SET. Especifica la longitud máxima, en bytes, de los datos de tipo varchar(max), nvarchar(max), varbinary(max), text o image que devuelve una instrucción SELECT.
*/
SELECT @@TEXTSIZE AS 'Text Size'
SET TEXTSIZE 2048
SELECT @@TEXTSIZE AS 'Text Size'
/*
@@TIMETICKS
Devuelve el número de microsegundos por tic-tac. Devuelve el número de microsegundos por tic-tac.  La cantidad de tiempo por tic-tac depende de cada equipo. Cada tic-tac del sistema operativo dura 31,25 milisegundos o un treintaidosavo de segundo.
*/
SELECT @@TIMETICKS AS 'Time Ticks';
/*
@@TRANCOUNT 
Devuelve el número de transacciones activas en la conexión actual.

@@VERSION
Devuelve la versión, la arquitectura del procesador, la fecha de compilación y el sistema operativo de la instalación actual de SQL Server.
*/
SELECT @@VERSION AS 'Versión de SQL'
