/*----------------------------------------------------*/
-----------Creado por: Cesar J. Santacruz---------------
/*----------------------------------------------------*/

USE evaluacion
GO

/*--REVISA Y SI EXISTE ELIMINA EL SP--*/
IF OBJECT_ID('sp_productos') is not null
	drop procedure sp_productos
GO

/*--CREA EL SP sp_productos--*/
CREATE PROCEDURE sp_productos(
	@i_operacion		varchar(1)	=	null,
	@i_nombre			varchar(100)=	null,
	@i_precio			money		=	null,
	@i_codigo			int			=	null,
	@i_nombre_busqueda	varchar(100)=	null
)
as
print	'ingresa a sp_productos'

declare 
		@w_max				int,
		@w_codigo			int

/*--I - INSERTAR--*/
if @i_operacion = 'I'
	begin
		select @w_max = max(pr_codigo)
		from producto

		if @w_max is null
			select @w_codigo = 1;
		else
			select @w_codigo = @w_max + 1

		if	@i_precio	is null or
			@i_nombre	is null
		begin
			raiserror('Debe ingresar todos los datos',10,5)
			return 4109
		end

		insert into producto(
				pr_codigo,			pr_nombre,			pr_precio)
		values(
				@w_codigo,			@i_nombre,			@i_precio)

		return 0
	end

if @i_operacion = 'U'
	begin
		if	@i_codigo = (	select pr_codigo
							from producto
							where pr_codigo = @i_codigo
						)
			begin
				update producto
				set pr_nombre				= @i_nombre,
					pr_precio				= @i_precio
				where @i_codigo				= pr_codigo
				return 0
			end
		else
			begin
				raiserror('No existe el producto',10,5)
				return 4115
			end
	end

if @i_operacion = 'S'
	begin
		select	pr_nombre
		from	producto
		where	pr_nombre like '%'+ @i_nombre_busqueda +'%'
		return 0
	end
GO