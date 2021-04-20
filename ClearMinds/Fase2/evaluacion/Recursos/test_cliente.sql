use evaluacion
go

--Resultado exitoso
DECLARE @resultado int
exec @resultado = sp_clientes @i_operacion = 'I', @i_nombre = 'Bryan', @i_apellido = 'Vizuete', @i_cedula = '12345678912'
SELECT @resultado as Resultado;
exec sp_clientes @i_operacion = 'I', @i_nombre = 'Juan', @i_apellido = 'Andrade',@i_cedula = '0101683191'
exec sp_clientes @i_operacion = 'I', @i_nombre = 'Carlos', @i_apellido = 'Ponce',@i_cedula = '0300985371'
exec sp_clientes @i_operacion = 'I', @i_nombre = 'Luis', @i_apellido = 'Ochoa',@i_cedula = '0106691363'
exec sp_clientes @i_operacion = 'I', @i_nombre = 'María', @i_apellido = 'Vera',@i_cedula = '0300237914'
select * from cliente
--Cédula repetida

exec @resultado = sp_clientes @i_operacion = 'I',@i_nombre = 'Bryan', @i_apellido = 'Vizuete', @i_cedula = '12345678912'
SELECT @resultado as Resultado;

--Faltan Datos

exec @resultado = sp_clientes 
@i_operacion = 'I', 
@i_apellido = 'Gomez',
@i_cedula = '1712345678'
SELECT @resultado as Resultado;
