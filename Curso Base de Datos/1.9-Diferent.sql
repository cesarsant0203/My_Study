use test1;
select * from t_test;
insert into t_test (
nombre,
peso
)
values (
'Daniel',
78
);
select * from t_test where nombre <> 'Cesar';
select * from t_test where comentarios <> ''; 