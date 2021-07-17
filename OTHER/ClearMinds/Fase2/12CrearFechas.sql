use capacitacion
go

if OBJECT_ID('sp_transacciones') is not null
	drop procedure sp_transacciones
go

create procedure sp_transacciones(
	--@i_fecha	date,
	@i_fecha varchar(10)	= null,
	@i_fecha_desde date		= null,
	@i_fecha_hasta date		= null,
	@i_monto	money		= null,
	@i_estado	char(1)		= null,
	@i_tipo		char(1)		= null,
	@i_operacion char(1)
)
as
print	'ingresa a sp_transacciones'

declare @w_fecha date

if @i_operacion = 'I'
begin
	if @i_monto is null or @i_estado is null or @i_tipo is null
	begin
		raiserror('Debe ingresar todos los datos',10,5)
		return 3001
	end

	--select @w_fecha = CONVERT(date,@i_fecha,101)

	insert into transacciones(
			tr_monto,	tr_fecha,	tr_tipo,	tr_estado)
	values(
			@i_monto,	GETDATE(),	@i_tipo,	@i_estado)
end

if @i_operacion = 'S'
begin
	select *
	from	transacciones
	where	tr_fecha between @i_fecha_desde and @i_fecha_hasta
end