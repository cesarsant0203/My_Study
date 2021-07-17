/*----------------------------------------------------*/
-----------Creado por: Cesar J. Santacruz---------------
/*----------------------------------------------------*/
USE evaluacion
GO

create table detalle_factura (
	df_codigo_producto		varchar(5)	not null,
	df_codigo_factura		int			not null,
	df_cantidad				int			not null,
	df_subtotal				money		not null
)
GO