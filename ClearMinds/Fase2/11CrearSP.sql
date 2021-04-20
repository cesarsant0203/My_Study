/*
	Creado por: Cesar Santacruz
*/

use capacitacion
go

if exists(select 1 from sysobjects where name='sp_estudiantes')
	drop procedure sp_estudiantes
go

create procedure sp_estudiantes(
	@i_codigo		int				= null,
	@i_nombre		varchar(100)	= null,
	@i_apellido		varchar(100)	= null,
	@i_s_apellido	varchar(100)	= null,
	@i_operacion	char(1)			= 'I'
)
as
declare
	@w_codigo	int,
	@w_max		int

print 'ingresa a sp_estudiantes - operacion: '+@i_operacion

if @i_operacion='I'
begin
	select @w_max = max(es_codigo)
	from estudiantes

	if @w_max is null
		select @w_codigo = 1;
	else
		select @w_codigo = @w_max + 1

	print 'insertando en clientes'

	/*if exists(select 1 from estudiantes where es_codigo=@i_codigo)
	begin
		raiserror('Codigo duplicado',10,5)
		return 1200
	end*/

	if @i_nombre is null or @i_apellido is null
	begin
		raiserror('Debe ingresar nombre y apellido',10,5)
		return 3002
	end

	insert into estudiantes(
		es_codigo,	es_nombre,	es_apellido,	es_segundo_apellido)
	values(
		@w_codigo,	@i_nombre,	@i_apellido,	@i_s_apellido)
end

if @i_operacion='U'
begin
	print 'actualizando clientes'

	if @i_nombre is null or @i_apellido is null
	begin
		raiserror('Debe ingresar nombre y apellido',10,5)
		return 3002
	end

	if @i_codigo is null
	begin
		raiserror('Debe enviar codigo',10,5)
		return 3000
	end

	update estudiantes
	set		es_nombre =				@i_nombre,
			es_apellido =			@i_apellido,
			es_segundo_apellido =	@i_s_apellido
	where	es_codigo =				@i_codigo

	if @@ROWCOUNT = 0
	begin
		raiserror('No se actualizo ningun registro',10,5)
		return 3001
	end
end

if @i_operacion='S'
begin
	print 'recuperando en clientes'
	select *
	from estudiantes
end

return 0
-- ********************************

exec sp_estudiantes @i_operacion='I', @i_nombre='Sammy',@i_apellido='Uribe'
exec sp_estudiantes @i_operacion='I', @i_nombre='Sammy',@i_apellido='Uribe'
select * from estudiantes;
select max(es_codigo) from estudiantes;

exec sp_estudiantes @i_codigo = 2, @i_operacion='U', @i_nombre='Samantha',@i_apellido='Nogales'
select * from estudiantes;
declare @w_resultado int
exec @w_resultado = sp_estudiantes @i_operacion='U', @i_nombre='Samantha',@i_apellido='Nogales'
print @w_resultado

declare @w_resultado2 int
exec @w_resultado2 = sp_estudiantes @i_codigo = 9, @i_operacion='U', @i_nombre='Samantha',@i_apellido='Nogales'
print @w_resultado2

declare @w_resultado3 int
exec @w_resultado3 = sp_estudiantes @i_operacion='S'
print @w_resultado3

declare @w_resultado4 int
exec @w_resultado4 = sp_estudiantes @i_operacion='I'
print @w_resultado4