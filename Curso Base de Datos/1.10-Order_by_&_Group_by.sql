use test1;
select * from t_test;
insert into t_test (
nombre,
peso,
comentarios,
fecha
)
values (
'Dani',
78,
'Malo',
'2020-02-02'
);
-- order by - esta clausula ordena numericamente, alfabeticamente o por fechas
select * from t_test order by nombre;
select * from t_test order by fecha;
select * from t_test order by nombre desc;
-- group by - esta ordena grupos de datos iguales
select * from t_test group by nombre; 