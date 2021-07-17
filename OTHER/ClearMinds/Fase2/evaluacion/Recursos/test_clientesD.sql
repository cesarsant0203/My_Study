Use evaluacion
go

exec sp_clientes
@i_operacion = 'D',
@i_cedula = '0106691361'

exec sp_clientes
@i_operacion = 'D',
@i_cedula = '0106691363'

select * from cliente