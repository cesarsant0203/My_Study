use test1;
select * from t_test;
select count(*) as registros from t_test;
select max(peso) as mayorPeso from  t_test;
select min(peso) as menorPeso from  t_test;
select substring(fecha,6,2) as mes from t_test;