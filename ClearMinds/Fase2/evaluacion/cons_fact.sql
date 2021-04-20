/*----------------------------------------------------*/
-----------Creado por: Cesar J. Santacruz---------------
/*----------------------------------------------------*/

USE evaluacion
GO

/*--REVISA Y SI EXISTE ELIMINA EL SP--*/
IF OBJECT_ID('sp_consulta_fac') is not null
	drop procedure sp_consulta_fac
GO

/*--CREA EL SP sp_consulta_fac--*/
CREATE PROCEDURE sp_consulta_fac(
	@i_operacion			varchar(1)	=	null,
	@i_codigo				int			=	null,
	@i_fecha_desde			datetime	=	null,
	@i_fecha_hasta			datetime	=	null
)
as
print	'ingresa a sp_consulta_fact'
declare 
		@w_sum				money,
		@w_total			int

if @i_operacion = 'Q'
	begin
		if	@i_codigo	is null
			begin
				raiserror('Debe ingresar todos los datos',10,5)
				return 4109
			end

		if @i_codigo = (select	cf_codigo
										from	cabecera_factura 
										where	cf_codigo	=	@i_codigo
										)
					begin
						select	cl_cedula, cl_nombre, cl_apellido, cf_codigo, cf_fecha
						from	cabecera_factura, cliente
						where	cl_codigo = cf_codigo_cliente and
								cf_codigo = @i_codigo
						select	pr_nombre, df_cantidad, df_subtotal
						from	detalle_factura, producto
						where	pr_codigo = df_codigo_producto and
								df_codigo_factura = @i_codigo
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
		from	cliente, cabecera_factura
		where	cl_codigo = cf_codigo_cliente and
				cf_codigo = @i_codigo and
				cf_fecha between @i_fecha_desde and @i_fecha_hasta
		return 0
	end

if @i_operacion = 'R'
	begin
		select @w_sum = (select sum(df_subtotal) from detalle_factura where @i_codigo = df_codigo_factura)

		select	@w_sum
		return 0
	end

GO