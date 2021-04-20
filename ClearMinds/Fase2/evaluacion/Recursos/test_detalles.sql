use evaluacion
go


exec sp_facturacion @i_operacion = 'D', @i_codigo_factura = 1, @i_codigo_producto = 1, @i_cantidad = 2
exec sp_facturacion @i_operacion = 'D', @i_codigo_factura = 1, @i_codigo_producto = 3, @i_cantidad = 1
exec sp_facturacion @i_operacion = 'D', @i_codigo_factura = 2, @i_codigo_producto = 4, @i_cantidad = 3
exec sp_facturacion @i_operacion = 'D', @i_codigo_factura = 8, @i_codigo_producto = 2, @i_cantidad = 2
exec sp_facturacion @i_operacion = 'D', @i_codigo_factura = 1, @i_codigo_producto = 6, @i_cantidad = 2

select * from detalle_factura

