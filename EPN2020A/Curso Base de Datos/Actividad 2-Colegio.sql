use colegio;
create table t_alumno(
N_matricula int not null auto_increment,
a_Nombre varchar(250) default null,
a_fechaNacimiento date default null,
a_Telefono int default null,
primary key(N_matricula)
)engine=InnoDB default charset=utf8;
select * from t_alumno;

create table t_asignatura(
codigo_asignatura int not null auto_increment,
s_Nombre varchar(250) default null,
N_matricula int,
Id_P int,
primary key(codigo_asignatura)
)engine=InnoDB default charset=utf8;
select * from t_asignatura;

create table t_profesor(
Id_P int not null auto_increment,
p_Nombre varchar(250) default null,
p_Especialidad varchar(250) default null,
p_Telefono int default null,
primary key(Id_P)
)engine=InnoDB default charset=utf8;
select * from t_profesor;
-- para seleccionar el maximo id se usa max, se puede usar count tambien
select max(N_matricula) as 'Numero de alumnos registrados' from t_alumno;

select 	ta.a_Nombre as 'Nombre del estudiante',
		ts.s_Nombre as 'Nombre de la asignatura',
        tp.p_Nombre as 'Nombre del profesor'  
        from t_alumno as ta
		inner join t_asignatura as ts
        on ts.N_matricula=ta.N_matricula
		inner join t_profesor as tp
		on tp.Id_P=ts.Id_P;