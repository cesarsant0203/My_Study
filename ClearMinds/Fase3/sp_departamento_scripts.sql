/*
	Creado por: Cesar Santacruz
*/

use cobis
go

exec sp_departamento 					@i_operacion='I', 	@i_oficina= 1,			@i_departamento= 5,
										@i_filial = 1, 		@i_o_departamento = 1,	@i_o_oficina= 1, 
										@i_descripcion = 'departamentoCS'
GO
SELECT * FROM cl_departamento
go

exec sp_departamento 					@i_operacion='U', 	@i_oficina= 1,			@i_departamento= 5,
										@i_filial = 1, 		@i_o_departamento = 1,	@i_o_oficina= 1, 
										@i_descripcion = 'departamentoCSSU'
GO
SELECT * FROM cl_departamento
GO

commit

exec sp_departamento 					@i_operacion='D', 	@i_oficina= 1,			@i_departamento= 5
GO
SELECT * FROM cl_departamento
GO

declare @w_resultado2 int
exec @w_resultado2 = sp_departamento 	@i_operacion='S', 	@i_oficina= 1,			@i_departamento= 5,
										@i_filial = 1,		@i_descripcion = 'departamentoCSSU'
print @w_resultado2
GO
SELECT * FROM cl_departamento
GO

declare @w_resultado2 int
exec @w_resultado2 = sp_departamento 	@i_operacion='Q', 	@i_oficina= 1,			@i_departamento= 5
print @w_resultado2
GO
SELECT * FROM cl_departamento
GO

declare @w_resultado2 int
exec @w_resultado2 = sp_departamento 	@i_operacion='H', 	@i_oficina= 1,			@i_departamento= 1,
										@i_tipo = 'A',		@i_modo = 1
print @w_resultado2
GO
SELECT * FROM cl_departamento
GO
