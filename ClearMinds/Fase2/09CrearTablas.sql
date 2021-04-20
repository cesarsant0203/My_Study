if OBJECT_ID('estudiantes') is not null
begin
	drop table estudiantes
	print 'borra la tabla'
end

create table estudiantes(
	es_codigo int not null,
	es_nombre varchar(100) not null,
	es_apellido varchar(100) not null,
	es_segundo_apellido varchar(100) null
)

select * from estudiantes;