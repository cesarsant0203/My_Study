/*----------------------------------------------------*/
-----	     SELECT CL_ENTE
/*----------------------------------------------------*/
select *
from cl_ente;

/*----------------------------------------------------*/
-----	     I - INSERTAR
/*----------------------------------------------------*/
declare @w_resultado int
exec	@w_resultado = sp_cliente_dml
									@i_operacion		= 'I',
									@i_cedula			= '1711852515',
									@i_primer_nombre	= 'Maria',
									@i_primer_apellido	= 'Portilla',
									@i_fecha_nac		= '1974/10/27'
print	@w_resultado
select *
from cl_ente;

declare @w_resultado2 int
exec	@w_resultado2 = sp_cliente_dml
									@i_operacion		= 'I',
									@i_cedula			= '1723521017',
									@i_primer_nombre	= 'Cesar',
									@i_segundo_nombre	= 'Joells',
									@i_primer_apellido	= 'Santacruz',
									@i_segundo_apellido = 'Portilla',
									@i_fecha_nac		= '2000-08-28'
print	@w_resultado2
select *
from cl_ente;

declare @w_resultado3 int
exec	@w_resultado3 = sp_cliente_dml
									@i_operacion		= 'I',
									@i_cedula			= '0400895918',
									@i_primer_nombre	= 'Cesar',
									@i_segundo_nombre	= 'Enrique',
									@i_primer_apellido	= 'Santacruz',
									@i_segundo_apellido	= 'Ortega',
									@i_fecha_nac		= '1970/06/25'
print	@w_resultado3
select *
from cl_ente;

declare @w_resultado4 int
exec	@w_resultado4 = sp_cliente_dml
									@i_operacion		= 'I',
									@i_cedula			= '17423443252',
									@i_primer_nombre	= 'Victoooria',
									@i_primer_apellido	= 'Santacrus',
									@i_fecha_nac		= '2003-09-21'
print	@w_resultado4
select *
from cl_ente;
/*----------------------------------------------------*/
-----	     U - ACTUALIZAR
/*----------------------------------------------------*/
declare @w_resultado5 int
exec	@w_resultado5 = sp_cliente_dml
									@i_codigo_cliente	= 2,
									@i_operacion		= 'U',
									--@i_cedula			= '1723521021',
									--@i_primer_nombre	= 'Cesar',
									@i_segundo_nombre	= 'Joel',
									@i_fecha_nac		= '2000-08-27'
print	@w_resultado5
select *
from cl_ente;

declare @w_resultado6 int
exec	@w_resultado6 = sp_cliente_dml
									@i_codigo_cliente	= 4,
									@i_operacion		= 'U',
									@i_primer_nombre	= 'Victoria',
									@i_primer_apellido	= 'Santacruz',
									@i_fecha_nac		= '2003-09-21'
print	@w_resultado6
select *
from cl_ente;

declare @w_resultado7 int
exec	@w_resultado7 = sp_cliente_dml
									@i_codigo_cliente	= 3,
									@i_operacion		= 'U',
									@i_cedula			= '1723521017'								
print	@w_resultado7
select *
from cl_ente;

/*----------------------------------------------------*/
-----	     D - ELIMINAR
/*----------------------------------------------------*/
declare @w_resultado8 int
exec @w_resultado8 = sp_cliente_dml
									@i_codigo_cliente	= 3,
									@i_operacion		= 'D'
print @w_resultado8
select * from cl_ente;

/*----------------------------------------------------*/
-----	     S - RECUPERAR CLIENTES EN ESTADO V
/*----------------------------------------------------*/
declare @w_resultado9 int
exec @w_resultado9 = sp_cliente_dml
									@i_operacion		= 'S'
print @w_resultado9
select * from cl_ente;
/*----------------------------------------------------*/
-----	     Q - BUSCAR POR EL NUMERO DE CEDULA
/*----------------------------------------------------*/
declare @w_resultado10 int
exec @w_resultado10 = sp_cliente_dml
									@i_operacion		= 'Q',
									@i_cedula			= '1723521017'
print @w_resultado10
select * from cl_ente;

/*----------------------------------------------------*/
-----	     A - BUSCAR POR RANGO DE FECHA NACIMIENTO
/*----------------------------------------------------*/
declare @w_resultado11 int
exec @w_resultado11 = sp_cliente_dml
									@i_operacion		= 'A',
									@i_fecha_desde		= '2000/01/01',
									@i_fecha_hasta		= '2004/01/01'
print @w_resultado11
select * from cl_ente;

/*----------------------------------------------------*/
-----	     T - BUSCAR POR NOMBRE COMPLETO
/*----------------------------------------------------*/
declare @w_resultado12 int
exec @w_resultado12 = sp_cliente_dml
									@i_operacion		= 'T',
									@i_nombre_busqueda	= 'ce'
print @w_resultado12
select * from cl_ente;

/*----------------------------------------------------*/
-----	     R - RECUPERAR POR ID
/*----------------------------------------------------*/
declare @w_resultado13 int
exec @w_resultado13 = sp_cliente_dml
									@i_operacion		= 'R',
									@i_codigo_cliente	= 4
print @w_resultado13
select * from cl_ente;