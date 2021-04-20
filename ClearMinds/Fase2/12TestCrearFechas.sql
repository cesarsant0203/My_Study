use capacitacion
go

exec sp_transacciones @i_fecha='2020-1-23', @i_monto=45.23, @i_estado='V', @i_tipo='D', @i_operacion='I'
select * from transacciones

exec sp_transacciones @i_fecha='1-23-2021', @i_monto=49.23, @i_estado='V', @i_tipo='D', @i_operacion='I'
select * from transacciones;

exec sp_transacciones @i_operacion='S', @i_fecha_desde='2021/01/01',@i_fecha_hasta='2021/12/31'
select * from transacciones;

exec sp_transacciones @i_monto=96.27, @i_estado='V', @i_tipo='D', @i_operacion='I'
select * from transacciones

exec sp_transacciones @i_monto=215.33, @i_estado='V', @i_tipo='D', @i_operacion='I'
select * from transacciones