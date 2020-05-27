use test1;
create table t_test3(
id_test3 int auto_increment,
name varchar(250),
age int,
date date,
finado boolean,
primary key (id_test3)
);
select * from t_test3;
delete from t_test3 where id_test=2;
truncate table t_test3;