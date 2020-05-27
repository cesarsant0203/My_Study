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
