use test1;
select * from test1.t_test;
-- para crear una vista
create view t_view_A as select id_test,nombre,peso from t_test;
select * from t_view_A;
create view t_view_B as select id_test,nombre,fecha from t_test;
select * from t_view_B;