use test1;
-- creacion de tablas
create table t_test(
			id_test int auto_increment,
			nombre varchar(250),
			peso float,
			comentarios text,
			fecha date,
            primary key(id_test)
				);
-- descripcion de tabla 
describe t_test;
-- mostrar tablas
show tables;
show databases;