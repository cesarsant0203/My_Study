use evaluacion
go


exec sp_consulta_fac 
@i_operacion = 'S',
@i_codigo = 1,
@i_fecha_desde = '2020-08-03',
@i_fecha_hasta = '2022-10-03' 
