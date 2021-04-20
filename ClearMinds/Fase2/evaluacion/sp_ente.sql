/*----------------------------------------------------*/
-----------Creado por: Cesar J. Santacruz---------------
/*----------------------------------------------------*/

USE evaluacion
GO

/*--REVISA Y SI EXISTE ELIMINA EL SP--*/
IF OBJECT_ID('sp_clientes') is not null
	drop procedure sp_clientes
GO

/*--CREA EL SP sp_clientes--*/
CREATE PROCEDURE sp_clientes(
	@i_operacion	varchar(1)	=	null,
	@i_nombre		varchar(100)=	null,
	@i_apellido		varchar(100)=	null,
	@i_cedula		varchar(10)	=	null
)
as
print	'ingresa a sp_clientes'

/*--I - INSERTAR--*/
if @i_operacion = 'I'
	begin

		if	@i_cedula	is null or
			@i_nombre	is null or
			@i_apellido is null
		begin
			raiserror('Debe ingresar todos los datos',10,5)
			return 4109
		end

		if	@i_cedula = (	select	cl_cedula
							from	cliente
							where	cl_cedula = @i_cedula
						)
		begin
			raiserror('Ya existe un cliente con ese numero de documento',10,5)
			return 4101
		end

		insert into cliente(
				cl_nombre,			cl_apellido,			cl_cedula,		cl_estado)
		values(
				@i_nombre,			@i_apellido,			@i_cedula,		'V')

		return 0
	end

if @i_operacion = 'D'
	begin
	if	@i_cedula = (	select	cl_cedula
							from	cliente
							where	cl_cedula = @i_cedula
						)
		begin
			update cliente
			set		cl_estado				= 'E'
			where	cl_cedula				= @i_cedula
		end
	else
		begin
			raiserror('La cedula ingresada no existe',10,5)
			return 4119
		end
	end
GO