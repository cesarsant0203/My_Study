-- BASES DE DATOS
-- LABORATORIO: CREACION DE BASES DE DATOS 

-- Dra. Rosa Navarrete

/* A.	Crear una base de datos que especifique un archivos de datos y un archivo de transacciones.
Este ejemplo crea una base de datos llamada Ventas. Debido a que no se utiliza la palabra clave PRIMARY, 
el primer archivo (Ventas_dat) se convierte, de forma predeterminada, en el archivo principal. 
Como no se especifican MB ni KB en el parámetro SIZE del archivo Ventas_dat, de forma predeterminada, 
dicho parámetro indica MB y el tamaño se asigna en megabytes. El tamaño del archivo Ventas_log se asigna 
en megabytes porque se ha indicado explícitamente el sufijo MB en el parámetro SIZE. */

 
USE master
GO
CREATE DATABASE Ventas
ON 
( NAME = Ventas_dat,
FILENAME= 'c:\basesdatos\Ventasdat.mdf', -- reemplazar por una ruta en su PC
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5 )
LOG ON
( NAME = 'Ventas_log',
FILENAME = 'c:\basesdatos\Ventaslog.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB )
GO

/* B.	Múltiples archivos de registro de datos y de transacciones.
Este ejemplo crea una base de datos llamada Personal con tres archivos de datos de 100 MB y dos archivos 
de registro de transacciones de 100 MB. El archivo principal es el primer archivo de la lista y se 
especifica explícitamente con la palabra clave PRIMARY. Los archivos de registro de transacciones 
se especifican a continuación de las palabras clave LOG ON. Las extensiones que se emplean 
para los archivos de la opción FILENAME,son :  .mdf se utiliza para los archivos principales, 
.ndf para los archivos secundarios y .ldf para los archivos de registro de transacciones. */

USE master
GO
CREATE DATABASE Personal
ON
PRIMARY ( NAME = Pers1,
FILENAME = 'c:\bases\data\Persdat1.mdf',
SIZE = 100MB,
MAXSIZE = 200,
FILEGROWTH = 20),
( NAME = Pers2,
FILENAME = 'c:\bases\data\Persdat2.ndf',
SIZE = 100MB,
MAXSIZE = 200,
FILEGROWTH = 20),
( NAME = Pers3,
FILENAME = 'c:\bases\data\Persdat3.ndf',
SIZE = 100MB,
MAXSIZE = 200,
FILEGROWTH = 20)
LOG ON 
( NAME = Perslog1,
FILENAME = 'c:\bases\data\Perslog1.ldf',
SIZE = 100MB,
MAXSIZE = 200,
FILEGROWTH = 20),
( NAME = Archlog2,
FILENAME = 'c:\bases\data\Perslog2.ldf',
SIZE = 100MB,
MAXSIZE = 200,
FILEGROWTH = 20)

/* C.  Crear una base de datos con un único archivo definido

En este ejemplo se crea una base de datos llamada Productos y se especifica un único archivo. 
De forma predeterminada, el archivo especificado se convierte en el archivo principal; 
se crea automáticamente un archivo de registro de transacciones de 1 MB. Como no se especifica 
MB ni KB en el parámetro SIZE del archivo principal, el tamaño del archivo principal se asigna 
en megabytes. El archivo de registro de transacciones no tiene MAXSIZE y puede crecer hasta 
llenar todo el espacio disponible en el disco. */

USE master
GO
CREATE DATABASE Productos
ON 
( NAME = prods_dat,
FILENAME = 'c:\bases\data\prods.mdf',
SIZE = 4,
MAXSIZE = 10,
FILEGROWTH = 1 )
GO

/*D.  Crear una base de datos sin especificar los archivos

Este ejemplo crea una base de datos llamada Ejemplo y crea los archivos principal y de 
registro de transacciones correspondientes. El archivo principal de la base de datos tiene el 
tamaño del archivo principal de la base de datos model. El registro de transacciones tiene el
 tamaño del archivo del registro de transacciones de la base de datos model. 
 Como no se ha especificado MAXSIZE, los archivos pueden crecer hasta llenar todo el espacio disponible en disco.*/

CREATE DATABASE Ejemplo;

/*E.	Crear una base de datos sin especificar SIZE
Este ejemplo crea una base de datos llamada products2. De forma predeterminada, el archivo prods2_dat
se convierte en el archivo principal, con un tamaño igual al tamaño del archivo principal de la base de datos model. 
El archivo de registro de transacciones se crea automáticamente y es un 25 por ciento del tamaño del archivo principal, 
o 512 KB, el que sea mayor. Como no se ha especificado MAXSIZE, los archivos pueden crecer hasta llenar 
todo el espacio disponible en disco.*/

USE master
GO
CREATE DATABASE Products2
ON 
( NAME = prods2_dat,
FILENAME = 'c:\bases\data\prods2.mdf' )
GO

/* F.  Con grupos de archivos
Se crea la BD POLI, con tres grupos de archivos.

- El grupo de archivos principal, con los archivos POLI1_DAT y POLI2_DAT. El incremento se especifica en un 15%
- Un grupo de archivos llamado POLIGR1 con los archivos POLI3_DAT y POLI4_DAT
- Un grupo de archivos llamado POLIGR2 con los archivos POLI5_DAT y POLI6_DAT */
 
CREATE DATABASE POLI
ON PRIMARY
( NAME = POLI1_dat,
FILENAME = 'f:\POLI_bases2\POLI1DAT.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 15% ),
( NAME = POLI2_dat,
FILENAME = 'f:\POLI-bases2\POLI2DAT.ndf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 15% ),

FILEGROUP POLIGR1
( NAME = POLI3_dat,
FILENAME = 'f:\POLI-bases2\POLI3DAT.ndf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5 ),
( NAME = POLI4_dat,
FILENAME = 'f:\POLI-bases2\POLI4DAT.ndf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5 ),

FILEGROUP POLIGR2
( NAME = POLI5_dat,
FILENAME = 'f:\POLI-bases2\POLI5DAT.ndf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5 ),
( NAME = POLI6_dat,
FILENAME = 'f:\POLI-bases2\POLI6DAT.ndf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5 )

LOG ON
( NAME = 'POLI_log',
FILENAME = 'f:\POLI-bases2\POLIlog.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB )
GO


/* G. En el siguiente ejemplo se crea una base de datos conun archivo de datos principal (primary), 
un grupo de archivos definido por el usuario y el archivo de registro. 
El archivo de datos principal está en el grupo de archivos principal 
y el grupo de archivos definido por el usuario tiene dos archivos de datos secundarios. 
Una instrucción ALTER DATABASE hace que el grupo de archivos definido por el usuario sea el 
grupo predeterminado. A continuación, se crea una tabla que especifica el grupo de archivos 
definido por el usuario.*/

USE master;
GO
-- Create the database with the default data
-- filegroup and a log file. Specify the
-- growth increment and the max size for the
-- primary data file. 
CREATE DATABASE MyDB ON PRIMARY
( NAME='MyDB_Primary', 
FILENAME= 'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\data\ MyDB_Prm.mdf',
SIZE=4MB, 
MAXSIZE=10MB, 
FILEGROWTH=1MB),
FILEGROUP MyDB_FG1
( NAME = 'MyDB_FG1_Dat1', 
FILENAME = 'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\data\ MyDB_FG1_1.ndf',
SIZE = 1MB, 
MAXSIZE=10MB, 
FILEGROWTH=1MB),
( NAME = 'MyDB_FG1_Dat2', 
FILENAME = 'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\data\ MyDB_FG1_2.ndf',
SIZE = 1MB, 
MAXSIZE=10MB, 
FILEGROWTH=1MB)
LOG ON
( NAME='MyDB_log', 
FILENAME = 'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\data\ MyDB.ldf',
SIZE=1MB, 
MAXSIZE=10MB, 
FILEGROWTH=1MB);
GO
ALTER DATABASE MyDB
MODIFY FILEGROUP MyDB_FG1 DEFAULT; 
GO

-- Create a table in the user‐defined filegroup. 
USE MyDB;
CREATE TABLE MyTable
( cola int PRIMARY KEY, colb char(8) )
ON MyDB_FG1; 
GO