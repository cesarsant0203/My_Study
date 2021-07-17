/*----------------------------------------------------*/
-----------Creado por: Cesar J. Santacruz---------------
/*----------------------------------------------------*/
USE evaluacion
GO

create table producto (
	pr_nombre		varchar(50)		not null,
	pr_codigo		int				not null,
	pr_precio		money			not null
)
go
