/*----------------------------------------------------*/
-----------Creado por: Cesar J. Santacruz---------------
/*----------------------------------------------------*/
USE evaluacion
GO

create table cliente (
	cl_codigo		int				not null	IDENTITY(1,1),
	cl_nombre		varchar(100)	not null,
	cl_apellido		varchar(100)	not null,
	cl_cedula		varchar(10)		not null,
	cl_estado		varchar(1)		not null
)
GO