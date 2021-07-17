use test1;
select * from t_test;
insert into t_test (
	nombre,
	peso,
	comentarios,
	fecha
    )
values(
	'Cesar',
	72.8,
	'Es el creador de todo esto',
	'2000-08-27'
);
select * from t_test where fecha='2018-03-11' or fecha='2000/08/27';
select * from t_test where nombre='Cesar' and fecha='2000/08/27';