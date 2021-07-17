create table t_address (
id_address int(11) not null auto_increment,
id_person int(11) not null,
country varchar(45) default null,
cp varchar(45)default null,
primary key (id_address)
)engine=InnoDB default charset=utf8;
select * from t_address;


create table t_person (
id_person int(11) not null auto_increment,
paternal varchar(45) default null,
maternal varchar(45)default null,
name varchar(45)default null,
primary key (id_person)
)engine=InnoDB auto_increment=3 default charset=utf8;
select * from t_person;
truncate table t_address;

insert into t_person(
paternal,
maternal,
name
)

values(
	'Pico',
	'Enriquez',
	'Andres'
);

-- para referenciar una llave foranea

ALTER TABLE `test1`.`t_address` 
ADD INDEX `fk_IdPersonAddress_idx` (`id_person` ASC) VISIBLE;
;
ALTER TABLE `test1`.`t_address` 
ADD CONSTRAINT `fk_IdPersonAddress`
  FOREIGN KEY (`id_person`)
  REFERENCES `test1`.`t_person` (`id_person`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
