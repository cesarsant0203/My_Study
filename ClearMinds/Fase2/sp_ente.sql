/*----------------------------------------------------*/
-----------Creado por: Cesar J. Santacruz---------------
/*----------------------------------------------------*/

/*----------------------------------------------------*/
----- SOBRE COBIS
/*----------------------------------------------------*/
USE cobis
GO

/*----------------------------------------------------*/
-----	     REVISA Y SI EXISTE ELIMINA EL SP
/*----------------------------------------------------*/
IF OBJECT_ID('sp_cliente_dml') is not null
	drop procedure sp_cliente_dml
GO

/*----------------------------------------------------*/
-----	     CREA EL SP sp_cliente_dml
/*----------------------------------------------------*/
CREATE PROCEDURE sp_cliente_dml(
		@i_cedula				varchar(15) = null,
		@i_primer_nombre		varchar(20) = null,
		@i_segundo_nombre		varchar(20) = null,
		@i_primer_apellido		varchar(20) = null,
		@i_segundo_apellido		varchar(20) = null,
		@i_fecha_nac			date		= null,
		@i_operacion			char(1),
		@i_formato_fecha		int			= null,
		@i_codigo_cliente		int			= null,
		@i_fecha_desde			date		= null,
		@i_fecha_hasta			date		= null,
		@i_nombre_busqueda		varchar(80)	= null
)
as
print	'ingresa a sp_cliente_dml'

declare 
		@w_nombre_completo	varchar(100),
		@w_max				int,
		@W_codigo			int

/*----------------------------------------------------*/
-----	     I - INSERTAR
/*----------------------------------------------------*/
if @i_operacion = 'I'
	begin
		select @w_max = max(en_ente)
		from cl_ente

		if @w_max is null
			select @w_codigo = 1;
		else
			select @w_codigo = @w_max + 1

		if	@i_cedula is null or
			@i_primer_nombre is null or
			@i_primer_apellido is null or
			@i_fecha_nac is null
		begin
			raiserror('Debe ingresar todos los datos',10,5)
			return 1300
		end

		if	@i_cedula = (	select en_ced_ruc
							from cl_ente
							where en_ced_ruc = @i_cedula
						)
		begin
			raiserror('Ya existe un cliente con ese numero de documento',10,5)
			return 1302
		end

		begin try
		select @w_nombre_completo =
										@i_primer_nombre				+ ' ' +
										ISNULL(@i_segundo_nombre,  '')	+ ' ' +
										@i_primer_apellido				+ ' ' +
										ISNULL(@i_segundo_apellido,'')

		insert into cl_ente(
				en_ente,				en_ced_ruc,			en_estado,				en_nombre_completo,
				en_nombre_p,			en_nombre_s,		en_apellido_p,			en_apellido_s,
				en_fecha_nacimiento,	en_fecha_creacion,	en_fecha_modificacion)
		values(
				@W_codigo,				@i_cedula,			'V',					@w_nombre_completo,
				@i_primer_nombre,		@i_segundo_nombre,	@i_primer_apellido,		@i_segundo_apellido,
				@i_fecha_nac,			SYSDATETIME(),			null)
		end try
		begin catch
			raiserror	('Hubo un error al insertar',10,5)
			return		1301
		end catch
	end

/*----------------------------------------------------*/
-----	     U - ACTUALIZAR
/*----------------------------------------------------*/
if @i_operacion = 'U'
	begin
		if	@i_cedula = (	select en_ced_ruc
							from cl_ente
							where en_ced_ruc = @i_cedula
						)
		begin
			raiserror('Ya existe un cliente con ese numero de documento',10,5)
			return 1302
		end
		begin tran
		update cl_ente
		set en_ced_ruc				= ISNULL(@i_cedula,en_ced_ruc),
			en_nombre_p				= ISNULL(@i_primer_nombre, en_nombre_p),
			en_nombre_s				= ISNULL(@i_segundo_nombre, en_nombre_s),
			en_apellido_p			= ISNULL(@i_primer_apellido, en_apellido_p),
			en_apellido_s			= ISNULL(@i_segundo_apellido , en_apellido_s),
			en_fecha_nacimiento		= ISNULL(@i_fecha_nac, en_fecha_nacimiento),	
			en_fecha_modificacion	= SYSDATETIME()
		where @i_codigo_cliente		= en_ente
		commit
		begin tran
		update cl_ente
		set en_nombre_completo		= en_nombre_p				+ ' ' +
									  ISNULL(en_nombre_s,  '')	+ ' ' +
									  en_apellido_p				+ ' ' +
									  ISNULL(en_apellido_s,'')
		where @i_codigo_cliente		= en_ente
		commit
	end

/*----------------------------------------------------*/
-----	     D - ELIMINAR
/*----------------------------------------------------*/
if @i_operacion = 'D'
	begin
		update cl_ente
		set		en_estado				= 'D',
				en_fecha_modificacion	= SYSDATETIME()
		where	en_ced_ruc				= @i_cedula or
				en_ente					= @i_codigo_cliente
	end

/*----------------------------------------------------*/
-----	     S - RECUPERAR CLIENTES EN ESTADO V
/*----------------------------------------------------*/
if @i_operacion = 'S'
	begin
		select	en_ente				as 'Codigo de Cliente',
				en_nombre_completo	as 'Nombre Completo',
				en_fecha_nacimiento as 'Fecha de Nacimiento'
		from	cl_ente
		where	en_estado			= 'V'
	end

/*----------------------------------------------------*/
-----	     Q - BUSCAR POR EL NUMERO DE CEDULA
/*----------------------------------------------------*/
if @i_operacion = 'Q'
	begin
		select	en_ente				as 'Codigo de Cliente',
				en_nombre_completo	as 'Nombre Completo',
				en_fecha_nacimiento as 'Fecha de Nacimiento'
		from	cl_ente
		where	en_estado			= 'V' and
				en_ced_ruc			= @i_cedula
	end

/*----------------------------------------------------*/
-----	     A - BUSCAR POR RANGO DE FECHA NACIMIENTO
/*----------------------------------------------------*/
if @i_operacion = 'A'
	begin
		select	en_ente				as 'Codigo de Cliente',
				en_nombre_completo	as 'Nombre Completo',
				en_fecha_nacimiento as 'Fecha de Nacimiento'
		from	cl_ente
		where	en_estado			= 'V' and
				en_fecha_nacimiento between @i_fecha_desde and @i_fecha_hasta
	end

/*----------------------------------------------------*/
-----	     T - BUSCAR POR NOMBRE COMPLETO
/*----------------------------------------------------*/
if @i_operacion = 'T'
	begin
		select	en_ente				as 'Codigo de Cliente',
				en_nombre_completo	as 'Nombre Completo',
				en_fecha_nacimiento as 'Fecha de Nacimiento'
		from	cl_ente
		where	en_estado			= 'V' and
				en_nombre_completo	like '%' + @i_nombre_busqueda + '%'
	end

/*----------------------------------------------------*/
-----	     R - RECUPERAR POR ID
/*----------------------------------------------------*/
if @i_operacion = 'R'
	begin
		select	en_ente				as 'Codigo de Cliente',
				en_nombre_completo	as 'Nombre Completo',
				en_fecha_nacimiento as 'Fecha de Nacimiento'
		from	cl_ente
		where	en_estado			= 'V' and
				en_ente				= @i_codigo_cliente
	end
GO
