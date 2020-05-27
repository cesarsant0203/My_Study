--  se necesita dos campos en comun.
use test1;
select * from t_person;
select * from t_address;
select tp.name, ta.country from t_person as tp
inner join t_address as ta
on tp.id_person=ta.id_person;