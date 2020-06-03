use test2;
create table t_estudiante (
eMatricula int(11) not null auto_increment,
eNombre varchar(250) not null,
eDireccion varchar(250) default null,
eTelefono int default null,
eCarrera varchar(50)  default null,
primary key (eMatricula)
)engine=InnoDB default charset=utf8;
select * from t_estudiante;


create table t_universidad (
uId int(11) not null auto_increment,
uMateria varchar(45) default null,
uNumMateria int(11) default null,
eMatricula int(11),
primary key (uId)
)engine=InnoDB  default charset=utf8;
select * from t_universidad;

select * from t_estudiante as te
inner join t_universidad as tu
on tu.eMatricula=te.eMatricula;
