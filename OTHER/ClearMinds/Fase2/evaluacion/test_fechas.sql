/*----------------------------------------------------*/
-----------Creado por: Cesar J. Santacruz---------------
/*----------------------------------------------------*/

USE evaluacion
GO

exec sp_facturacion
						@i_operacion		= 'S',
						@i_fecha_desde		= '2021-03-31 10:01:00.000',
						@i_fecha_hasta		= '2021-03-31 11:10:00.000'
go