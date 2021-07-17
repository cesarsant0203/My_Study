/*----------------------------------------------------*/
-----------Creado por: Cesar J. Santacruz---------------
/*----------------------------------------------------*/

USE evaluacion
GO

/*--REVISA Y SI EXISTE ELIMINA EL SP--*/
IF OBJECT_ID('sp_facturacion') is not null
	drop procedure sp_facturacion
GO

/*--CREA EL SP sp_facturacion--*/
CREATE PROCEDURE sp_facturacion(
	@i_operacion			varchar(1)	=	null,
	@i_codigo_cliente		int			=	null,
	@i_codigo_factura		int			=	null,
	@i_codigo_producto		int			=	null,
	@i_cantidad				int			=	null,
	@i_fecha_desde			datetime	=	null,
	@i_fecha_hasta			datetime	=	null
)
as
print	'ingresa a sp_facturacion'
declare
		@w_precio_producto money

/*--I - INSERTAR--*/
if @i_operacion = 'I'
	begin

		if	@i_codigo_cliente	is null 
		begin
			raiserror('Debe ingresar todos los datos',10,5)
			return 4109
		end
		if @i_codigo_cliente = (select	cl_codigo 
								from	cliente 
								where	cl_codigo	=	@i_codigo_cliente
								)
			begin
				
				insert into cabecera_factura(
						cf_codigo_cliente,			cf_fecha,			cf_total,
						cf_estado)
				values(
						@i_codigo_cliente,			SYSDATETIME(),		0.00,
						(select cl_estado 
						from cliente 
						where cl_codigo		=	@i_codigo_cliente))

				return 0
			end
		else
			begin
				raiserror('No existe el codigo del cliente',10,5)
				return 4111
			end
	end

if @i_operacion = 'D'
	begin

		if	@i_codigo_factura	is null or
			@i_codigo_producto	is null or
			@i_cantidad			is null
		begin
			raiserror('Debe ingresar todos los datos',10,5)
			return 4109
		end

		if @i_codigo_factura = (select	cf_codigo
								from	cabecera_factura 
								where	cf_codigo	=	@i_codigo_factura
								)
			begin
				if @i_codigo_producto = (select	pr_codigo
								from	producto
								where	pr_codigo	=	@i_codigo_producto
								)
					begin
						select @w_precio_producto = (	select pr_precio 
														from producto 
														where pr_codigo		=	@i_codigo_producto
													)
						insert into detalle_factura(
								df_codigo_factura,			df_cantidad,			df_subtotal,
								df_codigo_producto)
						values(
								@i_codigo_factura,			@i_cantidad,			(@i_cantidad * @w_precio_producto),
								@i_codigo_producto)
						update cabecera_factura
						set cf_total = (select sum(df_subtotal) from detalle_factura where @i_codigo_factura = df_codigo_factura)
						where cf_codigo = @i_codigo_factura
						return 0
					end
				else
					begin
						raiserror('No existe el producto',10,5)
						return 4115
					end
			end
		else
			begin
				raiserror('No existe el codigo de la factura',10,5)
				return 4113
			end
	end

if @i_operacion = 'Q'
	begin
		if	@i_codigo_factura	is null
			begin
				raiserror('Debe ingresar todos los datos',10,5)
				return 4109
			end

		if @i_codigo_factura = (select	cf_codigo
										from	cabecera_factura 
										where	cf_codigo	=	@i_codigo_factura
										)
					begin
						select	*
						from	cabecera_factura
						where	cf_codigo = @i_codigo_factura
						select	*
						from	detalle_factura
						where	df_codigo_factura = @i_codigo_factura
						return 0
					end
		else
			begin
				raiserror('No existe el codigo de la factura',10,5)
				return 4113
			end
	end

if @i_operacion = 'S'
	begin
		select	*
		from	cabecera_factura
		where	cf_fecha between @i_fecha_desde and @i_fecha_hasta
		return 0
	end

if @i_operacion = 'C'
	begin
		if	@i_codigo_cliente	is null
			begin
				raiserror('Debe ingresar todos los datos',10,5)
				return 4109
			end

		if @i_codigo_cliente = (select	cl_codigo 
								from	cliente 
								where	cl_codigo	=	@i_codigo_cliente
								)
					begin
						select	*
						from	cabecera_factura
						where	cf_codigo_cliente = @i_codigo_cliente
						return 0
					end
		else
			begin
				raiserror('No existe el codigo del cliente',10,5)
				return 4111
			end
	end
GO