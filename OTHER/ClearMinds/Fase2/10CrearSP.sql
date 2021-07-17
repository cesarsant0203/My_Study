use capacitacion
go

/*
	SP creado por: Cesar Santacruz
*/

if OBJECT_ID('sp_prueba') is not null
	drop procedure sp_prueba
go

if exists(select 1 from sysobjects where name='sp_prueba')
	drop procedure sp_prueba
go

create procedure sp_prueba(
	@i_valor1 varchar(100)='pqr',
	@i_valor2 int,
	@i_valor3 varchar(100)
)
as
print 'ingresando al sp sp_prueba'
print '@i_valor1: '+@i_valor1
print '@i_valor2: '+convert(varchar(10),@i_valor2)
print '@i_valor3: '+@i_valor3
go
/*---------------------------------------*/
exec sp_prueba @i_valor1='abc',@i_valor2=100,@i_valor3='xyz'
go
exec sp_prueba @i_valor2=100,@i_valor3='xyz'
go