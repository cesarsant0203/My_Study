use evaluacion
go


exec sp_facturacion @i_operacion = 'I', @i_codigo_cliente = 1
exec sp_facturacion @i_operacion = 'I', @i_codigo_cliente = 2
exec sp_facturacion @i_operacion = 'I', @i_codigo_cliente = 5

select * from cabecera_factura
