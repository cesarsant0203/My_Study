use test1;
select * from t_test;
-- existen 6 tipos de like closure
select * from t_test where comentarios like '%m%';
-- en el codigo superior se busca de la tabla los comentarios que tengan una m
select * from t_test where comentarios like 'H%';
-- en el codigo superior se busca de la tabla los comentarios que comiencen por una H
select * from t_test where comentarios like '%a';
-- en el codigo superior se busca de la tabla los comentarios que terminen en una a
select * from t_test where comentarios like '_a%';
-- en el codigo superior se busca de la tabla los comentarios que la segunda letra sea la a
select * from t_test where comentarios like '_______';
-- en el codigo superior se busca de la tabla los comentarios que tenga 6 letras
select * from t_test where comentarios like '%a%' or comentarios like '%r%';
-- en el codigo superior se busca de la tabla los comentarios que tenga a o r

