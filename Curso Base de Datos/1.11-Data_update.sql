use test1;
select * from t_test;
update t_test set comentarios='hacia falta' where id_test=8;
update t_test set fecha='2015-05-05' where id_test=8;
update t_test set comentarios='hacia falta',
					fecha='2015-05-05' where id_test=9;