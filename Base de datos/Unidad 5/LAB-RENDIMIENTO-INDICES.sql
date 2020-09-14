-- BASEES DE DATOS 
-- LAB-USO DE INDICES
-- DRA. ROSA NAVARRETE

use master
go


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create database bdusuarios
go

use bdusuarios
go

drop table Usuarios 

create table Usuarios 
(UsuarioId int identity, Username varchar(20), Password varbinary (50), FechaCreacion datetime, Activo bit)
/* =============================================
 Store Procedure para crear registros en la  tabla Usuarios para pruebas
 Utiliza 'SHA1' como algoritmo hash para realizar  el hash de la entrada
 Se probará para insertar 10.000 registros utilizando  el procedimiento 
almacenado CrearUsuarios,  los usuarios no están activos y su fecha de creación 
 está en los últimos 400 días.
=============================================  */

drop procedure [dbo].[CrearUsuarios]
go

DELETE FROM Usuarios


CREATE PROCEDURE [dbo].[CrearUsuarios]
	@n int,
	@nInactivos int,
	@nDias int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @x INT = 0
	DECLARE @name varchar(20)
	DECLARE @pass varchar(30)
	DECLARE @fecha datetime
	DECLARE @activo bit

	WHILE (@x <  @n)
	BEGIN
		
		SET @name = 'USUARIO' + CAST(@x as varchar)
		SET @pass = 'PASS' + CAST(@x as varchar)
	    SET @activo = (@x % (@n/@nInactivos))
		SET @fecha = DATEADD(DAY,(@n-@X)/@nDias,GETDATE())
		INSERT INTO Usuarios (Username, Password, FechaCreacion,  Activo) 
		VALUES (@name, HASHBYTES('SHA1', 'RN123' + @pass), @fecha, @activo)
		
		SET @x = @x + 1
	END

END
go

select * from Usuarios

exec sp_helptext CrearUsuarios

exec CrearUsuarios 10000, 1000, 600

-- Probar el uso del índice

SELECT Password, Activo FROM Usuarios
WHERE Username = 'Usuario123'

-- Observe el plan de ejecución

/* El costo estimado de la consulta es de 0.648838 y la forma de resolverlo fue un Table Scan, 
lo que implica leer toda la tabla.  
Para obtener más información sobre el acceso a los datos requeridos para resolver la consulta 
ejecutamos lo siguiente, antes de la consulta: 
CHECKPOINT*/

DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS
SET STATISTICS IO ON

SELECT Password, Activo FROM Usuarios
WHERE Username = 'Usuario123'

SET STATISTICS IO OFF

/* Lo primero que pasa al ejecutar esta consulta es que SQL Server escribe todos los cambios 
pendientes al disco, la segunda instrucción elimina todos los datos que tiene en memoria.  
La combinación de estas dos instrucciones obliga a SQL Server a leer todo desde disco nuevamente,  
es importante tener en cuenta que al ejecutar DBCC DropCleanBuffers se produce un fuerte impacto 
en el desempeño de todos los usuarios, por lo que no se debe utilizar en servidores de producción. 
La tercera instrucción nos permite obtener información sobre las lecturas de datos requeridas para 
contestar una consulta. El resultado que se obtiene en la pestaña  de mensajes es: */

/* creando índice */

create unique nonclustered index index_username on Usuarios (Username)

--Volvemos a ejecutar la misma consulta: 


SELECT Password, Activo FROM Usuarios
WHERE Username = 'Usuario123'


-- Volviendo a utilizar: 


CHECKPOINT

DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS
SET STATISTICS IO ON

SELECT Password, Activo FROM Usuarios
WHERE Username = 'Usuario123'

SET STATISTICS IO OFF

/* Veamos otra alternativa, si utilizamos un clustered index en lugar de un 
non-cluster index no será necesario el lookup, por lo que el acceso será más eficiente.
Borramos el índice nonclustered*/

drop index index_username on Usuarios

-- Creamos el índice clustered
create unique clustered index index_username on Usuarios (Username)

-- Y el acceso se ve así: 


CHECKPOINT

DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS
SET STATISTICS IO ON

SELECT Password, Activo FROM Usuarios
WHERE Username = 'Usuario123'

SET STATISTICS IO OFF


/* Como se puede ver el costo de esta consulta ahora es menor, 
casi a la mitad que con el índice non-clustered y en lugar de 4 lecturas lógicas tenemos sólo 3.*/


/* Ejemplo de uso de índices 
La forma más sencilla de ver la diferencia que puede provocar  el uso de  índices es crear una tabla simple 
y ver el plan de ejecución de consultas,  en ambos casos (con y sin el índice).  
Comencemos creando la tabla y agregando algunos valores:  */

CREATE TABLE [dbo].[Datos1](
	[ID] [int] NOT NULL,
	[Numero] [int]NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
)
INSERT INTO Datos1 ([ID],[Numero],[Descripcion]) VALUES (1,1,'D1')
INSERT INTO Datos1 ([ID],[Numero],[Descripcion]) VALUES (2,2,'D2')
INSERT INTO Datos1 ([ID],[Numero],[Descripcion]) VALUES (3,3,'D3')
INSERT INTO Datos1 ([ID],[Numero],[Descripcion]) VALUES (4,4,'D4')

/* Luego iniciaremos una búsqueda y veremos el plan de ejecución. El plan de ejecución 
mostrará de qué manera el query optimizer intentará acceder a los datos durante una consulta, 
(El query optimizer es el encargado de diseñar la estrategia del acceso a los datos).
Existen varias maneras de ver el plan de ejecución, utilizaremos en estos ejemplos la forma grafica.
Luego de haber ejecutado el script previo deberemos escribir lo siguiente en un query analizer:*/

SELECT [ID], [Numero], [Descripcion] FROM Datos1 WHERE ID=1

-- Y luego presionar CTRL+L. Se obtendrá un resultado similar a lo siguiente:
	
/* Los planes de ejecución en formato gráfico deben leerse de izquierda a derecha y de arriba hacia abajo, 
y aunque pueden ser extremadamente largos y complejos de leer, en este caso podemos ver el mismo está 
compuesto por solamente dos iconos y una flecha que los une a ambos. Cada icono representará una operación
y la flecha simbolizará el movimiento de datos entre las dos operaciones, indicándonos que la operación 
“Table Scan” ha tomado los datos que la operación SELECT procesará, en realidad la operación SELECT no ha 
hecho nada en este caso. Este diagrama nos indica que está haciendo internamente el motor de base de datos.*/

CREATE CLUSTERED INDEX IX_1  ON [dbo].[Datos1] (ID)

/*Donde hemos indicado la creación de un índice por la columna “ID”,(la palabra CLUSTERED indicará que la 
tabla se ordenará físicamente por el índice solicitado*/

-- Si volvemos a ejecutar la consulta anterior, el plan de ejecución tomará el siguiente formato:

SELECT [ID], [Numero], [Descripcion] FROM Datos1 WHERE ID=1

/*Indicando que en este caso la búsqueda de datos está utilizando el índice IX_1, de manera que el motor 
ya no debe recorrer toda la tabla para encontrar los registros pedidos.
Podemos ahora preguntarnos que pasaría si además es necesario realizar búsquedas por otro campo, 
supongamos por el campo “Numero”, en este caso no podremos reordenar la tabla físicamente por “Numero”, 
ya que al hacer esto perderíamos el orden físico que ya habíamos establecido por el campo “ID”, 
es claro que el orden físico puede establecerse solo para una clave (ya sea compuesta por un solo o varios campos). 
Para estos casos existen otro tipo de índices conocidos como índices non-clustered, ya que no modifican el orden 
físico de los registros en la tabla original, estos índices guardarán en otra estructura una copia de los valores 
involucrados en la clave y un puntero al registro original de la tabla. 
Para probar lo antes comentado ejecutaremos el siguiente comando:*/

CREATE INDEX IX_2  ON [dbo].[Datos1] (Numero)

/* Luego veremos el plan de la siguiente búsqueda */

SELECT [Numero] FROM Datos1 WHERE [Numero] = 2

/* Donde puede verse que el query optimizer ha decidido utilizar el nuevo índice IX_2. */

/*Si realizara la misma búsqueda pero esta vez con todos los campos, comprobará que el query optimizer habrá 
decidido utilizar el índice IX_1, y no IX_2; esto debido a que como se estableció previamente,  
los índices non-clustered guardan una copia de las claves y un puntero al registro original, de esta manera 
cuando hemos buscado solamente por “Numero” el índice IX_2 es capaz de devolver la información solicitada ya 
que posee el valor de la columna “Numero”, pero cuando hemos pedido otros datos como “ID” y “Descripcion” que 
no existen en IX_2 el query optimizer ha decidido que es menos costoso recorrer la tabla por IX_1 para devolver 
los datos que IX_2 no posee. Cuando un índice non-clustered cubre todos los datos solicitados en la consulta se 
dice que es un covered-index, el caso contrario no será un covered-index y el query optimizer deberá buscar 
alguna estrategia para obtener los datos faltantes, obviamente los clustered index son siempre covered index, 
ya que poseen el registro completo.
El query optimizer puede utilizar otras estrategias para obtener los datos faltantes como veremos a continuación. 
Si ejecutamos el siguiente código:*/

DELETE FROM Datos1;
DECLARE @C int =1
WHILE @C < 10000
BEGIN
	INSERT INTO Datos1 ([ID],[Numero],[Descripcion])
	VALUES (@C,@C + 1,'D1' + cast(@C as nvarchar(10)))
	SET @C+=1
END

-- Donde solamente hemos agregado más datos y volvemos a ejecutar la consulta anterior veremos lo siguiente:

SELECT * FROM Datos1 WHERE [Numero] = 2

/*Ahora el query optimizer ha utilizado nuestro índice IX_2 pero para recuperar los datos faltantes a requerido 
efectuar una operación de Key Lookup extra utilizando el índice IX_1, para finalmente unir los datos en la 
operación Nested Loops. Si creamos un nuevo índice que cubra todos los datos pedidos de la siguiente forma:*/

CREATE INDEX IX_3  ON [dbo].[Datos1] (Numero,ID,Descripcion)
go

SELECT * FROM Datos1 WHERE [Numero] = 2

/*Otra opción para incluir las columnas restantes es utilizar la sentencia INCLUDE de la siguiente forma:*/

CREATE INDEX IX_3 ON [dbo].[Datos1] (Numero)  INCLUDE (Descripcion, ID)

/*En el segundo caso, las columnas son agregadas al índice pero no forman parte del mismo.
En ambos tipos de índices, clustered o non-clustered existe la posibilidad de definirlos como únicos (unique), 
un índice único no admite repetición de valores, y permite una mayor optimización en las búsquedas. 
Las claves primarias de las tablas están compuestas por índices “unique” que pueden ser o no clustered. 
En Sql Server existe además la posibilidad de crear índices filtrados, o sea índices que se aplican 
solo a un grupo de datos. Para probarlo podemos eliminar los índices IX_2 e IX_3 y crear un nuevo índice IX_4 filtrado, 
las siguientes líneas de código efectuan estas operaciones:*/

DROP INDEX IX_2 ON [dbo].[Datos1]
DROP INDEX IX_3 ON [dbo].[Datos1]

CREATE INDEX IX_4 ON [dbo].[Datos1] (Numero,ID,Descripcion) WHERE Numero < 100

/*De esta forma el índice IX_4 será aplicable para algunas condiciones solamente, 
por ejemplo si ejecutamos el siguiente query:*/


SELECT * FROM Datos1 WHERE [Numero] = 99
go

-- El query optimizer ha decidido emplear IX_4 mientras que en el caso de:


SELECT * FROM Datos1 WHERE [Numero] = 100
go


-- Ha optado por usar el índice IX_1. 