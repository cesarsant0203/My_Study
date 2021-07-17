use evaluacion
go


exec sp_facturacion @i_operacion = 'C', @i_codigo_cliente = 1
exec sp_facturacion @i_operacion = 'C', @i_codigo_cliente = 2