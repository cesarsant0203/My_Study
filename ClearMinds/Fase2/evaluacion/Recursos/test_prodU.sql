use evaluacion
go

exec sp_productos 
@i_operacion = 'U', 
@i_codigo = 2, 
@i_nombre = 'Coca-Cola',
@i_precio = 0.55

select * from producto