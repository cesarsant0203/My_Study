/*----------------------------------------------------*/
-----------Creado por: Cesar J. Santacruz---------------
/*----------------------------------------------------*/
USE evaluacion
GO

create table cabecera_factura (
	cf_codigo_cliente	int			not null,
	cf_fecha			datetime	not null,
	cf_codigo			int			not null	IDENTITY(1,1),
	cf_total			money		not null,
	cf_estado			varchar(1)	not null
)
GO