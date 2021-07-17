use evaluacion
go


exec sp_productos
@i_operacion = 'I', 
@i_nombre = 'Papas',
@i_precio = 1.50

exec sp_productos 
@i_operacion = 'I',
@i_nombre = 'Cola',
@i_precio = 0.50

exec sp_productos
@i_operacion = 'I', 
@i_nombre = 'Galletas',
@i_precio = 1.30


exec sp_productos
@i_operacion = 'I',
@i_nombre = 'Chicles',
@i_precio = 0.25

exec sp_productos
@i_operacion = 'I',
@i_nombre = 'Gatorade',
@i_precio = 2.50

select * from producto

